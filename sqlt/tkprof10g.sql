set echo off
set termout off
define _editor=vi

undefine trace_file
column trace_file_name new_value trace_file

SELECT d.value||'/'||lower(c.instance_name)||'_ora_'||b.spid||'.trc' AS trace_file_name
FROM v$session a,
     v$process b,
     v$instance c,
     v$parameter d
WHERE a.paddr = b.addr
AND a.sid = USERENV('SID')
AND d.name = 'user_dump_dest';

set termout on

host tkprof &trace_file /home/oracle/labs/output.trc sys=no
ed /home/oracle/labs/output.trc
