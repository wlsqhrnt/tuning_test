set echo off
set termout off
set feedback 1
set linesize 200
set pagesize 100

conn test/test
alter session set max_dump_file_size=unlimited ;
alter session set events '10046 trace name context forever, level 12';
set termout on
