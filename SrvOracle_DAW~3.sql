
Error que empieza en la línea: 13 del comando :
CREATE TABLE ventas(
nif VARCHAR2(10) NOT NULL,
articulo VARCHAR2(20) NOT NULL,
cod_fabricante VARCHAR2(3) NOT NULL,
peso NUMBER(3) NOT NULL,
categoria VARCHAR2(10) NOT NULL,
fecha_venta DATE DEFAULT SYSDATE,
unidades_vendidas NUMBER(4), 
CONSTRAINT ven_pk PRIMARY KEY(nif, articulo, cod_fabricante, peso, categoria, fecha_venta),
CONSTRAINT ven_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(codigo),
CONSTRAINT ven_unidades_vendidas_ck CHECK (unidades_vendidas>0),
CONSTRAINT ven_categoria_check CHECK (categoria IN('primero','segundo','tercero')),
CONSTRAINT ven_art_fk FOREIGN KEY(articulo, cod_fabricante, peso, categoria) REFERENCES articulos(articulo, cod_fabricante, peso, categoria),
CONSTRAINT ven_tie_fk FOREIGN KEY(nif) REFERENCES tiendas(nif)
)
Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la línea: 3 del comando :
drop table employees cascade constraints
Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la línea: 4 del comando :
drop table departments cascade constraints
Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la línea: 5 del comando :
drop table articulos cascade constraints
Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la línea: 6 del comando :
drop table fabricantes cascade constraints
Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la línea: 7 del comando :
drop table tiendas cascade constraints
Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la línea: 8 del comando :
drop table pedidos cascade constraints
Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la línea: 9 del comando :
drop table ventas cascade constraints
Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la línea: 13 del comando :
CREATE TABLE ventas(
nif VARCHAR2(10) NOT NULL,
articulo VARCHAR2(20) NOT NULL,
cod_fabricante VARCHAR2(3) NOT NULL,
peso NUMBER(3) NOT NULL,
categoria VARCHAR2(10) NOT NULL,
fecha_venta DATE DEFAULT SYSDATE,
unidades_vendidas NUMBER(4), 
CONSTRAINT ven_pk PRIMARY KEY(nif, articulo, cod_fabricante, peso, categoria, fecha_venta),
CONSTRAINT ven_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(codigo),
CONSTRAINT ven_unidades_vendidas_ck CHECK (unidades_vendidas>0),
CONSTRAINT ven_categoria_check CHECK (categoria IN('primero','segundo','tercero')),
CONSTRAINT ven_art_fk FOREIGN KEY(articulo, cod_fabricante, peso, categoria) REFERENCES articulos(articulo, cod_fabricante, peso, categoria),
CONSTRAINT ven_tie_fk FOREIGN KEY(nif) REFERENCES tiendas(nif)
)
Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la línea: 29 del comando :
create table departments(
   department_id NUMBER(2),
   department_name VARCHAR2(30) NOT NULL, 
   manager_id NUMBER(3),
   location_id NUMBER(4),
CONSTRAINT dept_id_pk PRIMARY KEY(deparment_id)
)
Informe de error -
ORA-00904: "DEPARMENT_ID": identificador no válido
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:

Error que empieza en la línea: 38 del comando :
create table employees(
   employee_id NUMBER(6),
   first_name VARCHAR2(25) NOT NULL ,
   last_name VARCHAR2(25),
   email VARCHAR2(25)
      		 UNIQUE,
   phone_number NUMBER(12),
   hire_date DATE  DEFAULT SYSDATE ,
   job_id VARCHAR2(10),
   salary NUMBER(8,2),
   comission_pct NUMBER(5,2),
   manager_id NUMBER(3),
   department_id NUMBER(2),
      		CONSTRAINT emp_id_pk PRIMARY KEY(employee_id),
     		CONSTRAINT emp_dept_fk foreign KEY(department_id)               
      		      REFERENCES departments(departmentes_id)
);

