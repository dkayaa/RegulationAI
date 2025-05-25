
from langchain_anthropic import ChatAnthropic
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain_openai import ChatOpenAI
import os
import app_config 
def create(): 
    config_dict = app_config.GetConfigDict( )
    key_fp = config_dict['keys_fp']
    timeout = 60
    with open(os.path.join(key_fp, 'OPENAI_API_KEY')) as api_file:
        openai_key = api_file.read()
    with open(os.path.join(key_fp, 'ANTHROPIC_API_KEY')) as api_file:
        anthropic_key = api_file.read()
    with open(os.path.join(key_fp, 'GOOGLE_API_KEY')) as api_file:
        google_key = api_file.read()

    if "GOOGLE_API_KEY" not in os.environ:
        os.environ["GOOGLE_API_KEY"] = google_key
    if "ANTHROPIC_API_KEY" not in os.environ:
        os.environ["ANTHROPIC_API_KEY"] = anthropic_key
    if "OPENAI_API_KEY" not in os.environ:
        os.environ["OPENAI_API_KEY"] = openai_key 

    gemini_model = ChatGoogleGenerativeAI(
        model="gemini-1.5-pro",
        temperature=0,
        max_tokens=None,
        timeout=timeout,
        max_retries=2,
    )
    gpt_model = ChatOpenAI(api_key=openai_key, model="gpt-4o-mini", timeout=timeout)
    claude_model = ChatAnthropic(model='claude-3-opus-20240229', timeout=timeout)

    model_dict = {}
    model_dict['gemini'] = gemini_model
    model_dict['gpt'] = gpt_model
    model_dict['claude'] = claude_model

    return model_dict