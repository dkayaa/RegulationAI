import model_dict 
import db_helpers
import knowledgegraph_rag as kr 
import qg_helpers as qgh
import os
import json 
import datetime 
import qg_perplexity as qgp
import random 
import app_config 
import os 

def qg_create_context(test_name="test", n=2, nc=50):

    #n : CS_n 
    #nc: num contexts sets to generate 
    #testname : name of test 

    #Params 
    config_dict = app_config.GetConfigDict() 

    model_id = config_dict['LLM_Agent']
    knowledge = config_dict['knowledge']
    schema_fp = config_dict['sql_schema']
    knowledge_sql_fp = config_dict['knowledge_sql_fp']
    database_fp = config_dict['database_fp']

    knowledge_txt_fp = config_dict['knowledge_txt_fp']

    model_ = model_dict.create()
    md = model_dict.create()

    c = db_helpers.setup_db(database_fp, schema_fp)
    c = db_helpers.insert_data(c, knowledge_sql_fp)
    records = [] 

    path_list = [] 
    visited = {}

    path_list = kr.get_all_connected_subgraphs(n, ['refers', 'overrides','activates', 'modifies','conditioned on'])
    #path_list = kr.get_random_node_pairs(nc) #This is RV_2 strategy

    random.shuffle(path_list)

    count = 0
    visited = {} 
    o_fp_base = os.path.join(config_dict['cwd'], config_dict['output_fp'],config_dict['testname'],config_dict['qg_create_context_to_folder'])
    while count < nc:
        path = random.choices(path_list)[0]
        #since expansion from a given edge may be non-deterministic, we can do this n times for up to n different results
        print("Doing path {0}".format(path))
        for i in range(0, 1): 
            print(i)
            if count >= nc: 
                print("Context Limit Reached! Exiting!")
                break 
            key = ""
            contexts = []
            cpaths = []
            #add each context.
            identical_cpath = False 

            for node_id in path:
                record = {} 
                (d, cpath) = qgh.GetContextsFromNode(node_id)

                #dont want identical context paths 
                if cpath in cpaths: 
                    identical_cpath = True
                    break

                contexts.append(d)
                cpaths.append(cpath)
                
            if identical_cpath: 
                continue 

            key+= ','.join([str(x) for x in sorted([x for xs in cpaths for x in xs])])
            #key+= ','.join([str(n) for n in sorted(path)]) + '-'
            if key in visited.keys():
                continue
            visited[key] = True
            print("{0} : {1}".format(i, key))
            cps = [] 
            skip = False
            for c in contexts: 
                cp = qgp.calculate_perplexity(c)
                print("context perplexity: {0}".format(cp))
                if cp > 50.0: 
                    print("Poor Perplexity Scores. Rejected!")
                    print(c)
                    print("----")
                    skip = True 
                    break 
                cps.append(cp)
            
            if skip: 
                continue 

            print("context perplexities: {0}".format(cps))
            print("Accepted!, appending record {0}".format(count))

            record['path'] = path 
            record['contexts'] = contexts
            record['context-perplexities'] = cps
            record['misc'] = {} 
            record['misc']['context_paths'] = cpaths
            
            
            o_fp = o_fp_base + "/{0}_contexts_{2}_edges_{1}.json".format(count, datetime.datetime.now(), n-1)
            json_string = json.dumps(record)
            #write to file 
            os.makedirs(os.path.dirname(o_fp), exist_ok=True)
            print(json_string, file=open(o_fp, 'w'))
            
            count+=1
            records.append(record) 
