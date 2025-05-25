# RAG Pipeline implementing GP-QAR
from itertools import combinations
import json 
from langchain_core.output_parsers import StrOutputParser, JsonOutputParser
from langchain_core.prompts import PromptTemplate
from langchain_openai import OpenAIEmbeddings
from langchain.schema import Document
from langchain_community.vectorstores import FAISS
from operator import itemgetter
import os 
import pandas as pd
from pydantic import BaseModel, Field
from qg_sbert import ComputeSBert
import random 
from sqlalchemy import create_engine, text, URL

def no_filter(nodes): 
    return True

def is_similar(nodes): 
    url_object = URL.create(
        "sqlite",
        database="../data/rag_database.db",
    )
    engine = create_engine(url_object)
    query = text(f"""
        SELECT 
            r.id,
            r.reg_description
        FROM
            regs r
        WHERE r.id IN ({(',').join([str(i) for i in nodes])})
    """)
    df = pd.read_sql(query, engine)
    nds = df['reg_description'].tolist()
    if nds: 
        s = ComputeSBert(nds[0], nds[1])
        if s >= 0.7: 
            print('{0} is similar! s = {1}'.format(nodes, s))
            return True 
    
    return False


def is_linked_not_includes(nodes): 
    url_object = URL.create(
        "sqlite",
        database="../data/rag_database.db",
    )
    engine = create_engine(url_object)
    query = text(f"""
        SELECT 
            rt.rel_description
        FROM
            reg_relation rr
            JOIN rel_type rt ON rr.rel_type_id = rt.id
        WHERE 
            rr.from_id = {str(nodes[0])}
            AND rr.to_id = {str(nodes[1])}
            AND rt.rel_description NOT IN ('includes')
    """)
    df = pd.read_sql(query, engine)
    nds = df['rel_description'].tolist()
    if nds: 
        print('{0} is linked! link = {1}'.format(nodes, nds))
        return True 
    return False

#Generic Graph Helpers
#gets a set of random node pairs 
#optionally can pass a list of filters, to filter node pairs by some criteria.
def get_random_node_pairs(size = 20, filters=[no_filter]):
    url_object = URL.create(
        "sqlite",
        database="../data/rag_database.db",
    )
    engine = create_engine(url_object)

    query = text(f"""
        SELECT 
            r.id
        FROM
            regs r
    """)
    df = pd.read_sql(query, engine)

    if df['id'].tolist():
        nodes = df['id'].tolist()
        count = 0
        node_s = []
        while count < size: 
            nodes_a = random.choices(nodes, k=1)
            nodes_b = random.choices(nodes, k=1)
            if nodes_a != nodes_b: 
                node_pair = [nodes_a[0], nodes_b[0]]
                can_add = False
                #if any of the filters hold, we allow adding the node pair
                for f in filters:
                    can_add = can_add or f(node_pair)
                
                if can_add:
                    node_s.append(node_pair)
                    count += 1
        #E = list(zip(df['from_id'].tolist(), df['rel_description'].tolist(), df['to_id'].tolist()))
        return node_s

def get_edges(r=[]): 
    url_object = URL.create(
        "sqlite",
        database="../data/rag_database.db",
    )
    engine = create_engine(url_object)

    if r:
        query = text(f"""
            ;SELECT 
                rr.to_id, 
                rr.from_id, 
                rt.rel_description
            FROM
                reg_relation rr
                INNER JOIN rel_type rt ON rr.rel_type_id = rt.id
            WHERE 
                rt.rel_description IN ({(',').join(["'" + i + "'" for i in r])})
        """)
        df = pd.read_sql(query, engine)
        
    else: #select all edges. 
        query = text(f"""
            SELECT 
                rr.to_id, 
                rr.from_id, 
                rt.rel_description
            FROM
                reg_relation rr
                INNER JOIN rel_type rt ON rr.rel_type_id = rt.id
        """)

        df = pd.read_sql(query, engine)
    if df['to_id'].tolist():
        E = list(zip(df['from_id'].tolist(), df['rel_description'].tolist(), df['to_id'].tolist()))
        return E

