conn / as sysdba

set linesize 150
set pagesize 100
set verify off

COLUMN "Parameter" FORMAT a40
COLUMN "Value" FORMAT a15
COLUMN "SES_MODIF" FORMAT a10
COLUMN "Description" FORMAT a50 word_wrapped

SELECT  a.ksppinm  "Parameter",
        b.ksppstvl "Value",
        decode(bitand(a.ksppiflg/256,1),1,'true','false') AS SES_MODIF,
        a.ksppdesc AS "Description"
FROM x$ksppi a, x$ksppcv b
WHERE a.indx = b.indx 
  AND a.ksppinm like lower('_%&parm_name%') ; 

set verify on