CREATE TABLE fabricantes (
cod_fabricante VARCHAR(3),
nombre  VARCHAR2(15),
pais VARCHAR2(15), 
CONSTRAINT fab_cod_fab_pk PRIMARY KEY(cod_fabricante),
CHEK fab_nombre_ck check(nombre = upper(nombre)),
CHEK fab_pais_ck check(pais= upper(pais))
);
Informe de error -
ORA-00922: falta la opción o no es válida
00922. 00000 -  "missing or invalid option"
*Cause:    
*Action:

Error que empieza en la línea: 66 del comando :
CREATE TABLE articulos (
articulo VARCHAR2(20) NOT NULL,
cod_fabricante VARCHAR2(3) NOT NULL,
peso NUMBER(3) NOT NULL,
categoria VARCHAR2(10,5) NOT NULL,
precio_venta NUMBER(4),
precio_costo NUMBER(4),
existencias NUMBER(5),
CONSTRAINT art_pk PRIMARY KEY(articulo, cod_fabricante, peso, categoria),
CONSTRAINT art_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(cod_fabricante),
CHECK (precio_venta>0 || precio_costo>0 || peso >0),
CHECK categoria  IN('primero','segundo','tercero')
))
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:    
*Action:

Error que empieza en la línea: 81 del comando :
CREATE TABLE pedidos (
nif VARCHAR2 (10) NOT NULL,
articulo VARCHAR2 (20) NOT NULL,
cod_fabricante VARCHAR2 (3) NOT NULL,
peso NUMBER(3) NOT NULL,
categoria VARCHAR2 (10) NOT NULL,
fecha_pedido DATE SYSDATE,
unidades_pedidas NUMBER(4),
CONSTRAINT ped_pk PRIMARY KEY(nif,articulo,cod_fabricante,peso,categoria,fecha_pedido),
CONSTRAINT ped_fk FOREIGN KEY (cod_fabricante) REFERENCE fabricantes(cod_fabricante),
CONSTRAINT ped_unidades_ck CHECK (unidades_pedidas>0),
CONSTRAINT CHECK (categoria  IN(primero,segundo,tercero)),
CONSTRAINT art_fk FOREIGN KEY (articulo,cod_fabricante,peso,categoria) REFERENCES articulos(articulo,peso,categoria),
CONSTRAINT tie_fk FOREIGN KEY (nif) REFERENCES tiendas(nif)
)
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:    
*Action:

Error que empieza en la línea: 99 del comando :
CREATE TABLE tiendas (
nif VARCHAR2(10) PRYMARY KEY,
nombre VARCHAR2(20),
direccion  VARCHAR2(20),
poblacion  VARCHAR2(20),
provincia  VARCHAR2(20),
codpostal  VARCHAR2(5),
CONSTRAINT tie_upper (provincia = uppercase(provincia))
)
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:    
*Action:

Error que empieza en la línea: 3 del comando :
drop table employees cascade constraints
Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la línea: 4 del comando :
drop table departments cascade constraints
Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la línea: 5 del comando :
drop table articulos cascade constraints
Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la línea: 6 del comando :
drop table fabricantes cascade constraints
Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la línea: 7 del comando :
drop table tiendas cascade constraints
Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la línea: 8 del comando :
drop table pedidos cascade constraints
Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la línea: 9 del comando :
drop table ventas cascade constraints
Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la línea: 13 del comando :
CREATE TABLE ventas(
nif VARCHAR2(10) NOT NULL,
articulo VARCHAR2(20) NOT NULL,
cod_fabricante VARCHAR2(3) NOT NULL,
peso NUMBER(3) NOT NULL,
categoria VARCHAR2(10) NOT NULL,
fecha_venta DATE DEFAULT SYSDATE,
unidades_vendidas NUMBER(4), 
CONSTRAINT ven_pk PRIMARY KEY(nif, articulo, cod_fabricante, peso, categoria, fecha_venta),
CONSTRAINT ven_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(codigo),
CONSTRAINT ven_unidades_vendidas_ck CHECK (unidades_vendidas>0),
CONSTRAINT ven_categoria_check CHECK (categoria IN('primero','segundo','tercero')),
CONSTRAINT ven_art_fk FOREIGN KEY(articulo, cod_fabricante, peso, categoria) REFERENCES articulos(articulo, cod_fabricante, peso, categoria),
CONSTRAINT ven_tie_fk FOREIGN KEY(nif) REFERENCES tiendas(nif)
)
Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la línea: 29 del comando :
create table departments(
   department_id NUMBER(2),
   department_name VARCHAR2(30) CONSTRAINTS dept_name_nn NOT NULL, 
   manager_id NUMBER(3),
   location_id NUMBER(4),
CONSTRAINTS dept_id_pk PRIMARY KEY(deparment_id)
)
Informe de error -
ORA-00904: "DEPARMENT_ID": identificador no válido
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:

