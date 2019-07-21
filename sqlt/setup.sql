SET echo on 
CONN / AS SYSDBA

DROP USER user01 CASCADE ; 
DROP TABLESPACE userdata INCLUDING CONTENTS AND DATAFILES ; 

CREATE TABLESPACE userdata DATAFILE '/home/oracle/userdata.dbf' SIZE 200M AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED ;

CREATE OR REPLACE DIRECTORY DATA_DIR AS '/home/oracle/sqlt;

HOST impdp system/oracle_4U DIRECTORY=DATA_DIR DUMPFILE=user01.dmp

EXECUTE dbms_stats.gather_schema_stats('USER01') ; 

CONN user01/oracle 
SET echo off