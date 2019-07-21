drop table mcustsum purge
/
CREATE TABLE mcustsum
AS
SELECT rownum custno
     , '2008' || lpad(ceil(rownum/100000), 2, '0') salemm
     , decode(mod(rownum, 12), 1, 'A', 'B') salegb
     , round(dbms_random.value(1000,100000), -2) saleamt
FROM  sales 
/

drop index mcust_01
/

CREATE	INDEX mcust_x01 ON mcustsum(salemm, salegb)
COMPUTE STATISTICS 
/

exec dbms_stats.gather_table_stats('test','mcustsum')
