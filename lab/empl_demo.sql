DROP TABLE EMPL_DEMO CASCADE CONSTRAINTS;
CREATE TABLE EMPL_DEMO AS SELECT * FROM employees;
INSERT INTO empl_demo VALUES 
        ( 110
        , 'John'
        , 'Chen'
        , 'JCHEN'
        , '515.124.4269'
        , TO_DATE('28-08-1997', 'dd-mm-yyyy')
        , 'FI_ACCOUNT'
        , 8200
        , NULL
        , 108
        , 100
        );
INSERT INTO empl_demo VALUES 
        ( 139
        , 'John'
        , 'Seo'
        , 'JSEO'
        , '650.121.2019'
        , TO_DATE('12-02-1998', 'dd-mm-yyyy')
        , 'ST_CLERK'
        , 2700
        , NULL
        , 123
        , 50
        );
INSERT INTO empl_demo VALUES 
        ( 145
        , 'John'
        , 'Russell'
        , 'JRUSSEL'
        , '011.44.1344.429268'
        , TO_DATE('01-10-1996', 'dd-mm-yyyy')
        , 'SA_MAN'
        , 14000
        , .4
        , 100
        , 80
        );
commit;