

drop table pedidos ;
/
drop table ventas ;
/
drop table tiendas ;
/
drop table articulos;
/
drop table fabricantes ;
/

create table fabricantes(
cod_fab varchar(3)constraint fab_cod_pk primary key,
nombre  varchar2(15),
pais VARCHAR2(15),
constraint fab_pai_ck  check(pais=upper(pais)),
constraint fab_nom_ck  check(nombre=upper(nombre))
);



create table articulos(
articulo  varchar2(20),
cod_fab  varchar2(3),
peso number(3),
categoria VARCHAR2(10),
precio_venta number(4),
precio_costo number(4),
existencias number(5),
constraint art_cod_pk primary key(articulo,cod_fab,peso,categoria),
constraint art_cod_fab_fk foreign key (cod_fab) references fabricantes(cod_fab),
constraint art_pre_ven_ck  check(precio_venta<0),
constraint art_pre_cos_ck  check(precio_costo<0),
constraint art_pes_ck  check(peso<0),
constraint art_cat_ck  check(categoria in('primera','segunda','tercera')) 
);

create table tiendas(
nif  varchar2(10)constraint tie_cod_pk primary key,
nombre  varchar2(20),
direccion varchar2(20),
poblacion VARCHAR2(20),
provincia varchar2(20),
codpostal varchar2(5),
constraint tie_prov_ck  check(provincia=upper(provincia))
);

create table ventas(
nif varchar2(10),
articulo varchar2(20),
cod_fab varchar2(3),
peso varchar2(3),
categoria varchar2(10),
fecha_venta date,
unidades_vendidas number(4),
constraint ven_cod_pk primary key(nif,articulo,cod_fab,peso,categoria,fecha_venta),
constraint ven_cod_fab_fk foreign key (cod_fab) references fabricantes(cod_fab),
constraint ven_uni_ven_ck  check(unidades_vendidas>0),
constraint ven_cat_ck  check(categoria in('primera','segunda','tercera')),
constraint ven_pmk_fk foreign key (articulo,cod_fab,peso,categoria) references ariculos(articulo,cod_fab,peso,categoria)on delete cascade,
constraint ven_cod_fab_fk foreign key (nif) references tiendas(nif)
);





create table pedidos(
nif  varchar2(10),
articulo  varchar2(20),
cod_fab varchar2(3),
peso number(3),
categoria varchar2(10),
fecha_ped date,
unidades_ped number (4),
constraint ped_cod_pk primary key(nif,articulo,cod_fab,peso,categoria,fecha_ped),
constraint ped_cod_fab_fk foreign key (cod_fab) references fabricantes(cod_fab),
constraint ped_uni_ped_ck  check(unidades_ped>0),
constraint art_cat_ck  check(categoria in('primera','segunda','tercera')),
constraint ped_pmk_fk foreign key (articulo,cod_fab,peso,categoria) references ariculos(articulo,cod_fab,peso,categoria)on delete cascade
);
