
CREATE OR REPLACE VIEW DEPT_SUM AS( 
    SELECT D.DNOMBRE "DEPT_NOMBRE" , MIN(E.SALARIO) "SAL_MIN" ,
    MAX(E.SALARIO) "SAL_MAX" , TRUNC(AVG(E.SALARIO)) "SAL_MED"
    FROM EMPLE E, DEPART D
    WHERE E.DEPT_NO = D.DEPT_NO --JOIN
    GROUP BY E.DEPT_NO , D.DNOMBRE);
    
--COMPROBACION DE QUE SE HA CREADO LA VISTA

DESC DEPT_SUM;

SELECT VIEW_NAME , TEXT
FROM USER_VIEWS
WHERE UPPER(VIEW_NAME) = 'DEPT_SUM';
--COMPLEJA YA QUE TIENE MÁS DE UNA TABLA  
--Y UTILIZA FUNCIONES DE GRUPO

--EJERCICIO 2
DROP VIEW SAL_20;

SELECT VIEW_NAME , TEXT
FROM USER_VIEWS
WHERE UPPER(VIEW_NAME) = 'SAL_20' ;

--EJERCICIO 3

CREATE OR REPLACE VIEW DEPT_SALMAX AS 
    (SELECT DEPT_NO "COD_DEPART" , 
        TRUNC(MAX(SALARIO)) "SAL_MAX"
    FROM EMPLE
    GROUP BY DEPT_NO);
    
/*OTRA MANERA DE PONERLO
  
    CREATE OR REPLACE VIEW DEPT_SALMAX (COD_DEPART, SAL_MAX) 
    AS
    (SELECT DEPT_NO , 
        TRUNC(MAX(SALARIO))
    FROM EMPLE
    GROUP BY DEPT_NO);
*/
    
--COMPRUEBO QUE SE HA CREADO LA VISTA

DESC DEPT_SALMAX;

SELECT VIEW_NAME , TEXT
FROM USER_VIEWS
WHERE UPPER(VIEW_NAME)='DEPT_SALMAX';

--EJERCICIO 4

SELECT APELLIDO , SALARIO , DEPT_NO "CODIGO DEPARTAMENTO"
FROM EMPLE E
WHERE SALARIO >(SELECT AVG(SALARIO) 
                FROM EMPLE
                WHERE DEPT_NO=E.DEPT_NO 
                GROUP BY DEPT_NO )
ORDER BY E.APELLIDO
;
                
SELECT E.APELLIDO , E.SALARIO , E.DEPT_NO "CODIGO DEPARTAMENTO"
FROM EMPLE E, DEPT_SUM DS, DEPART D
WHERE DS.DEPT_NOMBRE = D.DNOMBRE --JOIN DE DEPART Y DE LA VISTA
        AND E.DEPT_NO = D.DEPT_NO --JOIN DE EMPLE Y DEPARTAMENTO
        AND E.SALARIO > DS.SAL_MED --CONDICION DE QUE EL SALARIO SEA MAYOR QUE LA MEDIA
ORDER BY E.APELLIDO
;                
                
                
--EJERCICIO 5

SELECT E.APELLIDO , E.SALARIO , E.DEPT_NO "CODIGO DEPARTAMENTO", DS.SAL_MED
FROM EMPLE E, DEPT_SUM DS, DEPART D
WHERE DS.DEPT_NOMBRE = D.DNOMBRE --JOIN DE DEPART Y DE LA VISTA
        AND E.DEPT_NO = D.DEPT_NO --JOIN DE EMPLE Y DEPARTAMENTO
        AND E.SALARIO > DS.SAL_MED --CONDICION DE QUE EL SALARIO SEA MAYOR QUE LA MEDIA
ORDER BY E.APELLIDO
;         

--Ejercicio 6

DROP TABLE CENTROS CASCADE CONSTRAINTS;

CREATE TABLE CENTROS (
ID NUMBER(2) GENERATED ALWAYS AS IDENTITY 
                                    start with 1
                                    maxvalue 99
                                    increment by 1
                                    nocycle nocache,
NOMBRE VARCHAR2(30) NOT NULL,
CALLE VARCHAR2(30),
NUMERO NUMBER(2),
CP VARCHAR2(5),
CIUDAD VARCHAR2(15),
PROVINCIA VARCHAR2(40),
TELEFONO VARCHAR2(9),
CONSTRAINT CENTROS_ID_PK PRIMARY KEY (ID)
);
     