Error que empieza en la línea: 38 del comando :
create table employees
   employee_id NUMBER(6),
   first_name VARCHAR2(25) NOT NULL ,
   last_name VARCHAR2(25),
   email VARCHAR2(25)
      		CONSTRAINT emp_email_uk UNIQUE,
   phone_number NUMBER(12),
   hire_date DATE  DEFAULT SYSDATE ,
   job_id VARCHAR2(10),
   salary NUMBER(8,2),
   comission_pct NUMBER(5,2),
   manager_id NUMBER(3),
   department_id NUMBER(2),
      		CONSTRAINT emp_id_pk PRIMARY KEY(employee_id),
     		CONSTRAINT emp_dept_fk FOREING KEY(department_id)               
      		      REFERENCES departments(departmentes_id)


CREATE TABLE fabricantes (
cod_fabricante VARCHAR(3) NOT NULL,
nombre  VARCHAR2(15),
pais VARCHAR2(15), 
CONSTRAINT fab_cod_fab_pk PRIMARY KEY(cod_fabricante),
CHEK fab_nombre_mayusuculas(nombre = upper(nombre)),
CHEK fab_pais_mayusuculas (pais= upper(pais))
)
Informe de error -
ORA-00922: falta la opción o no es válida
00922. 00000 -  "missing or invalid option"
*Cause:    
*Action:

Error que empieza en la línea: 66 del comando :
CREATE TABLE articulos (
articulo VARCHAR2(20) NOT NULL,
cod_fabricante VARCHAR2(3) NOT NULL,
peso NUMBER(3) NOT NULL,
categoria VARCHAR2(10,5) NOT NULL,
precio_venta NUMBER(4),
precio_costo NUMBER(4),
existencias NUMBER(5),
CONSTRAINT art_pk PRIMARY KEY(articulo, cod_fabricante, peso, categoria),
CONSTRAINT art_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(cod_fabricante),
CHECK (precio_venta>0 || precio_costo>0 || peso >0),
CHECK categoria  IN('primero','segundo','tercero')
))
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:    
*Action:

Error que empieza en la línea: 81 del comando :
CREATE TABLE pedidos (
nif VARCHAR2 (10) ,
articulo VARCHAR2 (20),
cod_fabricante VARCHAR2 (3) ,
peso NUMBER(3),
categoria VARCHAR2 (10) ,
fecha_pedido DATE default SYSDATE,
unidades_pedidas NUMBER(4),
CONSTRAINT ped_pk PRIMARY KEY(nif,articulo,cod_fabricante,peso,categoria,fecha_pedido),
CONSTRAINT ped_fk FOREIGN KEY (cod_fabricante) REFERENCE fabricantes(cod_fabricante),
CONSTRAINT ped_unidades_ck CHECK (unidades_pedidas>0),
CONSTRAINT CHECK (categoria  IN(primero,segundo,tercero)),
CONSTRAINT art_fk FOREIGN KEY (articulo,cod_fabricante,peso,categoria) REFERENCES articulos(articulo,peso,cod_fabricante,categoria),
CONSTRAINT tie_fk FOREIGN KEY (nif) REFERENCES tiendas(nif)
);
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:    
*Action:

Error que empieza en la línea: 99 del comando :
CREATE TABLE tiendas (
nif VARCHAR2(10) constraint tie_nif_pk PRYMARY KEY,
nombre VARCHAR2(20),
direccion  VARCHAR2(20),
poblacion  VARCHAR2(20),
provincia  VARCHAR2(20),
codpostal  VARCHAR2(5),
CONSTRAINT tie_pro_ck check(provincia = upper(provincia))
);
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:    
*Action:
