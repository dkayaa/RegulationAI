#GP-QAR
import model_dict 
import db_helpers
import knowledgegraph_rag as kr 
import qg_helpers as qgh 
from qg_sbert import ComputeSBert
import random
import app_config 

def qa_kgr(json_folder, greedy_pruning_s, num_records, out_folder, init_s = 0.7, init_k=5): 

    config_dict = app_config.GetConfigDict()
    #Params 
    model_id = config_dict['LLM_Agent']

    schema_fp = config_dict['sql_schema']
    knowledge_sql_fp = config_dict['knowledge_sql_fp']
    database_fp = config_dict['database_fp']

    random.seed(42)
    md = model_dict.create()

    c = db_helpers.setup_db(database_fp, schema_fp)
    c = db_helpers.insert_data(c, knowledge_sql_fp)

    records = qgh.GetRecordsFromFolder(json_folder)
    random.shuffle(records) 

    r=kr.createKG_RAGRetriever(init_s, init_k)

    out_records = []
    for count, record in enumerate(records[:num_records]):
        print("s: {1} commencing for record {0}".format(count, greedy_pruning_s))
        out_params = {} 

        #child handler params 
        ch_params = { 
            'k': 5, #top-k nodes
            'score': greedy_pruning_s, #threshold similarity
            'query': record['Question'][0],  #user query
            'model_id': 'all-MiniLM-L6-v2', #faster than mpnet
            'scorer': ComputeSBert, #scoring function SentenceBert
            'memo' : {} #memory
        }

        res = kr.KG_enhancedRAG(record['Question'][0], md[model_id], r, out_params=out_params, ch_params=ch_params)
        if 'qa' in record.keys():
            qa = record['qa']
        else: 
            qa = {} 

        qa['KnowledgeGraphRAG'] = {} 
        qa['KnowledgeGraphRAG']['out_params'] = out_params 
        qa['KnowledgeGraphRAG']['result_dict'] = res.get("result_dict",{})
        qa['KnowledgeGraphRAG']['result_str'] = res.get("result_str","")

        record['qa'] = qa 

        out_records.append(record)
    qgh.WriteRecordsToFolder(out_records, out_folder)
