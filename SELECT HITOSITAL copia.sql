--EJERCICIO 3
ALTER TABLE EMPLEADOS ADD(
CONSTRAINTS EMP_DEPT_FK FOREIGN KEY (DPTO_COD) REFERENCES DEPARTS(DEPT_NO)  );

--EJERCICIO 4
ALTER TABLE DEPARTS ADD(
PRESUPUESTO NUMBER(6),
CONSTRAINT DEPA_PRE_CK CHECK( PRESUPUESTO BETWEEN 100000 AND 300000)
);

UPDATE DEPARTS
SET PRESUPUESTO=300000
WHERE UPPER(DNOMBRE)='INVESTIGACION';

UPDATE DEPARTS
SET PRESUPUESTO=150000
WHERE UPPER(DNOMBRE)!='INVESTIGACION';

--EJERCICIO 5
--5.1
SELECT  DISTINCT EMP_NO, TRAB_COD
FROM HISTORIAL_LABORAL ;
--5.2
SELECT H.EMP_NO,H.TRAB_COD,
FROM HISTORIAL_LABORAL;--acabar
--5.3
SELECT EMP_NO,TRAB_COD

--5.4



--5.5
SELECT EMP_NO, TRAB_COD, SALARIO
FROM EMPLEADOS
UNION
SELECT EMP_NO, TRAB_COD, 0
FROM HISTORIAL_LABORAL;

create or replace view mp_mas as(
select e.apellido,e.salario,e.dept_no,dsm.sal_max
from emple e,(select dept_no, max(salario) as "sal_max"
            from emple
            group by dept_no) dsm
where dsm.dept_no = e.dept_no
and e.salario<dsm.sal_max
);

desc mp_mas;

select view_name,text
from user_views
where upper(view_name)='MP_MAX';


SELECT *
FROM MP_MAS
ORDER BY APELLIDO

--EJERCICIO 7

select view_name,text
from user_views

--TABLA DINAMICA
select e.apellido,e.salario,de.sal.med
from emple e , (select emp.dept_no,trunc(avg(emp.salario) sal_med
                from emple emp
                group by emp.dept_no) ds
                where e.dept_no = ds.dept_no
                and e.salario > ds.sal_med;
