
import knowledgegraph_rag as kgr
import random 
import json 
from langchain_text_splitters import RecursiveCharacterTextSplitter
from langchain_unstructured import UnstructuredLoader
import os 
import hashlib

#general helpers 
def WriteRecordsToFolder(records, json_folder): 
    print("Writing {0} records to {1}".format(len(records), json_folder))
    for record in records:
        json_string = json.dumps(record)
        #write to file 
        filepath = os.path.join(json_folder, record['filename'])
        os.makedirs(os.path.dirname(filepath), exist_ok=True)
        print(json_string, file=open(filepath, 'w'))

def GetRecordsFromFolder(json_folder): 
    records = []
    try:
        for filename in os.listdir(json_folder):
            if filename.endswith(".json"):
                filepath = os.path.join(json_folder, filename)
                data = {}
                data['filename'] = filename
                with open(filepath, "r", encoding="utf-8") as f:      
                    data = json.load(f) 

                if not data: 
                    continue 
                
                try: 
                    data['filename'] = filename
                    data['filepath'] = filepath
                
                    records.append(data)
                except Exception as e: 
                    print(e) 
    except Exception as e: 
        print(e)    
       
    print("Loaded {0} records".format(len(records)))
    return records 

def GetContextsFromNode(node_id): 
    path = kgr.get_path_reverse(node_id)+ kgr.get_path(node_id, kgr.select_random_child)
    d = kgr.merge_docs_df(kgr.get_docs_df(path))
    return (d.page_content, path)