def get_random_edge(r = ['refers']): 
    edge_list = get_edges(['refers']) 
    edge = random.choices(edge_list, k=1)[0]
    return edge

def get_all_paths(child_edge_types=['includes'], len_min = 2, len_max=999):
    #print("Computing paths from {0}".format(root))
    #dfs from root node to get all paths 
    stack = [] 

    edges = get_edges(r=child_edge_types) 
    for e in edges: 
        stack.append([[e[0]],[e[0]]])
    paths = [] 
    #stack.append([[root],[root]]) #[[node], [path from root to node]]
    while len(stack) > 0: 
        
        current = stack.pop() 
        children= get_child(current[0][0], r=child_edge_types)
        print(children)
        if len(children) == 0:
            if (len(current[1]) >= len_min and len(current[1]) <= len_max): 
                 paths.append(current[1])
            continue

        for child in children: 
            if len(current[1])+1 <= len_max and (child not in current[1]): 
                stack.append([[child], current[1]+[child]])
            elif len(current[1])+1 > len_max: 
                paths.append(current[1])
    
    return paths

def get_all_connected_subgraphs(k, edge_types=['includes']):
    edges = get_edges(r=edge_types)
    edge_combinations = combinations(edges, k-1)
    sglist = []
    for ec in edge_combinations: 
        nodes = set()
        for e in ec: 
            nodes.add(e[0])
            nodes.add(e[2])

        if len(nodes) == len(ec) + 1: #connected tree 
            sglist.append(list(nodes))
    
    return sglist

def is_connected(subgraph_nodes, edge_types=['includes']): 
    visited = set() 
    dfs(list(subgraph_nodes)[0], subgraph_nodes, edge_types, visited)
    if set(subgraph_nodes).intersection(visited) == subgraph_nodes:
        return True 
    
    return False

def dfs(node, subgraph_nodes, edge_types=['includes'], visited=set()):
    visited.add(node) 
    children_1 = set(get_child(node,children_handler=default_children_handler, r=edge_types))
    parent_1 = get_parent(node,parent_handler=default_children_handler, r=edge_types)
    children_1 = children_1.union(parent_1)
    children = children_1.intersection(subgraph_nodes)
    for c in children: 
        if c not in visited: 
            dfs(c, subgraph_nodes, edge_types, visited)

#creates a path based on a child_handler function
def get_path(root, child_handler, child_edge_types=['includes'], len_min = 1, len_max=999): 
    current = [root]
    path = []
    while current != []: 
        path.append(current[0]) 
        current = get_child(current[0], child_handler, r=child_edge_types)
        if current in path: 
            #cycle 
            break

    #check if path length within set bounds 
    if len(path) > len_max or len(path) < len_min:
        return []
    
    return path

#returns the path to the given leaf node (exluding the leaf node)
def get_path_reverse(leaf): 
    current = [leaf]
    path_rev = []
    while current != []: 
        #print(current)
        path_rev.append(current) 
        current = get_parent(current[0], r=['includes'])
    
    path = [] 
    while len(path_rev) > 0: 
        path.append(path_rev.pop()[0])
    
    return path[:-1]


#default handler - Passthrough
def default_children_handler(children, params={}): 
    return children

#handler - 1 Random selector
def select_random_child(children, params={}): 
    return random.choices(children,k=1)

