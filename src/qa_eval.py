from qg_helpers import GetRecordsFromFolder, WriteRecordsToFolder
import eval_bertScore as bs 
import eval_bleurt as bleurt 

def qa_eval(pipeline, json_folder, out_folder):
    records = GetRecordsFromFolder(json_folder) 

    for (i, record) in enumerate(records): 
        if record.get("Answer","") == "" or record.get("Answer Explanation", "") == "": 
            continue 
        if record.get("qa", {}).get(pipeline, {}).get("result_dict", {}) == {}: 
            continue 
        
        try:
            print("{0} {1} {2}".format(i, record['filename'], json_folder.split('/')[-1]))
            reference_answer = record['Answer'] + '. ' + record['Answer Explanation']
            candidate_answer = record['qa'][pipeline]['result_dict']['Answer'] + '. ' \
            + record['qa'][pipeline]['result_dict']['AnswerExplanation']

            (P, R, F1) = bs.ComputeBertScore(candidate_answer, reference_answer)
            bleurtscore = bleurt.ComputeBleurt(candidate_answer, reference_answer)
        except Exception as e: 
            print(e) 
            continue 

        record['bertscore'] = {}
        record['bertscore']['precision'] = P 
        record['bertscore']['recall'] = R
        record['bertscore']['f1'] = F1 

        record['bleurt'] = bleurtscore


    WriteRecordsToFolder(records, out_folder)