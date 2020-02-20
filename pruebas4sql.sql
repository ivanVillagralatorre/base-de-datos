--1
desc depart

select 
c.constraint_name,c.constraint_type,a.column_name
from user_constraints c,user_cons_columns a
where upper(C.table_name)='DEPART'
and c.constraint_name=a.constraint_name;



create table departse
as select *
from depart;


desc departse;

select * from departse;

--2
create sequence dept_id_seq
start with 200
maxvalue 1000
increment by 10
nocycle nocache
;

desc user_sequences;

select *
from user_sequences
where upper(sequence_name)='DEPT_ID_SEQ';


--3
select DEPT_ID_SEQ.currval
from dual;

select SEQUENCE_NAME,MIN_VALUE,MAX_VALUE,INCREMENT_BY,LAST_NUMBER  
from user_sequences;



--4
desc departseq;

/*tamaño de la columna deptno 
no diferenciar a la que quiero usar en la secuenia*/
alter table departseq modify dept_no number(5);
--compruebo
desc departseq;
insert into departseq(DEPT_NO,DNOMBRE)
values(dept_id_seq.NEXTVAL,'EDUCACION');


insert into departseq(DEPT_NO,DNOMBRE)
values(dept_id_seq.NEXTVAL,'administracion');

--compruebo las insert
select * from departseq;

commit;
--5
select DEPT_ID_SEQ.nextval
from dual;


insert into departseq(DEPT_NO,DNOMBRE)
values(dept_id_seq.CURRVAL,'MOLANO');

select * from departseq;

COMMIT;


select DEPT_ID_SEQ.nextval
from dual;

insert into departseq(DEPT_NO,DNOMBRE)
values(dept_id_seq.NEXTVAL,'WEB');

select * from departseq;
COMMIT;

--6
drop table centros cascade constraints;

create table centros(
id number(2) primary key,
nombre varchar2(30),
calle varchar2(30),
numero number(3),
cp number(4),
ciudad varchar2(30),
provincia varchar2(30),
telefon varchar2(30)
);

insert into centros
values(20,'NASA','FRANCIA',27,01010,'VITORIA','ALAVA','651406320');

