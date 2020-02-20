--ej varias tabla

--ej1
select emple.apellido,
emple.oficio,
emple.emp_no,
depart.dnombre,depart.loc
from emple,depart
where emple.dept_no=depart.dept_no;

--ej2
select  e.emp_no ,
        e.apellido,
        e.oficio,
        d.loc
from emple e,depart d
where e.dept_no=d.dept_no 
and  upper(d.LOC) in('BARCELONA','MADRID');

--ej3
select e.emp_no,e.apellido,j.apellido as"apellido jefe",j.emp_no as"cod jefe"
from emple e, emple j
where e.id_jefe=j.emp_no;

--ej4
select e.apellido,e.oficio,d.loc
from emple e,depart d
where e.dept_no=d.dept_no
and upper(e.oficio)='ANALISTA';

--ej5
select e.emp_no,
e.apellido as"empleado"
,NVL(j.apellido,'sin jefe') as jefe
from emple e, emple j
where E.id_jefe=j.emp_no(+);

--ej6
select d.dept_no,
       d.dnombre,
       d.loc,nvl(e.apellido,'vacio')as"integrantes"
from emple e,depart d
where e.dept_no(+)=d.dept_no;

select e.dept_no,
       d.dnombre,
       d.loc,nvl(e.apellido,'vacio')as"integrantes"
from emple e,depart d
where e.dept_no(+)=d.dept_no;




