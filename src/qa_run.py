from qa_kgr import qa_kgr 
from qa_baseline import qa_baseline
from qa_eval import qa_eval 
from json_to_excel import json_to_excel

import app_config

config_dict = app_config.GetConfigDict()

#Execute GP-QAR on reference dataset 
qa_kgr(config_dict['qa_kgr_from_fp'],config_dict['s_P'],config_dict['qa_kgr_num_records'], config_dict['qa_kgr_to_fp'], config_dict['s_G'], config_dict['k_G'])

#Execute DR_ANS on the reference dataset
qa_baseline(config_dict['qa_baseline_from_fp'], config_dict['qa_baseline_num_records'], config_dict['qa_baseline_to_fp'], init_s=config_dict['s_DR'], init_k=config_dict['k_DR'])

#Evaluate Datasets
qa_eval(config_dict['qa_kgr_pipeline'], config_dict['qa_kgr_eval_from_fp'], config_dict['qa_kgr_eval_to_fp'])
qa_eval(config_dict['qa_baseline_pipeline'], config_dict['qa_baseline_eval_from_fp'], config_dict['qa_baseline_eval_to_fp'])

#Export to Excel
json_to_excel(config_dict['qa_kgr_eval_to_fp'], config_dict['qa_kgr_eval_excel_fp'])
json_to_excel(config_dict['qa_baseline_eval_to_fp'], config_dict['qa_baseline_eval_excel_fp'])