#handler - 2 Semantically similar children
def select_similar_children(children, params={}): 
    #get nodes for each child, 
    #get similarity with original question. 
    k = params.get("k", None) 
    score = params.get("score", None) 
    q = params.get("query", None) 
    current_X = params.get("current_X", set()) 

    model_id = params.get("model_id", None) 
    scorer = params.get("scorer", None)
    #memo = params.get("memo", {}) 
    #print("1. Computing Similarity Scores {0} children and query".format(len(children)))
    #df = get_docs_df(children)
    xdf = get_docs_df(list(current_X))

    #current context
    cc = list(zip(xdf['id'].tolist(), xdf['reg_description'].tolist()))

    cdf = get_docs_df(children)
    c_list = []
    for n in zip(cdf['id'].tolist(), cdf['reg_description'].tolist()):
        
        #target = new candidate context (score=0.5 causes results to explode)
        """
        ca = cc + [n]
        ca.sort(key=lambda t: t[0])
        target = ''.join([t[1] for t in ca])
        """

        #target = child 
        target = n[1]
        
        computed_score = scorer(target, q, model_id) 
        if computed_score > score:
            c_list.append([n[0], n[1], score])
    
    top_k_sorted_list = sorted(c_list, key=lambda x: x[2])[:k]
    
    return [n[0] for n in top_k_sorted_list[:k]]


def get_parent(root, r = ['includes'], parent_handler=default_children_handler): 
    url_object = URL.create(
        "sqlite",
        database="../data/rag_database.db",
    )
    engine = create_engine(url_object)
    if r:
        query = text(f"""
            SELECT 
                rr.to_id, 
                rr.from_id, 
                rt.rel_description
            FROM
                reg_relation rr
                INNER JOIN rel_type rt ON rr.rel_type_id = rt.id
            WHERE 
                rr.to_id IN({root}) AND
                rt.rel_description IN ({(',').join(["'" + i + "'" for i in r])})
        """)
        df = pd.read_sql(query, engine)
    else: 
        return []

    if df['from_id'].tolist():
        p = parent_handler(df['from_id'].tolist())
        return p    
    else:
        return []

def get_child(root, children_handler=default_children_handler, r = []): 
    url_object = URL.create(
        "sqlite",
        database="../data/rag_database.db",
    )
    engine = create_engine(url_object)
    if r:
        query = text(f"""
            SELECT 
                rr.to_id, 
                rr.from_id, 
                rt.rel_description
            FROM
                reg_relation rr
                INNER JOIN rel_type rt ON rr.rel_type_id = rt.id
            WHERE 
                rr.from_id IN({root}) AND
                rt.rel_description IN ({(',').join(["'" + i + "'" for i in r])})
        """)
        df = pd.read_sql(query, engine)
    else: 
        return []

    if df['to_id'].tolist():
        c = children_handler(df['to_id'].tolist())
        return c    
    else:
        return [] 

#KG RAG Related helpers
def split_X(X): 

    url_object = URL.create(
        "sqlite",
        database="../data/rag_database.db",
    )
    engine = create_engine(url_object)

    #S (nodes with no incoming 'includes' edges
    query = text(f"""
        SELECT 
            r.id
        FROM
            regs r
        WHERE 
            r.id NOT IN (
                SELECT 
                    rr.to_id 
                FROM 
                    reg_relation rr 
                    INNER JOIN rel_type rt ON rr.rel_type_id = rt.id 
                WHERE 
                    rt.rel_description = 'includes'
            )
            AND r.id IN ({(',').join([str(i) for i in X])})
    """)

    df = pd.read_sql(query, engine)
    S = set([])
    if df['id'].tolist():
        S = set(df['id'].tolist())

    # (nodes with no outgoing 'includes' edges
    query = text(f"""
        SELECT 
            r.id
        FROM
            regs r
        WHERE 
            r.id NOT IN (
                SELECT 
                    rr.from_id 
                FROM 
                    reg_relation rr 
                    INNER JOIN rel_type rt ON rr.rel_type_id = rt.id 
                WHERE 
                    rt.rel_description = 'includes'
            )
            AND r.id IN ({(',').join([str(i) for i in X])})
    """)
    df = pd.read_sql(query, engine)
    T = set([])
    if df['id'].tolist():
        T = set(df['id'].tolist())  

    return (S,T)
    
