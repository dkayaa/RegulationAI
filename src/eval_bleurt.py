import evaluate

bleurt = evaluate.load("bleurt", "bleurt-large-512")

def ComputeBleurt(candidate, reference):

    # Compute BLEURT scores
    results = bleurt.compute(predictions=[candidate], references=[reference])

    # Print the scores
    for ref, cand, score in zip([reference], [candidate], results["scores"]):
        return score
