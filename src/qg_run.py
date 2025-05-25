from qg_create_context import qg_create_context
from qg_create_questions import qg_create_questions
from qg_eval import qg_eval 
from json_to_excel import json_to_excel
from qg_baseline import qg_baseline
import app_config

config_dict = app_config.GetConfigDict() 

#Execute EXPLAIN-QAR
qg_create_context(config_dict['testname'],config_dict['n'], config_dict['nc'] ) 
qg_create_questions(config_dict['testname'], config_dict['seeds'], config_dict['fsp'], config_dict['guided'], config_dict['batch_size_n'])

#Run evaluation metrics 
qg_eval()

#store to Excel
json_to_excel(config_dict['qg_excel_from_fp'], config_dict['qg_excel_fp'])

#Generate Baseline QA dataset using DR_GEN (Requires a reference QA dataset, we use the one made by EXPLAIN-QAR)
qg_baseline()