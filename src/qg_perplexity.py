import torch
from transformers import GPT2Tokenizer, GPT2LMHeadModel

def calculate_perplexity(text, model_name="gpt2"):
    model = GPT2LMHeadModel.from_pretrained(model_name).to("cpu")
    tokenizer = GPT2Tokenizer.from_pretrained(model_name)
    model.eval()

    encodings = tokenizer(text, return_tensors="pt")
    input_ids = encodings.input_ids.to("cpu")  #cpu-based
    with torch.no_grad():
        outputs = model(input_ids, labels=input_ids)
        loss = outputs.loss
        perplexity = torch.exp(loss)

    return perplexity.item()