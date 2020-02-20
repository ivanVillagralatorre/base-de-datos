--1
select *
from emple
where salario > (select avg(salario)
                  from emple);
--2
select apellido,salario,dept_no
from emple 
where salario  >(select avg(salario)
                from emple)
order by dept_no;

--3
select loc
from depart
where dept_no=(select dept_no
     from emple
     where comision_pct>salario*0.10);
     
select loc
from depart
where exists(select dept_no
     from emple
     where comision_pct>salario*0.10);
     
--4
select e.apellido
from emple e
where exists(select 'sidant'
         from emple emp
        where e.dept_no=emp.dept_no and
            e.salario<emp.salario
        and e.fecha_alta>emp.fecha_alta
        group by dept_no);

--5
select dept_no as"depart",dnombre as "nombre"
from emple e
where (select emp_no from emple d where d.dept_no=e.dept_no)=0;

select dept_no,dnombre
from emple e
where not exists(select emp_no from emple d where d.dept_no=e.dept_no);
