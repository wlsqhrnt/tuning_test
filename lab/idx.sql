set verify off
column index_name format a30
column index_type format a15
column uniqueness format a15
column columns format a30

select a.index_name, a.index_type, a.uniqueness,
       LISTAGG(b.column_name,'+')
       WITHIN GROUP (ORDER BY b.column_position) AS columns
from user_indexes a, user_ind_columns b
where a.index_name = b.index_name
  and a.table_name = upper('&tab_name')
group by a.index_name, a.index_type, a.uniqueness;
set verify on
