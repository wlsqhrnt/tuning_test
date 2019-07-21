conn / as sysdba
set termout off
ALTER USER SYSTEM IDENTIFIED BY oracle ;
BEGIN
  FOR sess_rec IN ( SELECT sid, serial#
                    FROM v$session
                    WHERE username = 'TEST') LOOP
    EXECUTE IMMEDIATE 'ALTER SYSTEM KILL SESSION '''||sess_rec.sid||','||sess_rec.serial#||'''' ;
  END LOOP ;
END ;
/

DROP TABLESPACE TBS1 INCLUDING CONTENTS AND DATAFILES ;

CREATE BIGFILE TABLESPACE TBS1
DATAFILE 'TBS1.dbf' SIZE 100M AUTOEXTEND ON NEXT 20M MAXSIZE UNLIMITED
EXTENT MANAGEMENT LOCAL UNIFORM SIZE 64K
SEGMENT SPACE MANAGEMENT AUTO ;

DROP USER test  CASCADE ;
CREATE USER test  IDENTIFIED BY test DEFAULT TABLESPACE TBS1 ;

GRANT DBA TO test ;

set termout on

CREATE OR REPLACE DIRECTORY data_dir AS 'c:\labs' ;
host impdp system/oracle directory=data_dir dumpfile=labs.dmp

exit