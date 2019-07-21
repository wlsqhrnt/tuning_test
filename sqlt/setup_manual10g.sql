CONNECT / AS SYSDBA 

ALTER SYSTEM FLUSH SHARED_POOL ; 
ALTER SYSTEM FLUSH BUFFER_CACHE ; 

DROP USER USER01 CASCADE ; 
DROP TABLESPACE userdata INCLUDING CONTENTS AND DATAFILES ; 

CREATE TABLESPACE userdata DATAFILE 'userdata.dbf' SIZE 200M AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED ;
CREATE USER USER01 IDENTIFIED BY oracle DEFAULT TABLESPACE userdata ; 

GRANT DBA TO user01 ; 

CONNECT user01/oracle 

/* SCHEMA : SCOTT */ 
CREATE TABLE emp	AS SELECT * FROM scott.emp ; 
CREATE TABLE dept	AS SELECT * FROM scott.dept ; 
CREATE TABLE salgrade	AS SELECT * FROM scott.salgrade ;

CREATE UNIQUE	INDEX emp_empno_ix	ON emp(empno)		COMPUTE STATISTICS ; 
CREATE		INDEX emp_ename_ix	ON emp(ename)		COMPUTE STATISTICS ;
CREATE		INDEX emp_job_ix	ON emp(job)		COMPUTE STATISTICS ;
CREATE		INDEX emp_mgr_ix	ON emp(mgr)		COMPUTE STATISTICS ;
CREATE		INDEX emp_hiredate_ix	ON emp(hiredate)	COMPUTE STATISTICS ;
CREATE		INDEX emp_sal_ix	ON emp(sal)		COMPUTE STATISTICS ;
CREATE		INDEX emp_comm_ix	ON emp(comm)		COMPUTE STATISTICS ;
CREATE		INDEX emp_deptno_ix	ON emp(deptno)		COMPUTE STATISTICS ;

CREATE UNIQUE	INDEX dept_deptno_ix	ON dept(deptno)		COMPUTE STATISTICS ; 
CREATE		INDEX dept_dname_ix	ON dept(dname)		COMPUTE STATISTICS ; 
CREATE		INDEX dept_loc_ix	ON dept(loc)		COMPUTE STATISTICS ; 

/* SCHEMA : HR */ 
CREATE TABLE employees		AS SELECT * FROM hr.employees ;
CREATE TABLE departments	AS SELECT * FROM hr.departments ;
CREATE TABLE jobs		AS SELECT * FROM hr.jobs ;
CREATE TABLE job_history	AS SELECT * FROM hr.job_history ;
CREATE TABLE locations		AS SELECT * FROM hr.locations ;
CREATE TABLE regions		AS SELECT * FROM hr.regions ;
CREATE TABLE country		AS SELECT * FROM hr.countries ; 

CREATE UNIQUE	INDEX empl_empid_ix	ON employees(employee_id)		COMPUTE STATISTICS ; 
CREATE		INDEX empl_name_ix	ON employees(last_name,first_name)	COMPUTE STATISTICS ; 
CREATE		INDEX empl_job_ix	ON employees(job_id)			COMPUTE STATISTICS ; 
CREATE		INDEX empl_email_ix	ON employees(email)			COMPUTE STATISTICS ; 
CREATE		INDEX empl_sal_ix	ON employees(salary)			COMPUTE STATISTICS ; 
CREATE		INDEX empl_mgr_ix	ON employees(manager_id)		COMPUTE STATISTICS ; 
CREATE		INDEX empl_deptno_ix	ON employees(department_id)		COMPUTE STATISTICS ; 

CREATE UNIQUE	INDEX dept_deptid_ix	ON departments(department_id)		COMPUTE STATISTICS ; 
CREATE		INDEX dept_location_ix	ON departments(location_id)		COMPUTE STATISTICS ; 
CREATE		INDEX dept_name_ix	ON departments(department_name)		COMPUTE STATISTICS ; 
CREATE		INDEX dept_mgr_ix	ON departments(manager_id)		COMPUTE STATISTICS ; 

CREATE UNIQUE	INDEX jobs_id_ix	ON jobs(job_id)				COMPUTE STATISTICS ; 
CREATE		INDEX jobs_title_ix	ON jobs(job_title)			COMPUTE STATISTICS ; 

