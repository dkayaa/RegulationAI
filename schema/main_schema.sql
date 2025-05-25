DROP TABLE IF EXISTS regs;
DROP TABLE IF EXISTS reg_relation;
DROP TABLE IF EXISTS rel_type;
CREATE TABLE regs 
( 	
    id INTEGER PRIMARY KEY, 	
    reg_description TEXT NOT NULL, 	
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE reg_relation 
(     
    id INTEGER PRIMARY KEY,      
    from_id INTEGER,      
    to_id INTEGER,      
    rel_type_id INTEGER 
);

CREATE TABLE rel_type 
(     
    id INTEGER PRIMARY KEY,      
    rel_description TEXT NOT NULL 
);
