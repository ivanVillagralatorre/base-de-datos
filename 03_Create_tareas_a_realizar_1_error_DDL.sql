REM **** Borrado de las tablas

drop table employees cascade constraints;
drop table departments cascade constraints;
drop table articulos cascade constraints;
drop table fabricantes cascade constraints;
drop table tiendas cascade constraints;
drop table pedidos cascade constraints;
drop table ventas cascade constraints;
/*
Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:SEGURAMENTE OBJETO NO EXISTE    
*Action:
*/

REM **** Creaci�n de las tablas


CREATE TABLE tiendas (
nif VARCHAR2(10) PRiMARY KEY,
nombre VARCHAR2(20),
direccion  VARCHAR2(20),
poblacion  VARCHAR2(20),
provincia  VARCHAR2(20),
codpostal  VARCHAR2(5),
CONSTRAINT tie_provincia_ck check(provincia = upper(provincia))
);/*Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause: TENGO FOREIGNS A TABLAS QUE NO SE HAN CREADO.   
*Action:CREAR ANTES TIENDAS,ARTICULOS,FABRICANTES.
*/


CREATE TABLE fabricantes (
cod_fabricante VARCHAR(3) NOT NULL,
nombre  VARCHAR2(15),
pais VARCHAR2(15), 
CONSTRAINT fab_cod_fab_pk PRIMARY KEY(cod_fabricante),
constraint fab_nombre_ck check(nombre = upper(nombre)),
constraint fab_pais_ck check (pais = upper(pais))
);/*Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause: TENGO FOREIGNS A TABLAS QUE NO SE HAN CREADO.   
*Action:CREAR ANTES TIENDAS,ARTICULOS,FABRICANTES.
*/


CREATE TABLE articulos (
articulo VARCHAR2(20) ,
cod_fabricante VARCHAR2(3) ,
peso NUMBER(3) ,
categoria varchar2(10) ,
precio_venta NUMBER(4),
precio_costo NUMBER(4),
existencias NUMBER(5),
CONSTRAINT art_pk PRIMARY KEY(articulo, cod_fabricante, peso, categoria),
CONSTRAINT art_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(cod_fabricante),
constraint art_precio_ck CHECK (precio_venta>0 or precio_costo>0 or peso >0),
constraint art_categoria_ck CHECK(categoria IN('primero','segundo','tercero'))
);
/*Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause: TENGO FOREIGNS A TABLAS QUE NO SE HAN CREADO.   
*Action:CREAR ANTES TIENDAS,ARTICULOS,FABRICANTES.
*/


CREATE TABLE ventas(
nif VARCHAR2(10) ,
articulo VARCHAR2(20) ,
cod_fabricante VARCHAR2(3),
peso NUMBER(3) NOT NULL,
categoria VARCHAR2(10) ,
fecha_venta DATE DEFAULT SYSDATE,
unidades_vendidas NUMBER(4), 
CONSTRAINT ven_nif_pk PRIMARY KEY(nif, articulo, cod_fabricante, peso, categoria, fecha_venta),
CONSTRAINT ven_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes,
constraint ven_uni_ck CHECK (unidades_vendidas>0),
constraint ven_cat_ck CHECK (categoria IN('primero','segundo','tercero')),
CONSTRAINT ven_art_fk FOREIGN KEY(articulo, cod_fabricante, peso, categoria) REFERENCES
articulos(articulo, cod_fabricante, peso, categoria),
CONSTRAINT ven_tie_fk FOREIGN KEY(nif) REFERENCES tiendas(nif)
);
/*Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause: TENGO FOREIGNS A TABLAS QUE NO SE HAN CREADO.   
*Action:CREAR ANTES TIENDAS,ARTICULOS,FABRICANTES.
*/

create table departments(
   department_id NUMBER(2),
   department_name VARCHAR2(30)NOT NULL, 
   manager_id NUMBER(3),
   location_id NUMBER(4),
CONSTRAINT dept_id_pk PRIMARY KEY(department_id)
);


create table employees(
   employee_id number(6),
   first_name VARCHAR2(25) NOT NULL ,
   last_name VARCHAR2(25),
   email VARCHAR2(25) UNIQUE,
   phone_number NUMBER(12),
   hire_date DATE  DEFAULT SYSDATE ,
   job_id VARCHAR2(10),
   salary NUMBER(8,2),
   comission_pct NUMBER(5,2),
   manager_id NUMBER(3),
   department_id NUMBER(2),
CONSTRAINT emp_id_pk PRIMARY KEY(employee_id),
CONSTRAINT emp_dept_fk FOREIGN KEY(department_id) 
REFERENCES departments);




CREATE TABLE pedidos (
nif VARCHAR2 (10) ,
articulo VARCHAR2 (20),
cod_fabricante VARCHAR2 (3) ,
peso NUMBER(3) ,
categoria VARCHAR2 (10) ,
fecha_pedido DATE DEFAULT SYSDATE,
unidades_pedidas NUMBER(4),
CONSTRAINT ped_id_pk PRIMARY KEY(nif,articulo,cod_fabricante,peso,categoria,fecha_pedido),
CONSTRAINT ped_cod_fabr_fk FOREIGN KEY (cod_fabricante) REFERENCES fabricantes,
CONSTRAINT ped_unidades_ck CHECK (unidades_pedidas>0),
CONSTRAINT ped_cat_ck CHECK (categoria  IN('primero','segundo','tercero')),
CONSTRAINT art_art_fk FOREIGN KEY (articulo,cod_fabricante,peso,categoria) REFERENCES articulos(articulo,cod_fabricante,peso,categoria),
CONSTRAINT tie_nif_fk FOREIGN KEY (nif) REFERENCES tiendas
);




