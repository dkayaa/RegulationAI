from sentence_transformers import SentenceTransformer, util

model = SentenceTransformer('all-mpnet-base-v2')

def ComputeEmbedding(query): 
    emb = model.encode(query, convert_to_tensor=True)
    return emb

def ComputeSBert(sent1, sent2, model_id = 'all-mpnet-base-v2'):

    # embeddings
    embedding1 = model.encode(sent1, convert_to_tensor=True)
    embedding2 = model.encode(sent2, convert_to_tensor=True)

    # compute cosine similarity
    similarity = util.cos_sim(embedding1, embedding2)

    return similarity.item()

def BatchComputeSBert(sentence_pairs, model_id='all-mpnet-base-v2'):

    sentences1 = [s1 for s1, s2 in sentence_pairs]
    sentences2 = [s2 for s1, s2 in sentence_pairs]

    embeddings1 = model.encode(sentences1, convert_to_tensor=True)
    embeddings2 = model.encode(sentences2, convert_to_tensor=True)

    similarities = util.cos_sim(embeddings1, embeddings2).diagonal()
    results = similarities.tolist()
    return results 
