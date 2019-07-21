set termout off
set long 10000
set longchunksize 10000
set linesize 150
set pagesize 1000
set echo off

variable my_sql_id varchar2(13)
variable my_task_name varchar2(64) 

BEGIN
 SELECT prev_sql_id INTO :my_sql_id 
 FROM v$session 
 WHERE sid = USERENV('SID'); 
END; 
/

execute :my_task_name := DBMS_SQLTUNE.CREATE_TUNING_TASK(sql_id=>:my_sql_id)

execute DBMS_SQLTUNE.EXECUTE_TUNING_TASK(:my_task_name)

spool report.txt
set termout on
SELECT DBMS_SQLTUNE.REPORT_TUNING_TASK(:my_task_name) FROM dual ; 
SELECT DBMS_SQLTUNE.SCRIPT_TUNING_TASK(:my_task_name) FROM DUAL;
spool off
set termout off

-- execute DBMS_SQLTUNE.DROP_TUNING_TASK(:my_task_name)
set termout on

