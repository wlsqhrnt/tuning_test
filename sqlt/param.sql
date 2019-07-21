set linesize 150
set pagesize 100
set verify off

COLUMN name FORMAT a40
COLUMN value FORMAT a15
COLUMN isses_modifiable FORMAT a10
COLUMN description FORMAT a50 word_wrapped

SELECT name, 
       value, 
       isses_modifiable, 
       description
FROM v$parameter 
WHERE name LIKE lower('%&param_name%');
set verify on