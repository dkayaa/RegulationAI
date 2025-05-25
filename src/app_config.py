# Here we set up a application dictionary that stores our configurations
import json 
import os

def GetConfigDict(config_file=""): 
    config_dict = {}
    if config_file:
        with open(config_file) as f:
            config_dict = json.load(f) 
    else: 

        config_dict['cwd'] = os.getcwd()
        config_dict['LLM_Agent'] = 'claude'
        config_dict['knowledge'] = '20250507_withGPT_ALL_MoreEdgeTypes'
        config_dict['sql_schema'] = '../schema/main_schema.sql'
        config_dict['knowledge_sql_fp'] = '../schema/{0}.sql'.format(config_dict['knowledge'])
        config_dict['knowledge_txt_fp'] = "../data/{0}_txt.txt".format(config_dict['knowledge'])
        config_dict['citations'] = "../schema/sections.json"
        config_dict['database_fp'] = '../data/rag_database.db'
        
        #All output files will be consoldiated under a folder based on THIS testname.
        config_dict['testname'] = 'test'
        
        config_dict['output_folder_name'] = '../output'
        config_dict['data_folder_name'] = '../data'
        config_dict['keys_folder_name'] = '../keys'

        config_dict['output_fp'] = os.path.join(os.getcwd(), config_dict['output_folder_name'])
        config_dict['data_fp'] = os.path.join(os.getcwd(), config_dict['data_folder_name'])
        config_dict['keys_fp'] = os.path.join(os.getcwd(), config_dict['keys_folder_name'])

        #qg_create_context (EXPLAIN-QAR) configs
        config_dict['n'] = 2 #Connected Subgraph Size CS_n
        config_dict['nc'] = 2 
        config_dict['qg_create_context_to_folder'] = 'context'

        #qg_create_questions (EXPLAIN-QAR) configs
        config_dict['seeds'] = ''
        config_dict['fsp'] = 0 
        config_dict['guided'] = 1 #apply EP
        config_dict['batch_size_n'] = 1 #4
        config_dict['qg_create_questions_to_folder'] = 'explainqar'
        #qg_eval
        config_dict['qg_eval_to_folder'] = 'explainqar_eval'

        #qg_json_to_excel 
        config_dict['qg_excel_from_fp'] = os.path.join(config_dict['output_fp'], config_dict['testname'],config_dict['qg_eval_to_folder'])
        config_dict['qg_excel_fn'] = 'qg_results.xlsx'
        config_dict['qg_excel_fp'] = os.path.join(config_dict['output_fp'], config_dict['testname'],config_dict['qg_excel_fn'])

        #qg_baseline (DR_GEN)
        config_dict['qg_baseline_to_folder'] = 'dr_gen'

        #qa_kgr (GP-QAR) configs qa_kgr(json_folder, greedy_pruning_s, num_records, out_folder, init_s = 0.7, init_k=5): 
        config_dict['qa_kgr_from_fp'] = os.path.join(config_dict['output_fp'], config_dict['testname'], config_dict['qg_eval_to_folder'])
        config_dict['s_P'] = 0.7
        config_dict['qa_kgr_num_records'] = 10 #number of records you want to evaluate from source folder
        config_dict['qa_kgr_out_folder_name'] = 'gpqar'
        config_dict['qa_kgr_to_fp'] = os.path.join(config_dict['output_fp'], config_dict['testname'], config_dict['qa_kgr_out_folder_name'])
        config_dict['s_G'] = 0.7
        config_dict['k_G'] = 5

        #qa_baseline (DR_ANS)
        config_dict['qa_baseline_from_fp'] = os.path.join(config_dict['output_fp'], config_dict['testname'], config_dict['qg_eval_to_folder'])
        config_dict['qa_baseline_num_records'] = 10 
        config_dict['qa_baseline_out_folder_name'] = 'dr_ans'
        config_dict['qa_baseline_to_fp'] = os.path.join(config_dict['output_fp'], config_dict['testname'], config_dict['qa_baseline_out_folder_name'])
        config_dict['s_DR'] = 0.7
        config_dict['k_DR'] = 5

        #qa_eval 
        config_dict['qa_kgr_pipeline'] = 'KnowledgeGraphRAG' #DO NOT CHANGE THIS 
        config_dict['qa_kgr_eval_from_fp'] = config_dict['qa_kgr_to_fp']
        config_dict['qa_kgr_eval_out_foldername'] = 'gpqar_eval'
        config_dict['qa_kgr_eval_to_fp'] = os.path.join(config_dict['output_fp'], config_dict['testname'], config_dict['qa_kgr_eval_out_foldername'])
        config_dict['qa_kgr_eval_excel'] = 'gpqar_results.xlsx'
        config_dict['qa_kgr_eval_excel_fp'] = os.path.join(config_dict['output_fp'], config_dict['testname'], config_dict['qa_kgr_eval_excel'])

        config_dict['qa_baseline_pipeline'] = 'ConventionalRAG' #DO NOT CHANGE THIS 
        config_dict['qa_baseline_eval_from_fp'] = config_dict['qa_baseline_to_fp']
        config_dict['qa_baseline_eval_out_foldername'] = 'dr_ans_eval'
        config_dict['qa_baseline_eval_to_fp'] = os.path.join(config_dict['output_fp'], config_dict['testname'], config_dict['qa_baseline_eval_out_foldername'])
        config_dict['qa_baseline_eval_excel'] = 'dr_ans_results.xlsx'
        config_dict['qa_baseline_eval_excel_fp'] = os.path.join(config_dict['output_fp'], config_dict['testname'], config_dict['qa_baseline_eval_excel'])

    return config_dict 
