set termout off
alter session set events '10046 trace name context off';
set termout on
@@tkprof.sql