CREATE		INDEX jhist_empid_ix	ON job_history(employee_id)		COMPUTE STATISTICS ; 
CREATE		INDEX jhist_deptid_ix	ON job_history(department_id)		COMPUTE STATISTICS ; 
CREATE		INDEX jhist_jobid_ix	ON job_history(job_id)			COMPUTE STATISTICS ; 

CREATE UNIQUE	INDEX loc_id_ix		ON locations(location_id)		COMPUTE STATISTICS ; 
CREATE		INDEX loc_city_ix	ON locations(city)			COMPUTE STATISTICS ; 
CREATE		INDEX loc_state_ix	ON locations(state_province)		COMPUTE STATISTICS ; 
CREATE		INDEX loc_country_ix	ON locations(country_id)		COMPUTE STATISTICS ; 

CREATE UNIQUE	INDEX country_id_ix	ON country(country_id)			COMPUTE STATISTICS ; 
CREATE		INDEX country_name_ix	ON country(country_name)		COMPUTE STATISTICS ; 

CREATE UNIQUE	INDEX reg_id_ix		ON regions(region_id)			COMPUTE STATISTICS ; 

/* SCHEMA : SH */ 
CREATE TABLE sales	AS SELECT * FROM sh.sales ; 
CREATE TABLE customers	AS SELECT * FROM sh.customers ; 
CREATE TABLE products	AS SELECT * FROM sh.products ; 
CREATE TABLE channels	AS SELECT * FROM sh.channels ; 
CREATE TABLE promotions	AS SELECT * FROM sh.promotions ;
CREATE TABLE countries	AS SELECT * FROM sh.countries ;
CREATE TABLE times	AS SELECT * FROM sh.times ;
CREATE TABLE costs	AS SELECT * FROM sh.costs ;

CREATE		INDEX sales_cust_ix	ON sales(cust_id)	COMPUTE STATISTICS ; 
CREATE		INDEX sales_promo_ix	ON sales(promo_id)	COMPUTE STATISTICS ; 
CREATE		INDEX sales_time_ix	ON sales(time_id)	COMPUTE STATISTICS ; 
CREATE		INDEX sales_channel_ix	ON sales(channel_id)	COMPUTE STATISTICS ; 
CREATE		INDEX sales_prod_ix	ON sales(prod_id)	COMPUTE STATISTICS ; 

CREATE UNIQUE	INDEX custs_id_ix	ON customers(cust_id)			COMPUTE STATISTICS ; 
CREATE 		INDEX custs_gender_ix	ON customers(cust_gender)		COMPUTE STATISTICS ; 
CREATE 		INDEX custs_marital_ix	ON customers(cust_marital_status)	COMPUTE STATISTICS ; 
CREATE 		INDEX custs_yob_ix	ON customers(cust_year_of_birth)	COMPUTE STATISTICS ; 
CREATE 		INDEX custs_fname_ix	ON customers(cust_first_name)		COMPUTE STATISTICS ; 
CREATE 		INDEX custs_lname_ix	ON customers(cust_last_name)		COMPUTE STATISTICS ; 
CREATE 		INDEX custs_postal_ix	ON customers(cust_postal_code)		COMPUTE STATISTICS ; 
CREATE 		INDEX custs_city_ix	ON customers(cust_city)			COMPUTE STATISTICS ; 
CREATE 		INDEX custs_cityid_ix	ON customers(cust_city_id)		COMPUTE STATISTICS ; 
CREATE 		INDEX custs_phone_ix	ON customers(cust_main_phone_number)	COMPUTE STATISTICS ; 
CREATE 		INDEX custs_credit_ix	ON customers(cust_credit_limit)		COMPUTE STATISTICS ; 

CREATE UNIQUE	INDEX prod_id_ix	ON products(prod_id)		COMPUTE STATISTICS ; 
CREATE		INDEX prod_subcat_ix	ON products(prod_subcategory)	COMPUTE STATISTICS ; 
CREATE		INDEX prod_cat_ix	ON products(prod_category)	COMPUTE STATISTICS ; 
CREATE		INDEX prod_status_ix	ON products(prod_status)	COMPUTE STATISTICS ; 

CREATE UNIQUE	INDEX channel_id_ix	ON channels(channel_id)		COMPUTE STATISTICS ; 

CREATE UNIQUE	INDEX promo_id_ix	ON promotions(promo_id)		COMPUTE STATISTICS ; 
CREATE		INDEX promo_name_ix	ON promotions(promo_name)	COMPUTE STATISTICS ; 

