#Skeleton Code Generated Using GPT-4o 
import os
import json
import pandas as pd

def json_to_excel(json_folder, output_file):
    all_rows = []

    # Go through all files in the folder
    for filename in os.listdir(json_folder):
        if filename.endswith(".json"):
            filepath = os.path.join(json_folder, filename)
            with open(filepath, "r", encoding="utf-8") as f:
                try:
                    data = json.load(f)

                    # Extract fields
                    row = {
                        "Filename": filename,
                        "Question": data.get("Question", ""),
                        "Answer": data.get("Answer", ""),
                        "Answer Explanation": data.get("Answer Explanation", ""),
                    }
                    #contexts
                    for k in data.keys():
                        if "context_" in k: 
                            row[k] = data[k] 

                    #sim scores 
                    for k in data['sentenceBert']['all-mpnet-base-v2'].keys(): 
                        row[k] = data['sentenceBert']['all-mpnet-base-v2'][k]

                    if 'qa' in data.keys(): 
                        for key, value in data['qa'].items():
                            if 'result_dict' in value.keys(): 
                                row[key + '_' + 'Answer'] = value['result_dict'].get("Answer", "") 
                                row[key + '_' + 'Answer Explanation'] = value['result_dict'].get("AnswerExplanation", "") 

                    row["CQW"] = data.get("CQW", "") 
                    for i in range(0, len(data.get("next_tok", []))):
                        row["CQW+{0}".format(i+1)] = data.get("next_tok", [])[i]

                    row["next_dobj"] = data.get("next_dobj", "") 
                    
                    if "LLM-eval" in data.keys(): 
                        row["QuestionAnswerability"] = data["LLM-eval"].get("result_dict", {}).get("QuestionAnswerability")
                        row["AnswerQuality"] = data["LLM-eval"].get("result_dict", {}).get("AnswerQuality")
                        row["IsMultiHop"] = data["LLM-eval"].get("result_dict", {}).get("IsMultiHop")
                    
                    if "Retriever-Scores" in data.keys(): 
                        row["recall"] = data["Retriever-Scores"]["recall"]
                        row["precision"] = data["Retriever-Scores"]["precision"]
                        row["f1-score"] = data["Retriever-Scores"]["f1-score"]


                    if "bertscore" in data.keys(): 
                        row["bertscore-recall"] = data["bertscore"]["recall"]
                        row["bertscore-precision"] = data["bertscore"]["precision"]
                        row["bertscore-f1-score"] = data["bertscore"]["f1"]
                    if "bleurt" in data.keys(): 
                        row["bleurt"] = data["bleurt"]
                    
                    all_rows.append(row)

                except Exception as e:
                    print(f"⚠️ Error reading {filename}: {e}")

    # Create DataFrame
    df = pd.DataFrame(all_rows)

    # Save to Excel
    df.to_excel(output_file, index=False)
    print(f"✅ Done! Exported to {output_file}")