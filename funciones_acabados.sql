--1
select Emp_no,apellido as "empleado",nvl(TO_CHAR(id_jefe),'no tiene jefe') as Jefe
from emple
order by jefe;

--2

select emp_no || ' , ' ||apellido as "empleado",oficio ,salario,trunc(salario/1000,0)||' %' as "porcentaje_de_movilizacion"
from emple;

--3
select emp_no as "codigo Empleado",apellido,oficio,substr(initcap(Apellido),1,3)|| length(apellido)||lower(oficio) as "nombre de usuario",
extract(month from fecha_alta)||substr(Extract(year from fecha_alta),2,2)||substr(apellido,-2) as "clave"
from emple
order by apellido asc;

--4

select emp_no as "Codigo empleado" , apellido, to_char(salario,'999,999,999') as"salario actual", SUBSTR(SALARIO,1,1)|| '%' as "porcentaje de aumento",
        to_char(salario*substr(salario,1,1)/100+salario,'999,999,999')as "salario nuevo"
from emple;


--5
 select emp_no as "id_emp",nvl(to_char(comision_pct),'sin comision')as " porcentaje de comision",
 (salario * nvl(comision_pct,0)) / 100 as "valor comision",
	salario as "salario actual",(salario * nvl(comision_pct,0)) /100 + salario as "salario total",
    depart.dnombre as "nombre departamento"
  from emple,depart
  where emple.dept_no = depart.dept_no;


--6

select emp_no,
    fecha_alta,
    round(months_between(sysdate,fecha_alta)) as "meses en la empresa",
	ADD_MONTHS(fecha_alta,6) as "fecha revision",
	next_day(fecha_alta, 'viernes') as "primer viernes",
	last_day(fecha_alta)as "ultimo dia mes"
from emple
where round(months_between(sysdate,fecha_alta)) < 460;




