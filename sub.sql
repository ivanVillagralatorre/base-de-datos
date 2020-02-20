--1
SELECT APELLIDO
FROM EMPLE
WHERE OFICIO in (SELECT distinct OFICIO
               FROM EMPLE
               WHERE UPPER(APELLIDO)='GIL')
     AND UPPER(APELLIDO)!='GIL';
               

--2--no serviria si se quisiera sacar loc
SELECT *
FROM EMPLE
WHERE DEPT_NO IN (SELECT DEPT_NO
                  FROM DEPART
                  WHERE upper(LOC) IN('MADRID','BARCELONA'));
  
  
 SELECT apellido ,d.loc
 from emple e,depart d
 where e.dept_no=d.dept_no and upper(LOC) IN('MADRID','BARCELONA');
 

--3
SELECT APELLIDO,SALARIO
FROM EMPLE
WHERE OFICIO =(SELECT OFICIO
               FROM EMPLE
               WHERE UPPER(APELLIDO)='GIL')

AND SALARIO =(SELECT SALARIO
               FROM EMPLE
               WHERE UPPER(APELLIDO)='GIL')
and  UPPER(APELLIDO)!='GIL';
               
               
SELECT APELLIDO,SALARIO
FROM EMPLE
WHERE (OFICIO,salario) in(SELECT OFICIO,salario
                           FROM EMPLE
                           WHERE UPPER(APELLIDO)='GIL')
and UPPER(APELLIDO)!='GIL' ;              


--4
SELECT *
FROM EMPLE
WHERE OFICIO =ANY (SELECT DISTINCT OFICIO
               FROM EMPLE
               WHERE UPPER(APELLIDO)='JIMENEZ') AND UPPER(APELLIDO)!='JIMENEZ'           
OR
SALARIO >=ALL(SELECT DISTINCT SALARIO
               FROM EMPLE
               WHERE UPPER(APELLIDO)='FERNANDEZ')AND UPPER(APELLIDO)!='FERNANDEZ';
               
               
--5 
select dept_no ,count(*)
from emple 
group by dept_no
having count(*)=(select max(count(*))
                 from emple
                 group by dept_no);
                 
    
--6
SELECT  OFICIO,avg(salario)
from emple
group by oficio
having avg(salario)=(select avg(min(salario))
                    from emple
                    group by oficio);

--7
SELECT EMP_NO, APELLIDO
FROM EMPLE
WHERE SALARIO = ( SELECT MIN(SALARIO)
				FROM EMPLE);
                
--si solo hay un atributo no hay que grupar

--8 saca nulo
SELECT APELLIDO, OFICIO
FROM EMPLE
WHERE OFICIO = nvl(( SELECT OFICIO
			FROM EMPLE
			WHERE APELLIDO = 'PEREZ'),0);
            
--9
select apellido
from emple
where emp_no in  (select id_jefe
              from emple);
select apellido,id_jefe, emp_no
from emple
