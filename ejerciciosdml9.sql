--set
desc empleados;
desc departs;
--1
select lower(loc)as loc,nvl(TO_CHAR(null),'no')as dpt,
nvl(anombre,'sin departamento')as "nombre almacen"
from almacenes
union
select lower(loc),nvl(to_char(dept_no),'no'),nvl(TO_CHAR(null),'sin departamento')
from  departs;



--ejercicios
--1
alter table empleados
add constraint fk_dept_no_fk 
foreign key (dpto_cod) references departs(dept_no);

--2
alter table departs add(
presupuesto number(6) constraint dep_pre_ck check(presupuesto between 100000 and 300000)
);

delete departs;

INSERT INTO DEPARTS  VALUES (10,'CONTABILIDAD','VITORIA',150000);
INSERT INTO DEPARTS  VALUES (20,'INVESTIGACION','VITORIA',300000);
INSERT INTO DEPARTS  VALUES (30,'VENTAS','BARCELONA',150000);
INSERT INTO DEPARTS  VALUES (40,'PRODUCCION','BILBAO',150000);
--3
