#hand crafted evaluation that checks cited sections against list of valid sections 
import json 
import re 
import app_config

fp = app_config.GetConfigDict()['citations']

all_valid_citations = set()
with open(fp, "r", encoding="utf-8") as f:      
    all_valid_citations = set(json.load(f))

regex_pattern = r"(\d+)?(\(\d+\)|\([a-zA-Z]+\)|\([ivxlc]+\))+"

def ComputeCitationsAcc(sentence): 
    matches = re.finditer(regex_pattern, sentence)
    
    citations = set([match.group(0) for match in matches])
    print(citations)
    real_citations = citations.intersection(all_valid_citations)
    
    accuracy = 0 
    if len(citations) > 0:
        accuracy = len(real_citations)/len(citations) 

    n_real_citations = len(real_citations)
    n_citations = len(citations) 
    return (n_real_citations, n_citations, accuracy)