def expand_parents(u, r=[]):
    
    url_object = URL.create(
        "sqlite",
        database="../data/rag_database.db",
    )
    engine = create_engine(url_object)

    if r:
        query = text(f"""
            SELECT 
                rr.from_id
            FROM
                reg_relation rr
                INNER JOIN rel_type rt ON rr.rel_type_id = rt.id
            WHERE 
                rr.to_id IN ({(',').join([str(i) for i in u])})
                AND rt.rel_description IN ({(',').join(["'" + i + "'" for i in r])})
        """)
        df = pd.read_sql(query, engine)
    else: 
        query = text(f"""
            SELECT 
                rr.from_id
            FROM
                reg_relation rr
                INNER JOIN rel_type rt ON rr.rel_type_id = rt.id
            WHERE 
                rr.to_id IN ({(',').join([str(i) for i in u])})
        """)
        df = pd.read_sql(query, engine, params={"x": tuple(u)})
    P = set([])
    if df['from_id'].tolist():
        P = set(df['from_id'].tolist())
        return P

def expand_children(u, r=[], children_handler=default_children_handler, chp = {}):
    
    url_object = URL.create(
        "sqlite",
        database="../data/rag_database.db",
    )
    engine = create_engine(url_object)

    if r:
        query = text(f"""
            SELECT 
                rr.to_id
            FROM
                reg_relation rr
                INNER JOIN rel_type rt ON rr.rel_type_id = rt.id
            WHERE 
                rr.from_id IN ({(',').join([str(i) for i in u])})
                AND rt.rel_description IN ({(',').join(["'" + i + "'" for i in r])})
        """)
        df = pd.read_sql(query, engine)
    else: 
        query = text(f"""
            SELECT 
                rr.to_id
            FROM
                reg_relation rr
                INNER JOIN rel_type rt ON rr.rel_type_id = rt.id
            WHERE 
                rr.from_id IN ({(',').join([str(i) for i in u])})
        """)

        df = pd.read_sql(query, engine, params={"x": tuple(u)})
    C = set([])
    if df['to_id'].tolist():
        #C\u will be all new children 
        new_children = set(df['to_id'].tolist()) - set(u)
        filtered_new_children = set(children_handler(list(new_children), chp))
        #C = set(df['to_id'].tolist())
        C = filtered_new_children.union(set(u))
        return C
        
def get_excluded_children(u, r = []): 
    C = expand_children(u, r)
    if not C: 
        C = set()
        
    # we want the children that were not in the original set u. 
    CC = C - u 
    return CC

def get_docs_df(s): 

    url_object = URL.create(
        "sqlite",
        database="../data/rag_database.db",
    )
    engine = create_engine(url_object)
    
    query = text(f"""
        SELECT 
            r.id,
            r.reg_description
        FROM
            regs r
        WHERE 
            r.id IN ({(',').join([str(n) for n in s])})
        ORDER BY 
            r.id ASC
    """)
    df = pd.read_sql(query, engine)
    return df

def get_all_ids(): 

    url_object = URL.create(
        "sqlite",
        database="../data/rag_database.db",
    )
    engine = create_engine(url_object)

    query = text(f"""
        SELECT 
            r.id
        FROM
            regs r
        ORDER BY 
            r.id ASC
    """)
    df = pd.read_sql(query, engine)
    return df

def merge_docs_df(df):

    contents = '' 
    if df['reg_description'].tolist():
        for c in df['reg_description'].tolist():
            contents = contents + c
            
    doc = Document(page_content = contents) 
    #print(doc)
    return doc

def expand_node_ids(current_X, children_handler=default_children_handler, chp = {}): 
    prev_X = set();

    #Phase One
    while (prev_X != current_X): 
        prev_X = current_X
        chp['current_X'] = current_X.copy()
        C = expand_children(current_X, r=[], children_handler=children_handler, chp=chp) 
        if C:
            current_X = current_X.union(C)
            
    #Phase Two
    prev_X = set()
    while (prev_X != current_X): 
        prev_X = current_X
        P = expand_parents(current_X, ['includes']) 
        if P:
            current_X = current_X.union(P)

    #Phase Three 
    EC = get_excluded_children(current_X, ['refers'])
    if EC:
        current_X = current_X.union(expand_node_ids(EC, children_handler=children_handler, chp=chp))
    
    return current_X