--comprobacion de la tabla     
desc user_tables;     

select table_name
from user_tables
where upper(table_name)='CENTROS';

desc centros;

--COMPROBAR LAS COLUMNAS 
DESC USER_CONSTRAINTS;
DESC USER_VONS_COLUMNS;

select c.constraint_name, c.constraint_type, cc.table_name, cc.column_name
from user_constraints c, user_cons_columns cc
where c.constraint_name = cc.constraint_name --JOIN
and upper(c.table_name) = 'CENTROS';

desc user_sequences;

select table_name, column_name, data_default
from user_tab_columns
where upper(table_name) = 'CENTROS';

select last_number, increment_by, min_value, max_value
from user_sequences
where sequence_name = 'ISEQ$$_328316';

--EJERCICIO 7

INSERT INTO CENTROS(NOMBRE,CALLE,NUMERO,CP,CIUDAD,PROVINCIA,TELEFONO)
VALUES ('NASA', 'FRANCIA',27,01010,'VITORIA','ALAVA',945874963);

select * from centros;

--EJERCICIO 8
drop index ind_fk_dept;
CREATE INDEX IND_FK_DEPT
ON EMPLE(DEPT_NO);



--EJERCICIO 9
DESC USER_INDEXES;
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME, UNIQUENESS
FROM USER_INDEXES
WHERE UPPER(TABLE_NAME)= 'EMPLE';

--EJERCICIO 10
DROP INDEX IND_FK_DEPT;

--EJERCICIO 11
DESC DEPART

CREATE INDEX IND_DEPT_DNOMBRE
ON DEPART (upper(DNOMBRE));

--EJERCICIO 13
ALTER INDEX IND_DEPT_DNOMBRE MONITORING USAGE;
select *
from v$object_usage;

--EJERCICIO 14


ALTER INDEX IND_DEPT_DNOMBRE NOMONITORING USAGE;

select monitoring
from user_indexes;


select*
from depart;


select*
from depart
where upper(dnombre) like'%A%';

--EJERCICIO 15
CREATE PUBLIC SYNONYM DEP1
FOR DEPART;

rename DEPART to DEPARTes;

DESC USER_SYNONYMS


SELECT SYNONYM_NAME, TABLE_NAME
FROM USER_SYSNONYMS
WHERE UPPER(SYNONYM_NAME)= 'DEP1';


create public synonym empleadoso
for daw04.emple;


DESC SYS.user_synonyms;

select *
from all_synonyms
where upper(SYNONYM_NAME)='EMPLEADOSO';

select *
from empleados;

select *
from empleadoso
--EJERCICIO 16

DROP SYNONYM DEP1;
                
 -- obtener apellido oficio de los empleados con el mismo ficio y y mismo departamento
 
 select distinct oficio
 from emple
 where UPPER(OFICIO) IN (SELECT OFICIO
                        FROM EMPLE E
                        WHERE E.DEPT_NO=(SELECT DEPT_NO
                                        FROM DEPART
                                        WHERE UPPER(DNOMBRE)='INVESTIGACION'));
 

 
 
 --numero departamento oficio y salario de los oficios 
 --con mayor salario de cada departamento
 
 select distinct dept_no,
 oficio,salario
 from emple a
 where salario in (select max(b.salario)
                from emple b
                where a.dept_no=b.dept_no)
 order by dept_no;


--los departamentos que tienen menos de dos empleados
select *
from depart;

delete from depart
where dept_no not in (select dept_no
                 FROM EMPLE
                 group by dept_no
                 having count(*)>=2);
     
     
select *
from depart;     



--aumentar 500 a departamentos no este en madrid

select emp_no,salario
from emple
where dept_no in (select dept_no
                from depart
                where upper(loc)='MADRID');

update emple
set salario = salario+5000
where dept_no  in (select dept_no
                from depart
                where upper(loc)!='MADRID');

select emp_no,salario
from emple
where dept_no in (select dept_no
                from depart
                where upper(loc)='MADRID');
                
                
rollback;
commit;
