set linesize 200
set pagesize 100
select *
from table(dbms_xplan.display_cursor(null,null,'ALLSTATS LAST +alias +outline +predicate +parallel')) ;
