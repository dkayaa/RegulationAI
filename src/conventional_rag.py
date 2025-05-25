# RAG Pipeline implementing Conventional Retriever 
import json 
from langchain_community.document_loaders import PyPDFLoader
from langchain_core.output_parsers import StrOutputParser, JsonOutputParser
from langchain_core.prompts import PromptTemplate
from langchain_openai import OpenAIEmbeddings
from langchain_text_splitters import RecursiveCharacterTextSplitter
from langchain_unstructured import UnstructuredLoader
from langchain_community.vectorstores import FAISS
from operator import itemgetter
import os 
from pydantic import BaseModel, Field

def print_docs_ConventionalRAG(docs): 
    print(('\n\n').join([d.page_content for d in docs])) 
    return docs

def print_prompt(prompt):
    print(prompt) 
    return prompt

def setPDFRetriever(filepath, score, k): 
    openai_key  = os.environ["OPENAI_API_KEY"] 
    loader = PyPDFLoader(file_path=filepath)
    pages = loader.load()
    text_splitter = RecursiveCharacterTextSplitter(chunk_size=1000, chunk_overlap=200)
    splits = text_splitter.split_documents(pages)
    vector_store = FAISS.from_documents(documents=splits, embedding=OpenAIEmbeddings(api_key=openai_key))    
    retriever = vector_store.as_retriever(search_type="similarity_score_threshold", \
                                                  search_kwargs={"score_threshold": score,"k": k})
    return retriever

def setTXTRetriever(filepath, score, k): 
    openai_key  = os.environ["OPENAI_API_KEY"] 
    loader = UnstructuredLoader([filepath])    
    pages = loader.load()
    text_splitter = RecursiveCharacterTextSplitter(chunk_size=1000, chunk_overlap=200)
    splits = text_splitter.split_documents(pages)
    vector_store = FAISS.from_documents(documents=splits, embedding=OpenAIEmbeddings(api_key=openai_key))    
    retriever = vector_store.as_retriever(search_type="similarity_score_threshold", \
                                                  search_kwargs={"score_threshold": score,"k": k})
    return retriever

def createConvRAGRetriever(retSetter, filepath, score, k): 
    retriever = retSetter(filepath, score, k) 
    return retriever 

class ResponseFormat(BaseModel):
    Answer: str = Field(description="an answer to the prompt")
    AnswerExplanation: str = Field(description="an explanation justifying the answer")

def ConventionalRAG(prompt, model, retriever, out_params = {}, responseformat=ResponseFormat ):
    
    template = """
    Address the prompt based only on the following context:
    Context: {context}
    Prompt: {prompt}
    You must provide reasoning for your answer. Where applicable, explicitly mention any regulations that justify your reasoning.
    Your answer should strictly be a valid JSON object. Do not include any other text.
    """

    parser = JsonOutputParser(pydantic_object=responseformat)

    prompt_template = PromptTemplate(
        template=template + "\n {format_instructions}. You must always return valid JSON. Do not return any additional text.\n",
        partial_variables={"format_instructions": parser.get_format_instructions()}
    )

    #retriever chain 
    r_chain = itemgetter("prompt") | retriever
    context = r_chain.invoke({"prompt":prompt})
    out_params.update({'context': [c.page_content for c in context]})
    
    #llm chain 
    l_chain = (
        {"context": itemgetter("context"), "prompt": itemgetter("prompt")}
        | prompt_template
        | model
        | StrOutputParser()
    )  
    
    res = l_chain.invoke({"prompt":prompt, "context": context})
    
    res_d = {}
    try: 
        res_d = json.loads(res) 
    except Exception as e: 
        print(e) 

    result = {}
    result['result_dict'] = res_d
    result['result_str'] = res 
    
    return result


def ConventionalRAGForBaseline(prompt, base_question, model, retriever, out_params = {}, responseformat=ResponseFormat ):
    
    template = """
    Address the prompt based only on the following context:
    Context: {context}
    Prompt: {prompt}
    You must provide reasoning for your answer. Where applicable, explicitly mention any regulations that justify your reasoning.
    Your answer should strictly be a valid JSON object. Do not include any other text.
    """

    parser = JsonOutputParser(pydantic_object=responseformat)

    prompt_template = PromptTemplate(
        template=template + "\n {format_instructions}. You must always return valid JSON. Do not return any additional text.\n",
        partial_variables={"format_instructions": parser.get_format_instructions()}
    )

    #retriever chain 
    r_chain = itemgetter("base_question") | retriever
    context = r_chain.invoke({"base_question":base_question})
    out_params.update({'context': [c.page_content for c in context]})

    #llm chain 
    l_chain = (
        {"context": itemgetter("context"), "prompt": itemgetter("prompt")}
        | prompt_template
        | model
        | StrOutputParser()
    )  

    res = l_chain.invoke({"prompt":prompt, "context": context})
    res_d = {}

    try: 
        res_d = json.loads(res) 
    except Exception as e: 
        print(e) 

    result = {}
    result['result_dict'] = res_d
    result['result_str'] = res 

    return result