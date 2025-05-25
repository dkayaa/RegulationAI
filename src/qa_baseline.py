#Baseline DR_ANS 
import model_dict 
import db_helpers
import conventional_rag as cr
import qg_helpers as qgh 
import helpers
import random
import app_config 

def qa_baseline(json_folder, num_records, out_folder, init_s=0.7, init_k=5):

    config_dict = app_config.GetConfigDict()
    #Params 
    model_id = config_dict['LLM_Agent']
    schema_fp = config_dict['sql_schema']
    knowledge_sql_fp = config_dict['knowledge_sql_fp']
    database_fp = config_dict['database_fp']

    knowledge_txt_fp = config_dict['knowledge_txt_fp']
    random.seed(42)

    md = model_dict.create()

    c = db_helpers.setup_db(database_fp, schema_fp)
    c = db_helpers.insert_data(c, knowledge_sql_fp)

    helpers.CreateCorpusForConventionalRAG(knowledge_txt_fp)
    records = qgh.GetRecordsFromFolder(json_folder)
    random.shuffle(records) 
    
    out_records = []
    out_records = qgh.GetRecordsFromFolder(out_folder)
    r = cr.createConvRAGRetriever(cr.setTXTRetriever, knowledge_txt_fp, init_s, init_k)

    for record in records[:num_records]: 
        if record['filename'] in [r['filename'] for r in out_records]:
            print('{0} already done'.format(record['filename']))
            continue 
        out_params = {} 
        res = cr.ConventionalRAG(record['Question'][0], md[model_id], r, out_params = out_params)
        record['qa'] = {} 
        record['qa']['ConventionalRAG'] = {} 
        record['qa']['ConventionalRAG']['out_params'] = out_params 
        record['qa']['ConventionalRAG']['result_dict'] = res.get("result_dict",{})
        record['qa']['ConventionalRAG']['result_str'] = res.get("result_str","")

        out_records.append(record) 
    qgh.WriteRecordsToFolder(out_records, out_folder)