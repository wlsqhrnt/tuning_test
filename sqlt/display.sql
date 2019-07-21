SET linesize 150
SET pagesize 100

SELECT * 
FROM table(dbms_xplan.display) ;
