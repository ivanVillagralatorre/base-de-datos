INSERT INTO DEPART (DEPT_NO,DNOMBRE,LOC) VALUES (11,'CALIDAD','SANTANDER');
select * from DEPART;

INSERT INTO EMPLE VALUES (7230,'AGUIRRE','EMPLEADO',7782,TO_DATE('23/01/1982','DD/MM/YYYY'),1690,NULL,10);



select * from  emple;

select EMPLE_NO,salario 
from emple;


UPDATE EMPLE SET SALARIO = SALARIO-(SALARIO*0.10) ;

select EMPLE_NO,salario from emple;


commit;

select  EMPLE_NO,dept_no 
from emple
where dept_no IN (SELECT DEPT_NO
                  FROM DEPART
                 WHERE UPPER(DNOMBRE) IN('PRODUCCION','CONTABILIDAD'));


UPDATE EMPLE 
SET DEPT_NO = (select DEPT_NO
                 FROM emple
                where UPPER(DNOMBRE)='PRODUCCION')
WHERE DEPT_NO =10;


select  EMPLE_NO,dept_no 
from emple
where dept_no=40;

commit;



SELECT  EMP_NO,ID_JEFE
FROM EMPLE
WHERE ID_JEFE IN(7566,(SELECT id_jefe
                      FROM EMPLE
                      WHERE UPPER (APELLIDOS)='TOVAR'))
                      
ORDER BY ID_JEFE;



UPDATE EMPLE
SET id_jefe = (select id_jefe
                from EMPLE
                where UPPER(APELLIDO)='TOVAR')
WHERE ID_JEFE = 7566;


SELECT  EMP_NO,ID_JEFE,APELLIDO
FROM EMPLE
WHERE ID_JEFE =(SELECT ID_JEFE
                      FROM EMPLE
                      WHERE UPPER(APELLIDO)='TOVAR')
ORDER BY JEFE;
                      
COMMIT;


SELECT EMPLE_NO,APELLIDO,SALARIO,OFICIO
FROM EMPLE
WHERE  UPPER(APELLIDO)='MUNIOZ' OR UPPER(APELLIDO)='MUNIOZ' ;
                
               
UPDATE EMPLE
SET salario = nvl((select salario
            from emple
            where  apellido ='MUNIOZ'),0)
WHERE OFICIO = 'EMPLEADO' ;


SELECT EMP_NO, SALARIO
FROM EMPLE
WHERE OFICIO = 'EMPLEADO';

COMMIT;

SELECT EMP_NO,COMISION_PCT,DEPT_NO
FROM EMPLE
WHERE DEPT_NO IN (SELECT DEPT_NO
                FROM DEPART
                WHERE UPPER(LOC)='SANTANDER');

UPDATE EMPLE 
SET COMISION_PCT =  300
WHERE dept_no IN (SELECT dept_no
                from depart
                where UPPER(loc)='SANTANDER');

COMMIT;

 SELECT  EMPLE_NO, APELLIDOS , DEPT_NO
FROM EMPLE
WHERE DEPT_NO IN (SELECT DEPT_NO
                 FROM DEPART
                 WHERE UPPER(DNOMBRE)='VENTAS'
                    );

delete from emple
where DEPT_NO IN (SELECT DEPT_NO
                 FROM DEPART
                 WHERE UPPER(DNOMBRE)='VENTAS'
                    );


SELECT  EMPLE_NO , DEPT_NO
FROM EMPLE;

commit;

