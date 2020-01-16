--1
select distinct oficio
from emple;

select avg(salario)as media, min(salario)as maximo,max(salario),sum(salario) as "suma total"
from emple
where upper(oficio)='COMERCIAL';

--2


select apellido, fecha_alta as "fecha mayor"
from emple
where fecha_alta in(select min(fecha_alta)as 
from emple); 

select apellido, fecha_altaas "fecha menor"
from emple
where fecha_alta in (select max(fecha_alta)
from emple);

--3
select  min(apellido)as "primero lista alfabetica",max(apellido)as"ultimo en lista alfabetica"
from emple;

--4 

select count(emp_no) as "numero empleados"
from emple
where dept_no=40;

select count(emp_no) as "numero empleados"
from emple
where dept_no = 40;


--5

select count(emp_no) as "numero empleados"
from emple
where dept_no =30 and comision_pct is not null;

select count(comision_pct) as "numero empleados"
from emple
where dept_no =30;

--6
select count(distinct dept_no) as "cantidad de departamentos"
from emple;

--7
select distinct dept_no as "numero de departamento",count(emp_no)as  "cantidad de empleados"
from emple
group by dept_no;


--8
select  dept_no , count( emp_no) as "cantidad de empleados"
from emple
group by dept_no
having count(*)>4;


select  dept_no , count( emp_no) as "cantidad de empleados"
from emple
group by dept_no
having count(emp_no)>4;

--g2

--1

select  dept_no , count( emp_no) as "cantidad de empleados"
from emple
group by dept_no
having count(emp_no)>4
order by count(emp_no) desc;

--2
select dept_no,sum(salario) as "suma",max(salario)as"salario maximo",min(salario)as"salario minimo"
from emple
group by dept_no
order by dept_no asc;





