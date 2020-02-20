
--ej1
select distinct d.dept_no,d.dnombre,d.loc,e.oficio
from depart d,emple e
where d.dept_no = e.dept_no and d.dept_no=10;

select distinct d.dept_no,d.dnombre,d.loc,e.oficio
from depart d,emple e
where d.dept_no = e.dept_no and d.dept_no=10;


--ej2
select d.dept_no,d.dnombre,count(e.emp_no) asnempleado
from  emple e , depart d
where e.dept_no(+) = d.dept_no 
group by d.dept_no,d.dnombre
order by d.dept_no;


--ej3

select e.dept_no,dep.dnombre ,count(*)
from emple e , depart dep 
where e.dept_no = dep.dept_no
group by e.dept_no,dep.dnombre
having count(*)=(select max(count(*))
                 from emple
                 group by dept_no);


--4
 select e.apellido
 , d.dnombre
 , e.salario
 ,nvl(to_char(e.comision_pct),'sin comision') as comision
 from emple e,depart d
 where e.dept_no= d.dept_no 
and(e.salario,nvl(e.comision_pct,-1)) in(select e.salario, e.comision_pct
                                 from emple e,depart d
                                  where e.dept_no = d.dept_no
                                  and upper(d.loc)='BARCELONA')
 and upper(d.loc)!='BARCELONA';       


 


