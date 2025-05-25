from bert_score import score

def ComputeBertScore(candidate, reference):

    P, R, F1 = score(
        [candidate], 
        [reference], 
        lang='en', 
        model_type='microsoft/deberta-xlarge-mnli', 
        verbose=True,
    )
    return (P[0].item(), R[0].item(), F1[0].item())