def get_doc_ids(docs): 

    url_object = URL.create(
        "sqlite",
        database="../data/rag_database.db",
    )
    engine = create_engine(url_object)

    X = []

    for doc in docs: 
        query = text("""
            SELECT 
                r.id
            FROM
                regs r 
            WHERE 
                r.reg_description = :reg_description
        """)
        # Execute the query with the parameter
        df = pd.read_sql(query, engine, params={"reg_description": doc.page_content})
        if df['id'].tolist():
            X.append(df['id'].tolist()[0])
    current_X = set(X)
    return current_X
    
def expand_retrievals(docs): 

    current_X = get_doc_ids(docs)
    current_X = expand_node_ids(current_X)
    
    docs = get_docs_df(current_X)
    doc = merge_docs_df(docs)
    return [doc]

def print_docs_KG_enhancedRAG(docs): 
    print(('\n\n').join([d.page_content for d in docs])) 
    return docs

def print_prompt(prompt):
    print(prompt) 
    return prompt 

def createKG_RAGRetriever(score, k): 
    openai_key  = os.environ["OPENAI_API_KEY"] 
    # 1. Connect to the database and load the column
    url_object = URL.create(
        "sqlite",
        database="../data/rag_database.db",
    )
    engine = create_engine(url_object)

    query = "SELECT reg_description FROM regs" 
    df = pd.read_sql(query, engine)
    
    # 2. Generate embeddings for the specific column
    embeddings = OpenAIEmbeddings(openai_api_key=openai_key)
    texts = df['reg_description'].tolist()  # Extract descriptions as text
    docs = [Document(page_content=row) for row in texts]
        
    # 3. Store the embeddings in FAISS
    faiss_index = FAISS.from_documents(docs, embeddings)
    
    # 4. Set up the retriever
    retriever = faiss_index.as_retriever(search_type="similarity_score_threshold", \
                                         search_kwargs ={"score_threshold" : score , "k" : k})
        
    retriever.output_schema.schema() 
    return retriever
 
class ResponseFormat(BaseModel):
    Answer: str = Field(description="an answer to the question")
    AnswerExplanation: str = Field(description="an explanation justifying the answer")

def KG_enhancedRAG(question, model, retriever, out_params = {}, ch_params = {}):

    
    template = """
        Answer the question based only on the following context:
        Context: {context}
        Question: {question}
        You must provide reasoning for your answer. Where applicable, explicitly reference any regulations that justify your reasoning.
        Provide your reasoning as a list of points. 
        Your answer should strictly be a valid JSON object. Do not include any other text.
        """    
    parser = JsonOutputParser(pydantic_object=ResponseFormat)

    prompt = PromptTemplate(
        template=template + "\n {format_instructions}. You must always return valid JSON. Do not return any additional text.\n",
        partial_variables={"format_instructions": parser.get_format_instructions()}
    )

    #retrieval
    chain_retriever = itemgetter('question') | retriever
    res_retriever = chain_retriever.invoke({"question": question})

    #expand_retrievals
    current_X = get_doc_ids(res_retriever)
    current_X = expand_node_ids(current_X, select_similar_children, ch_params)
    #current_X = expand_node_ids(current_X, default_children_handler, ch_params)
    df = get_docs_df(current_X)
    doc = merge_docs_df(df)    
    doc_list = [doc] 

    #LLM 
    chain = (
        {"context" : itemgetter("context"), "question" : itemgetter("question")} 
        | prompt
        | model
        | StrOutputParser()
    )

    res = ""
    res = chain.invoke({"question": question, "context": doc_list}) 
    out_params.update({'context': doc.page_content})
    out_params.update({'context_id': list(current_X)})
    res_d = {}
    try: 
        res_d = json.loads(res) 
    except Exception as e: 
        print(e) 

    result = {}
    result['result_dict'] = res_d
    result['result_str'] = res 

    return result 