set termout off
alter session set events '10053 trace name context off';
set termout on
@@trace.sql
