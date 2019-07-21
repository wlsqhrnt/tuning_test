set echo off
set termout off
define _editor=vi

undefine trace
column trace_file new_value trace

SELECT value AS trace_file
FROM v$diag_info
WHERE name = 'Default Trace File' ;

set termout on
ed &trace