CREATE UNIQUE	INDEX countries_id_ix	ON countries(country_id)	COMPUTE STATISTICS ; 

CREATE UNIQUE	INDEX times_id_ix	ON times(time_id)		COMPUTE STATISTICS ; 
CREATE		INDEX times_year_id_ix	ON times(calendar_year,time_id)	COMPUTE STATISTICS ;

CREATE		INDEX costs_prod_ix	ON costs(prod_id)		COMPUTE STATISTICS ; 
CREATE		INDEX costs_time_ix	ON costs(time_id)		COMPUTE STATISTICS ; 
CREATE		INDEX costs_promo_ix	ON costs(promo_id)		COMPUTE STATISTICS ; 
CREATE		INDEX costs_channel_ix	ON costs(channel_id)		COMPUTE STATISTICS ; 

/* SCHEMA : OE */ 
CREATE TABLE orders	 AS SELECT * FROM oe.orders ; 
CREATE TABLE order_items AS SELECT * FROM oe.order_items ; 

CREATE UNIQUE	INDEX ords_id_ix	ON orders(order_id)		COMPUTE STATISTICS ; 
CREATE		INDEX ords_cust_ix	ON orders(customer_id)		COMPUTE STATISTICS ; 
CREATE		INDEX ords_sales_rep_ix	ON orders(sales_rep_id)		COMPUTE STATISTICS ; 
CREATE		INDEX ords_orderdate_ix	ON orders(order_date)		COMPUTE STATISTICS ;

CREATE UNIQUE	INDEX order_items_pk	ON order_items(order_id,line_item_id)	COMPUTE STATISTICS ; 
CREATE UNIQUE	INDEX order_items_uk	ON order_items(order_id,product_id)	COMPUTE STATISTICS ; 
CREATE		INDEX item_order_ix	ON order_items(order_id)		COMPUTE STATISTICS ; 
CREATE		INDEX item_product_ix	ON order_items(product_id)		COMPUTE STATISTICS ; 

/* Additional */

CREATE TABLE employee
     (employee_id    VARCHAR2(6),
      first_name     VARCHAR2(20),
      last_name      VARCHAR2(25),
      email          VARCHAR2(25),
      phone_number   VARCHAR2(20),
      hire_date      VARCHAR2(8),
      job_id         VARCHAR2(10), 
      salary         NUMBER(8,2),
      commission_pct NUMBER(2,2),
      manager_id     VARCHAR2(6),
      department_id  VARCHAR2(4)) ;

ALTER SESSION SET nls_date_format = 'YYYYMMDD' ;
INSERT INTO employee SELECT * FROM employees ; 

CREATE UNIQUE	INDEX employ_empid_ix	ON employee(employee_id)		COMPUTE STATISTICS ; 
CREATE		INDEX employ_hire_ix	ON employee(hire_date)			COMPUTE STATISTICS ;
CREATE		INDEX employ_deptno_ix	ON employee(department_id)		COMPUTE STATISTICS ; 

CREATE TABLE mcustsum
AS
SELECT rownum custno
     , '2008' || lpad(ceil(rownum/100000), 2, '0') salemm
     , decode(mod(rownum, 12), 1, 'A', 'B') salegb
     , round(dbms_random.value(1000,100000), -2) saleamt
FROM  sales ;

CREATE		INDEX mcust_x01 ON mcustsum(salemm, salegb)			COMPUTE STATISTICS ;

CREATE TABLE emp_kind AS SELECT * FROM emp ; 

ALTER TABLE emp_kind ADD emp_kind VARCHAR2(1) DEFAULT 1 ; 

UPDATE emp_kind
SET emp_kind = CASE WHEN MOD(empno,2) = 1 THEN 1 ELSE 2 END ; 

COMMIT ; 

CREATE TABLE emp_kind1 
AS SELECT empno, ename, sal + 200 AS office_sal 
   FROM emp_kind
   WHERE emp_kind = '1' ; 

CREATE TABLE emp_kind2
AS SELECT empno, ename, sal
   FROM emp_kind
   WHERE emp_kind = '2' ; 

/* DROP Constraints */ 
BEGIN 
 FOR cons_rec IN ( SELECT table_name, constraint_name 
                   FROM user_constraints ) LOOP 
   EXECUTE IMMEDIATE 'ALTER TABLE '||cons_rec.table_name||' DROP CONSTRAINT '||cons_rec.constraint_name ; 
 END LOOP ; 
END ;
/

