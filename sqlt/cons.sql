SET ECHO OFF
SET LINESIZE 150
SET PAGESIZE 100
COLUMN table_name FORMAT A15
COLUMN constraint_name FORMAT A20
COLUMN constraint_type FORMAT A15
COLUMN search_condition FORMAT A30
SET VERIFY OFF
SELECT table_name, constraint_name, constraint_type, search_condition
FROM user_constraints 
WHERE table_name = UPPER('&name')
ORDER BY 2 ; 
SET VERIFY ON