set echo off
set termout off

conn user01/oracle
alter system flush shared_pool ;
alter session set events '10053 trace name context forever,level 1' ;
set termout on
