REM **** Borrado de las tablas

drop table articulos cascade constraints;
/

drop table fabricantes cascade constraints;
/
drop table tiendas cascade constraints;
/
drop table pedidos cascade constraints;
/
drop table ventas cascade constraints;
/
drop table employees cascade constraints;
/
drop table departments cascade constraints;
/


REM **** Creaci�n de las tablas
CREATE TABLE tiendas (
nif VARCHAR2(10) constraint tie_nif_pk primary KEY,
nombre VARCHAR2(20),
direccion  VARCHAR2(20),
poblacion  VARCHAR2(20),
provincia  VARCHAR2(20),
codpostal  VARCHAR2(5),
CONSTRAINT tie_pro_ck check(provincia = upper(provincia))
);
desc tiendas
/**ORA-02270: no hay ninguna clave �nica o primaria correspondiente para esta lista de columnas
02270. 00000 -  "no matching unique or primary key for this column-list"
Cause:    mal escrito
           key constraint in the referenced table.
*Action:   Find the correct column names using the ALL_CONS_COLUMNS
           catalog view*/
CREATE TABLE fabricantes (
cod_fabricante VARCHAR(3) ,
nombre  VARCHAR2(15),
pais VARCHAR2(15), 
CONSTRAINT fab_cod_fab_pk PRIMARY KEY(cod_fabricante),
constraint fab_nombre_ck CHECK(nombre = upper(nombre)),
constraint fab_pais_ck CHECK(pais= upper(pais))
);
/**ORA-02270: no hay ninguna clave �nica o primaria correspondiente para esta lista de columnas
02270. 00000 -  "no matching unique or primary key for this column-list"
Cause:    A REFERENCES clause in a CREATE/ALTER TABLE statement
           gives a column-list for which there is no matching unique or primary
           key constraint in the referenced table.
*Action:   Find the correct column names using the ALL_CONS_COLUMNS
           catalog view*/

CREATE TABLE articulos (
articulo VARCHAR2(20),
cod_fabricante VARCHAR2(3) ,
peso NUMBER(3) ,
categoria VARCHAR2(10) ,
precio_venta NUMBER(4),
precio_costo NUMBER(4),
existencias NUMBER(5),
CONSTRAINT art_pmk_pk PRIMARY KEY(articulo, cod_fabricante, peso, categoria),
CONSTRAINT art_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(cod_fabricante),
CONSTRAINT art_pre_ven_ck CHECK(precio_venta>0),
CONSTRAINT art_pre_cos_ck CHECK(precio_costo>0 ),
CONSTRAINT art_pes_ck CHECK(peso >0),
CONSTRAINT art_cat_ck CHECK(categoria  IN('primero','segundo','tercero'))
);
/**ORA-02270: no hay ninguna clave �nica o primaria correspondiente para esta lista de columnas
02270. 00000 -  "no matching unique or primary key for this column-list"
Cause:    A REFERENCES clause in a CREATE/ALTER TABLE statement
           gives a column-list for which there is no matching unique or primary
           key constraint in the referenced table.
*Action:   Find the correct column names using the ALL_CONS_COLUMNS
           catalog view*/

CREATE TABLE ventas(
nif VARCHAR2(10) ,
articulo VARCHAR2(20) ,
cod_fabricante VARCHAR2(3),
peso NUMBER(3) ,
categoria VARCHAR2(10) ,
fecha_venta DATE DEFAULT SYSDATE,
unidades_vendidas NUMBER(4), 
CONSTRAINT ven_pmk_pk PRIMARY KEY(nif, articulo, cod_fabricante, categoria, fecha_venta),
constraint ven_uni_ck CHECK (unidades_vendidas>0),
constraint ven_cat_ck CHECK (categoria IN('primero','segundo','tercero')),
CONSTRAINT ven_art_fk FOREIGN KEY(articulo, peso, cod_fabricante, categoria) REFERENCES articulos(articulo, peso, cod_fabricante,  categoria),
CONSTRAINT ven_nif_fk FOREIGN KEY(nif) REFERENCES tiendas (nif)
);
/**ORA-02270: no hay ninguna clave �nica o primaria correspondiente para esta lista de columnas
02270. 00000 -  "no matching unique or primary key for this column-list"
Cause:    A REFERENCES clause in a CREATE/ALTER TABLE statement
           gives a column-list for which there is no matching unique or primary
           key constraint in the referenced table.
*Action:   Find the correct column names using the ALL_CONS_COLUMNS
           catalog view*/
CREATE TABLE pedidos (
nif VARCHAR2 (10),
articulo VARCHAR2 (20) ,
cod_fabricante VARCHAR2 (3) ,
peso NUMBER(3) ,
categoria VARCHAR2 (10),
fecha_pedido DATE default SYSDATE,
CONSTRAINT ped_nif_pk primary key (nif, articulo, cod_fabricante,peso,categoria,fecha_pedido),
CONSTRAINT ped_cat_ck CHECK (categoria  IN('primero','segundo','tercero')),
CONSTRAINT ped_dat_fk FOREIGN KEY (articulo,cod_fabricante, peso,categoria) REFERENCES articulos(articulo, cod_fabricante, peso,categoria),
CONSTRAINT ped_nif_fk FOREIGN KEY (nif) REFERENCES tiendas
);
/**ORA-02270: no hay ninguna clave �nica o primaria correspondiente para esta lista de columnas
02270. 00000 -  "no matching unique or primary key for this column-list"
Cause:    A REFERENCES clause in a CREATE/ALTER TABLE statement
           gives a column-list for which there is no matching unique or primary
           key constraint in the referenced table.
*Action:   Find the correct column names using the ALL_CONS_COLUMNS
           catalog view*/


create table departments(
   department_id varchar(2),
   department_name VARCHAR2(30) NOT NULL, 
   manager_id NUMBER(3),
   location_id NUMBER(4),
CONSTRAINT dept_id_pk  PRIMARY KEY(department_id));
/**ORA-02270: no hay ninguna clave �nica o primaria correspondiente para esta lista de columnas
02270. 00000 -  "no matching unique or primary key for this column-list"
Cause:    mal escrito nombre al que hace referencia la pk
*Action:  escribir bien la sintaxis
*/

create table employees(
   employee_id NUMBER(6),
   first_name VARCHAR2(25) NOT NULL ,
   last_name VARCHAR2(25),
   email VARCHAR2(25) UNIQUE,
   phone_number NUMBER(12),
   hire_date DATE  DEFAULT SYSDATE ,
   job_id VARCHAR2(10),
   salary NUMBER(8,2),
   comission_pct NUMBER(5,2),
   manager_id NUMBER(3),
   department_id varchar(2),
      		CONSTRAINT emp_id_pk PRIMARY KEY(employee_id),
     		CONSTRAINT emp_dept_fk foreign KEY(department_id)               
      		      REFERENCES departments

);
/**ORA-02270: no hay ninguna clave �nica o primaria correspondiente para esta lista de columnas
02270. 00000 -  "no matching unique or primary key for this column-list"
Cause:    A REFERENCES clause in a CREATE/ALTER TABLE statement
           gives a column-list for which there is no matching unique or primary
           key constraint in the referenced table.
*Action:   Find the correct column names using the ALL_CONS_COLUMNS
           catalog view*/

