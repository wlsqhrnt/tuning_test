set echo off
set termout off
define _editor=notepad.exe

undefine trace
column trace_file new_value trace

SELECT value AS trace_file
FROM v$diag_info
WHERE name = 'Default Trace File' ;

set termout on
host tkprof &trace c:\labs\output.trc sys=no
ed c:\labs\output.trc
