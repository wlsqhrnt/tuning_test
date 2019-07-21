drop table emp_kind purge;
CREATE TABLE emp_kind AS SELECT * FROM emp ; 

ALTER TABLE emp_kind ADD emp_kind VARCHAR2(1) DEFAULT 1 ; 

UPDATE emp_kind
SET emp_kind = CASE WHEN MOD(empno,2) = 1 THEN 1 ELSE 2 END ; 

COMMIT ; 

drop table emp_kind1 purge;
CREATE TABLE emp_kind1 
AS SELECT empno, ename, sal + 200 AS office_sal 
   FROM emp_kind
   WHERE emp_kind = '1' ; 

drop table emp_kind2;
CREATE TABLE emp_kind2
AS SELECT empno, ename, sal
   FROM emp_kind
   WHERE emp_kind = '2' ; 
