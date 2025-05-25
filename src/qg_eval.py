import os 
import json 
import qg_helpers as qgh
import json
from itertools import combinations
from sentence_transformers import SentenceTransformer, util
import datetime 
import spacy
import app_config
import os 

def qg_eval():

    config_dict = app_config.GetConfigDict() 

    # Load spaCy's English model
    nlp = spacy.load("en_core_web_sm")
    question_words = {"which", "what", "who", "where", "when", "why", "how", "is", "are", "can", "does", "do", "did", "should", "will"}

    
    json_folder = os.path.join(config_dict['output_fp'],config_dict['testname'],config_dict['qg_create_questions_to_folder']) #"../output/{0}/mhqg".format(test_name)

    print("Commencing SBERT Calculations for files in folder {0}".format(json_folder))

    records = qgh.GetRecordsFromFolder(json_folder)
    modelid = 'all-mpnet-base-v2'
    model = SentenceTransformer(modelid)
    o_fp_base = os.path.join(config_dict['output_fp'],config_dict['testname'],config_dict['qg_eval_to_folder'])

    for record in records: 
        contexts = record["input"]["contexts"]
        qa_pairs = record.get("result_dict", {}).get("QuestionAnswers",[]) 
        if qa_pairs == [] or qa_pairs == {}:
            continue 

        for qa in qa_pairs:

            question = qa.get("Question","")
            ans_yn = qa.get("Answer", "")
            ans_exp = qa.get("Answer Explanation","")
            ans = qa.get("Answer", "") + '. ' + qa.get("Answer Explanation","")

            # Combine all elements with labels
            all_texts = contexts + [question] + [ans]
            labels = (
                [f"context_{i}" for i in range(len(contexts))] +
                [f"question"] +
                [f"answer"]
            )

            # Compute embeddings
            embeddings = model.encode(all_texts, convert_to_tensor=True)

            # Compute and print similarities
            print("Semantic Similarities Between All Elements:\n")
            results = {}
            for (i, j) in combinations(range(len(all_texts)), 2):
                sim_score = util.cos_sim(embeddings[i], embeddings[j]).item()
                results[f"{labels[i]}-{labels[j]}"] = sim_score

            
            print(results)
            
            data = {} 
            data['context_input'] = record["input"]
            for i in range(len(contexts)): 
                data[f"{labels[i]}"] = contexts[i]
            
            data['Question'] = [qa["Question"]]
        
            data["Answer"] = ans_yn
            data["Answer Explanation"] = ans_exp
            data["sentenceBert"] = {}
            
            ccount = len(contexts)
            asims = [results["context_{0}-answer".format(i)] for i in range(0, ccount)]
            results['Similarity Skew Answer'] =abs(max(asims) - min(asims))
            results['Total Similarity Answer']= sum(asims)
            results['Normalised Similarity Answer(to n=2)']= sum(asims)/ccount * 2

            qsims = [results["context_{0}-question".format(i)] for i in range(0, ccount)]
            results['Similarity Skew Question'] =abs(max(qsims) - min(qsims))
            results['Total Similarity Question']= sum(qsims)
            results['Normalised Similarity Question(to n=2)']= sum(qsims)/ccount * 2

            data["sentenceBert"][modelid] = results 

            #Compute Central Question Word for analysis 
            q = qa["Question"]
            clauses = [clause.strip() for clause in q.split(',')]
            last_clause = ','.join(clauses[1::])
            doc = nlp(last_clause)
            tokens = [token.text for token in doc]

            # Try to find a CQW in the first 3 tokens
            first_3 = tokens[:3]
            cqw = None
            for tok in first_3:
                if tok.lower() in question_words:
                    cqw = tok
                    cqw_index = tokens.index(tok)
                    break

            # If not found in the first 3, search from the end
            if not cqw:
                for i in reversed(range(len(tokens))):
                    if tokens[i].lower() in question_words:
                        cqw = tokens[i]
                        cqw_index = i
                        break

            # Find first direct object after the CQW
            dobj = None
            for token in doc[cqw_index + 1:]:
                if token.dep_ == "dobj":
                    dobj = token.text
                    break

            next_two = []
            if cqw:
                next_two = tokens[cqw_index + 1:cqw_index + 3]
            data["CQW"] = cqw
            data["next_tok"] = next_two
            data["next_dobj"] = dobj

            json_string = json.dumps(data)

            o_fp = o_fp_base + "/mhq_{0}.json".format(datetime.datetime.now())
            json_string = json.dumps(data)
            #write to file 
            os.makedirs(os.path.dirname(o_fp), exist_ok=True)
            print(json_string, file=open(o_fp, 'w'))

