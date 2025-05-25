import pandas as pd
from sqlalchemy import create_engine, text, URL

def CreateCorpusForConventionalRAG(corpus_filename): 
    
    url_object = URL.create(
        "sqlite",
        database="../data/rag_database.db",
    )
    engine = create_engine(url_object)

    query = text(f"""
        SELECT 
            r.id,
            r.reg_description
        FROM
            regs r
        ORDER BY 
            r.id ASC
    """)
    df = pd.read_sql(query, engine)

    corpus = ""
    if df['id'].tolist():
        corpus = ' '.join(df['reg_description'].tolist())

    f = open('./'+corpus_filename, "w")
    f.write(corpus)
    f.close()