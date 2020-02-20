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
SELECT EMP_NO, TRAB_COD
FROM HISTORIAL_LABORAL 
union 
select emp_no,trab_cod
from empleados;
--5.2
SELECT EMP_NO, TRAB_COD,dnombre
FROM HISTORIAL_LABORAL h , departs d
where h.dpto_cod = d.dept_no
union all
select e.emp_no,e.trab_cod,dnombre
from empleados e,departs d
where e.depto_cod=d.dept_no
order by d.dept_no;

--5.3
SELECT EMP_NO, TRAB_COD
FROM HISTORIAL_LABORAL 
intersect
select emp_no,trab_cod
from empleados;

--5.4



--5.5
SELECT EMP_NO, TRAB_COD, SALARIO
FROM EMPLEADOS
union
SELECT EMP_NO, TRAB_COD, 0
FROM HISTORIAL_LABORAL;

--5.6
select *
from emple;
intersect
select upper(loc)
       from almacenes;
       

               
--final
select *
from emple
where dept_no  in (select dept_no
                  from depart
                  where upper(loc) = (select *from emple
                  intersect
                  select upper(loc)
                  from almacenes));
