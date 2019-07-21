set echo off
set termout off
define _editor=vi

undefine trace
column trace_file new_value trace

SELECT d.value||'/'||c.instance_name||'_ora_'||b.spid||'.trc' AS trace_file
FROM v$session a,
     v$process b,
     v$instance c,
     v$parameter d
WHERE a.paddr = b.addr
AND a.sid = USERENV('SID')
AND d.name = 'user_dump_dest';

set termout on
ed &trace
