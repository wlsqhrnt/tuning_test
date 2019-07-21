set linesize 150
set pagesize 100

SELECT *
FROM table(dbms_xplan.display_cursor(null,null,'ALLSTATS LAST +predicate +outline +alias')) 
/
