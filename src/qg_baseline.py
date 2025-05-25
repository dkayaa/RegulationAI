#DR_GEN Baseline
#We leverage EXPLAIN-QAR's generated question-answer records to first retrieve top k chunks from a data store 
#Then we ask an allm to turn these into a question

import conventional_rag as cr 
import qg_helpers  as qgh 
import model_dict
import db_helpers
import helpers
import random 
from pydantic import BaseModel, Field
from typing import Dict
import app_config
import os 
class MHQuestionAnswers(BaseModel):
    QuestionAnswers: list[Dict[str, str]] = Field(description="list of dictionaries. Each dictionary has the three keys; 'Question' , 'Answer' and 'Answer Explanation'")

def qg_baseline():
    random.seed(42)

    config_dict = app_config.GetConfigDict()
    #EXPLAIN-QAR source question-answers

    json_folder = os.path.join(config_dict['output_fp'],config_dict['testname'],config_dict['qg_create_questions_to_folder'])
    records = qgh.GetRecordsFromFolder(json_folder)

    #Params 
    schema_fp = config_dict['sql_schema']
    knowledge_sql_fp = config_dict['knowledge_sql_fp']
    database_fp = config_dict['database_fp']

    knowledge_txt_fp = config_dict['knowledge_txt_fp']

    md = model_dict.create()

    c = db_helpers.setup_db(database_fp, schema_fp)
    c = db_helpers.insert_data(c, knowledge_sql_fp)

    helpers.CreateCorpusForConventionalRAG(knowledge_txt_fp)
    records = qgh.GetRecordsFromFolder(json_folder)
    random.shuffle(records) 

    out_records = []
    r = cr.createConvRAGRetriever(cr.setTXTRetriever, knowledge_txt_fp, 0.7, 5)

    prompt = """
        You are given contexts related sections from a non-prescription medicines labels standard regulation. These sections depend on each other, so they must all be considered together when reasoning.

        Your task is to generate 4 question and answer pairs that require multi-hop reasoning. That is, the questions must require using information from all of the provided sections of the regulation to answer correctly.
        The regulation is much broader in scope than the related sections. Therefore, the questions generated should state assumptions such that all necessary information is clearly present, requiring no significant assumptions or inferences. The contexts should directly address all aspects of the question, providing a clear path to a definitive answer with no ambiguity

        Each question should:
        Clearly state any assumptions that affect the answer.
        Be designed so the answer can only be determined by referencing all regulation sections.
        Should only use the information provided in the contexts.
        {0}
        
        Each answer must:
        Provide an explanation that is completely accurate, comprehensive, well-structured, and directly references the specific relevant parts of the context. It fully addresses all aspects of the question with proper reasoning and leaves no room for ambiguity. 
        Justify the answer by referencing specific regulation IDs or clauses

        Your answer should strictly be a valid JSON object. Do not output any other text apart from the JSON object.
        Here are some examples as reference
    """

    guided_str = ''
    for (i,record) in enumerate(records): 
        print("Record {0}".format(i))
        ep = record.get('misc',{}).get('entity_path',[]) 
        q = record.get('result_dict',{}).get("QuestionAnswers",[])
        if q == []:
            print('skipped')
            continue 
        if ep == []:
            print('skipped')
            continue 
        q = q[0]["Question"]

        out_param = {} 
        guided_str = "Clearly link the following entities: {0}".format('->'.join([str(i) for i in ep]))
        res = cr.ConventionalRAGForBaseline(prompt.format(guided_str),q, md['claude'], r, out_params = out_param, responseformat=MHQuestionAnswers)
        record['Baseline'] = res
        record['Baseline']['out_params'] = out_param
        out_records.append(record) 

    out_folder=os.path.join(config_dict['output_fp'],config_dict['testname'],config_dict['qg_baseline_to_folder'])
    qgh.WriteRecordsToFolder(out_records, out_folder)