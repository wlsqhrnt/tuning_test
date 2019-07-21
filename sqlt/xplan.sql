set linesize 200
set pagesize 100

SELECT *
FROM table(dbms_xplan.display_cursor(null,null,'ALLSTATS LAST +predicate')) ;
