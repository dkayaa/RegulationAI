import sqlite3

def create_connection(db_name): 
    connection = sqlite3.connect(db_name)
    return connection 

def insert_data(connection, db_script):
    with open(db_script) as f:
        connection.executescript(f.read())
    
    print("{0} Data Inserted To Database".format(db_script))
    return connection 

def setup_db(db_name, schema_script): 
    c = create_connection(db_name)

    #insert schema
    c = insert_data(c, schema_script)
    return c