DROP TABLE family PURGE ;

CREATE TABLE family
(empno    NUMBER(4),
 name     VARCHAR2(10)) ;

INSERT INTO family
SELECT 7788, first_name
FROM employees
WHERE department_id = 10 ;

INSERT INTO family
SELECT 7566, first_name
FROM employees
WHERE department_id = 20 ;

INSERT INTO family
SELECT 7369, first_name
FROM employees
WHERE department_id = 30 ;

COMMIT ;

DROP TABLE salary PURGE ;

CREATE TABLE salary
(empno      NUMBER(4),
 paymonth   CHAR(6),
 sal        NUMBER(7,2),
 comm       NUMBER(7,2)) ;

INSERT INTO salary
SELECT empno, '200001', sal-300, comm
FROM emp ;

INSERT INTO salary
SELECT empno, '200002', sal-300, comm
FROM emp ;

INSERT INTO salary
SELECT empno, '200003', sal, comm
FROM emp ;

INSERT INTO salary
SELECT empno, '200004', sal, comm
FROM emp ;

INSERT INTO salary
SELECT empno, '200005', sal, comm
FROM emp ;

COMMIT ;

DROP TABLE sales_plan PURGE ;
DROP TABLE sales_result PURGE ;

CREATE TABLE sales_plan
  (
    item           VARCHAR2(20),
    Plan_date      VARCHAR2(20),
    sales_deptname VARCHAR2(20),
    Unit           NUMBER(10)
  );

CREATE TABLE sales_result
  (
    item          VARCHAR2(20),
    sale_date     VARCHAR2(20),
    sales_channel VARCHAR2(20),
    Unit          NUMBER(10)
  );

INSERT INTO sales_plan VALUES
  ('Others', '20120101', 'Sales' ,100
  );
INSERT INTO sales_plan VALUES
  ('Others', '20120101', 'Sales' ,100
  );
INSERT INTO sales_plan VALUES
  ('Others', '20120101', 'Sales' ,100
  );
INSERT INTO sales_plan VALUES
  ('Others', '20120102', 'Sales' ,300
  );
INSERT INTO sales_plan VALUES
  ('Others', '20120120', 'Sales' ,100
  );
INSERT INTO sales_plan VALUES
  ('Others', '20120124', 'Sales' ,100
  );
INSERT INTO sales_plan VALUES
  ('Organ' , '20120122', 'Sales' ,300
  );
INSERT INTO sales_plan VALUES
  ('Organ' , '20120122', 'Sales' , 300
  );
INSERT INTO sales_plan VALUES
  ('Cello' , '20120104', 'General', 400
  );
INSERT INTO sales_plan VALUES
  ('Cello' , '20120104', 'General', 400
  );
INSERT INTO sales_plan VALUES
  ('piano' , '20120121', 'HR' , 100
  );
INSERT INTO sales_plan VALUES
  ('piano' , '20120124', 'HR' , 100
  );
COMMIT;

INSERT INTO sales_result VALUES
  ( 'Others', '20120101', 'Sales', 200
  );
INSERT INTO sales_result VALUES
  ( 'Others', '20120102', 'Sales', 100
  );
INSERT INTO sales_result VALUES
  ( 'Others', '20120120', 'HR', 100
  );
INSERT INTO sales_result VALUES
  ( 'Ajaeng', '20120101', 'Sales', 100
  );
INSERT INTO sales_result VALUES
  ( 'Organ', '20120122', 'Sales', 300
  );
INSERT INTO sales_result VALUES
  ( 'Organ', '20120122', 'Sales', 300
  );
INSERT INTO sales_result VALUES
  ( 'Cello', '20120104', 'General', 400
  );
INSERT INTO sales_result VALUES
  ( 'Cello', '20120104', 'General', 400
  );
INSERT INTO sales_result VALUES
  ( 'Piano', '20120121', 'HR', 100
  );
INSERT INTO sales_result VALUES
  ( 'Piano', '20120124', 'HR', 100
  );
INSERT INTO sales_result VALUES
  ( 'Ban', '20120101', 'General', 300
  );
COMMIT;

/* Optimizer Statistics */ 
EXECUTE dbms_stats.gather_schema_stats('USER01') ; 

/* Export */ 
CREATE OR REPLACE DIRECTORY data_dir AS '/home/oracle/labs'; 
HOST expdp user01/oracle directory=data_dir dumpfile=user01.dmp schemas=user01 version=10.2.0.1

