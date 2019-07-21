set echo off
set termout off

CONN user01/oracle

DROP TABLE sales_pivot ; 
DROP TABLE sales_unpivot ; 
PURGE RECYCLEBIN ; 

set termout on

CREATE TABLE sales_pivot
AS
SELECT p.prod_name                        AS product,       
       s.cust_id                          AS cust_id,
       s.channel_id                       AS channel,       
       s.time_id                          AS time_id,
       LPAD(TO_CHAR(s.time_id,'Q'),2,'0') AS quarter,
       s.promo_id                         AS promotion,
       s.quantity_sold                    AS quantity_sold, 
       s.amount_sold                      AS amount_sold
FROM products p, sales s
WHERE p.prod_id = s.prod_id ;

CREATE TABLE sales_unpivot AS
SELECT product, SUM(DECODE(quarter,01,quantity_sold)) AS Q1, 
                SUM(DECODE(quarter,02,quantity_sold)) AS Q2, 
                SUM(DECODE(quarter,03,quantity_sold)) AS Q3, 
                SUM(DECODE(quarter,04,quantity_sold)) AS Q4
FROM sales_pivot
GROUP BY product ;

INSERT INTO sales_pivot SELECT * FROM sales_pivot ;
/
COMMIT ;

set termout off

EXECUTE dbms_stats.gather_table_stats(USER,'sales_pivot') ;
EXECUTE dbms_stats.gather_table_stats(USER,'sales_unpivot');

set termout on
