import keyword_extraction as ke 
import queue 
# Entity Pathing Methodology

# Given a set of contexts c = [c1, c2, c3, c4]
# 1. produce bipartite graph B as described in the methdology 
# 2. Iteratively compute shortest paths between entity pairs 
# 3. Filter and return paths that traverse all contexts
def get_entity_paths(contexts): 
    paths = get_paths(contexts)
    paths = [[i[0] for i in p] for p in paths] 
    return paths 

def get_paths(contexts, filter='entity_node'): 
    b = contexts2bgraph(contexts)
    entities = [i for i in get_vertices(b) if i[1] == 'entity_node']
    paths = []
    for e1 in entities: 
        for e2 in entities: 
            if e1 == e2: 
                continue 
            p = bfs(b, e1, e2) 
            pc = [i for i in p if i[1] == 'context_node'] #contexts traversed
            if len(pc) != len(contexts): 
                continue 
            paths.append(p) 
    
    if filter != "": 
        paths = [[i for i in p if i[1] == filter] for p in paths]
    return paths 


def contexts2bgraph(contexts):
    graph = {} 
    for (i, c) in enumerate(contexts): 
        context_node = 'context_node_{0}'.format(i)
        graph[(context_node, 'context_node')] = [(i, 'entity_node') for i in list(ke.extract_keywords(c))]
        for n in graph[(context_node, 'context_node')]: 
            if n not in graph.keys(): 
                graph[n] = [] 
            graph[n].append((context_node, 'context_node'))
    
    return graph

def get_vertices(graph): 
    return list(graph.keys())

def get_neighbours(graph, u): 
    #graph is a adjacency list representation 
    #dict[u] = [v1, v2, v3 ...]
    return graph[u]

def bfs(graph, u, v): 
    #compute bfs from u -> v 
    found = False
    q = queue.Queue() 

    q.put(u) 
    bt = {} #back tracking
    visited = {} #visited dict 
    while not q.empty(): 
        c = q.get()
        if c == v:
            found = True
            break 
        visited[c] = True 
        for ch in get_neighbours(graph, c): 
            if ch not in visited.keys():
                q.put(ch) 
                bt[ch] = c 
    # Extract list
    path = [] 
    if found: 
        path = [v]
        c = v 
        while c != u: 
            path.append(bt[c])
            c = bt[c]
        
        path = path[::-1] 

    return path 