import model_dict 
import datetime 
import random 
import json 
from langchain_core.output_parsers import StrOutputParser
from langchain_core.prompts import PromptTemplate
from langchain_core.output_parsers import JsonOutputParser
import os 
from pydantic import BaseModel, Field
from typing import Dict
import qg_helpers as qgh
import qg_get_entity_paths as gep 
import app_config

class MHQuestionAnswers(BaseModel):
    QuestionAnswers: list[Dict[str, str]] = Field(description="list of dictionaries. Each dictionary has the three keys; 'Question' , 'Answer' and 'Answer Explanation'")

def qg_create_questions(test_name, seeds='', fsp=0, guided=1, batch_size_n=4):
    #test_name : test name 
    #seeds : seeds folder path if few shot prompting applied 
    #fsp : few shot prompting applied? (0: no, 1: yes)
    #guided : Entity Pathing Applied (0: no, 1: yes)

    config_dict = app_config.GetConfigDict() 
    
    #Params 
    model_id = config_dict['LLM_Agent']

    
    json_folder = os.path.join(config_dict['output_fp'],config_dict['testname'], config_dict['qg_create_context_to_folder']) #'../output/{0}/contexts'.format(test_name)

    seed_folder = '../output/{0}/{1}'.format(test_name, seeds)

    context_records = qgh.GetRecordsFromFolder(json_folder)

    use_fsp = bool(fsp)

    num_seeds = 5
    seed_records = [] 
    if use_fsp:
        seed_records = qgh.GetRecordsFromFolder(seed_folder)

    use_guided = bool(guided) 

    
    md = model_dict.create()
    model = md[model_id]


    records = [] 

    template="""
    You are given {num_contexts} related sections from a non-prescription medicines labels standard regulation. These sections depend on each other, so they must all be considered together when reasoning.

    Your task is to generate {batch_size} question and answer pairs that require multi-hop reasoning. That is, the questions must require using information from all of the provided sections of the regulation to answer correctly.
    The regulation is much broader in scope than the related sections. Therefore, the questions generated should state assumptions such that all necessary information is clearly present, requiring no significant assumptions or inferences. The contexts should directly address all aspects of the question, providing a clear path to a definitive answer with no ambiguity

    Each question should:
    Clearly state any assumptions that affect the answer.
    Be designed so the answer can only be determined by referencing all regulation sections.
    Should only use the information provided in the contexts.
    {guided_str}
    
    Each answer must:
    Provide an explanation that is completely accurate, comprehensive, well-structured, and directly references the specific relevant parts of the context. It fully addresses all aspects of the question with proper reasoning and leaves no room for ambiguity. 
    Justify the answer by referencing specific regulation IDs or clauses

    {context} 

    Your answer should strictly be a valid JSON object. Do not output any other text apart from the JSON object.
    Here are some examples as reference
    [{seed}]
    """

    parser = JsonOutputParser(pydantic_object=MHQuestionAnswers)

    prompt = PromptTemplate(
        template=template + "\n {format_instructions}. You must always return valid JSON. Do not return any additional text.\n",
        partial_variables={"format_instructions": parser.get_format_instructions()}
    )

    chain = (
        prompt
        | model
        | StrOutputParser()
    )

    n = batch_size_n 
    #number of questions to batch decode 
    #anything more than this and LLM agent output  overflow 
    o_fp_base = os.path.join(config_dict['output_fp'],config_dict['testname'],config_dict['qg_create_questions_to_folder'])
    for context_record in context_records:
        contexts = context_record.get('contexts', []) 
        e_paths = []
        ep=[]
        guided_str = ""
        if use_guided: 
            guided_str = "Clearly link the following entities: \n"
            e_paths = gep.get_entity_paths(contexts)
            if len(e_paths) == 0: 
                print("Guided Strategy Produced No Entity Paths!, Next Context!")
                continue 
            
            ep = random.choices(e_paths, k=1)
            p_str = '->'.join([str(i) for i in ep])+'\n'
            guided_str += p_str
        
        contexts_fn = context_record.get('filename', "")
        path = context_record.get('path', [])
        print("Commencing for Path {0}".format(path))
        record = {} 
        id = '-'.join([str(p) for p in path]) if path else 'NA'

        random_seeds = []
        if use_fsp: 
            random_seeds = random.choices(seed_records, k= num_seeds)

        try:
            res = chain.invoke({
                "num_contexts": len(contexts),
                "batch_size": n,
                "context": '\n\n'.join(['context: ' + str(c) for c in contexts]),
                "seed" : '\n'.join(['\n Question: '+ rs['Question'][0] + '\n Answer:' + rs['Answer'] +'\n Answer Explanation: '+ rs['Answer Explanation'] for rs in random_seeds]) if use_fsp else "",
                "guided_str" : guided_str
                })
        except Exception as e: 
            print(e)
            continue

        pp = prompt.format(
            num_contexts=len(contexts),
            batch_size=n,
            context= '\n\n'.join(['context: ' + str(c) for c in contexts]),
            seed= '\n'.join(['\n Question: '+ rs['Question'][0] + '\n Answer:' + rs['Answer'] +'\n Answer Explanation: '+ rs['Answer Explanation'] for rs in random_seeds]) if use_fsp else "",
            guided_str=guided_str
        )


        res_d = {}
        try: 
            res_d = json.loads(res) 
        except Exception as e: 
            print(e) 

        record['input'] = context_record 
        record['result_dict'] = res_d 
        record['result_str'] = res 
        record['misc'] = {} 
        record['misc']['input_prompt'] = pp 
        if use_guided: 
            record['misc']['entity_path'] = ep
        

        records.append(record) 
        o_fp = o_fp_base + "/mhqg_{0}_{3}_{1}_{2}.json".format(id, datetime.datetime.now(), contexts_fn, n)
        json_string = json.dumps(record)
        #write to file 
        os.makedirs(os.path.dirname(o_fp), exist_ok=True)
        print(json_string, file=open(o_fp, 'w'))





    

