create database ferreteria;
use ferreteria;

create table zona(id_zona integer not null, 
nombre_zona varchar(50),
primary key(id_zona));

create table colonia(id_colonia integer not null,
nombre_colonia varchar(50),
primary key(id_colonia));

create table ciudad(id_ciudad integer not null,
nombre_ciudad varchar(50),
primary key(id_ciudad));

create table municipio(id_municipio integer not null,
nombre_municipio varchar(50),
primary key(id_municipio));

create table departamento(id_departamento integer not null,
nombre_departamento varchar(50),
primary key(id_departamento));

create table clientes(nit_cliente integer not null,
nombre_cliente varchar(50),
apellido_cliente varchar(50),
zona_cliente integer not null,
colonia_cliente integer not null,
ciudad_cliente integer not null,
municipio_cliente integer not null,
departamento_cliente integer not null,
primary key (nit_cliente),
foreign key (zona_cliente) references zona (id_zona),
foreign key (colonia_cliente) references colonia (id_colonia),
foreign key (ciudad_cliente) references ciudad (id_ciudad),
foreign key (municipio_cliente) references municipio (id_municipio),
foreign key (departamento_cliente) references departamento (id_departamento));

create table marcas_herramienta(id_marca integer not null,
nombre_marca varchar(50),
primary key(id_marca));

create table herramienta(id_herramienta integer not null,
nombre_herramienta varchar(50),
primary key(id_herramienta));

create table inventario(id_inventario integer not null,
id_herramienta integer not null,
id_marca integer not null,
precio long,
costo long,
stock long,
primary key (id_inventario),
foreign key (id_marca) references marcas_herramienta (id_marca),
foreign key (id_herramienta) references herramienta (id_herramienta));

create table puestos(id_puesto integer not null,
ocupacion_empleado varchar(50),
primary key(id_puesto));

create table empleados(id_empleado integer not null,
nombre_empleado varchar(50),
telefono_empleado varchar(50),
trabajo_empleado integer,
primary key(id_empleado),
foreign key (trabajo_empleado) references puestos (id_puesto));

create table factura(id_factura integer not null,
nit_cliente integer not null,
id_empleado integer not null,
id_inventario integer not null,
total integer,
primary key (id_factura),
foreign key (nit_cliente) references clientes (nit_cliente),
foreign key (id_empleado) references empleados (id_empleado),
foreign key (id_inventario) references inventario (id_inventario));
#--------------------------------------AGREGANDO DATOS EN LA TABLA ZONA--------------------------------------#
insert into zona(id_zona,nombre_zona)
values (1,'zona 5');
insert into zona(id_zona,nombre_zona)
values (2,'zona 10');
insert into zona(id_zona,nombre_zona)
values (3,'zona 15');
insert into zona(id_zona,nombre_zona)
values (4,'zona 20');
insert into zona(id_zona,nombre_zona)
values (5,'zona 1');
#--------------------------------------AGREGANDO DATOS EN LA TABLA COLONIA--------------------------------------#
insert into colonia(id_colonia,nombre_colonia)
values (1,'La palmita');
insert into colonia(id_colonia,nombre_colonia)
values (2,'Okland');
insert into colonia(id_colonia,nombre_colonia)
values (3,'El maestro');
insert into colonia(id_colonia,nombre_colonia)
values (4,'Miraflores');
insert into colonia(id_colonia,nombre_colonia)
values (5,'Landivar');
#--------------------------------------AGREGANDO DATOS EN LA TABLA CIUDAD--------------------------------------#
insert into ciudad(id_ciudad,nombre_ciudad)
values (1,'Antigua Guatemala');
insert into ciudad(id_ciudad,nombre_ciudad)
values (2,'Xela');
insert into ciudad(id_ciudad,nombre_ciudad)
values (3,'Guatemala');
insert into ciudad(id_ciudad,nombre_ciudad)
values (4,'Santa catarina pinula');
insert into ciudad(id_ciudad,nombre_ciudad)
values (5,'Flores');
#--------------------------------------AGREGANDO DATOS EN LA TABLA MUNICIPIO--------------------------------------#
insert into municipio(id_municipio,nombre_municipio)
values (1,'Guatemala');
insert into municipio(id_municipio,nombre_municipio)
values (2,'Mixco');
insert into municipio(id_municipio,nombre_municipio)
values (3,'Villa nueva');
insert into municipio(id_municipio,nombre_municipio)
values (4,'Escuintla');
insert into municipio(id_municipio,nombre_municipio)
values (5,'Amatitlan');
#--------------------------------------AGREGANDO DATOS EN LA TABLA DEPARTAMENTO--------------------------------------#
insert into departamento(id_departamento,nombre_departamento)
values (1,'Guatemala');
insert into departamento(id_departamento,nombre_departamento)
values (2,'Peten');
insert into departamento(id_departamento,nombre_departamento)
values (3,'Izabal');
insert into departamento(id_departamento,nombre_departamento)
values (4,'Santa rosa');
insert into departamento(id_departamento,nombre_departamento)
values (5,'Sacatepequez');
#--------------------------------------AGREGANDO DATOS EN LA TABLA CLIENTES--------------------------------------#
insert into clientes(nit_cliente,nombre_cliente,apellido_cliente,zona_cliente,colonia_cliente,ciudad_cliente,municipio_cliente,departamento_cliente)
values (52349942,'Juan','Gonzales',1,2,2,3,4);
insert into clientes(nit_cliente,nombre_cliente,apellido_cliente,zona_cliente,colonia_cliente,ciudad_cliente,municipio_cliente,departamento_cliente)
values (48651354,'Carlos','Martinez',4,3,1,4,2);
insert into clientes(nit_cliente,nombre_cliente,apellido_cliente,zona_cliente,colonia_cliente,ciudad_cliente,municipio_cliente,departamento_cliente)
values (64521321,'Pancho','Gomez',3,1,5,2,4);
insert into clientes(nit_cliente,nombre_cliente,apellido_cliente,zona_cliente,colonia_cliente,ciudad_cliente,municipio_cliente,departamento_cliente)
values (87635233,'Nancy','Nandes',5,1,2,4,3);
insert into clientes(nit_cliente,nombre_cliente,apellido_cliente,zona_cliente,colonia_cliente,ciudad_cliente,municipio_cliente,departamento_cliente)
values (65684621,'Josefino','Gutierrez',4,1,5,3,1);
#--------------------------------------AGREGANDO DATOS EN LA TABLA MARCAS_HERRAMIENTA--------------------------------------#
insert into marcas_herramienta(id_marca,nombre_marca)
values (1,'Bosh');
insert into marcas_herramienta(id_marca,nombre_marca)
values (2,'Wall');
insert into marcas_herramienta(id_marca,nombre_marca)
values (3,'Stanley');
insert into marcas_herramienta(id_marca,nombre_marca)
values (4,'Truper');
insert into marcas_herramienta(id_marca,nombre_marca)
values (5,'Alican');
#--------------------------------------AGREGANDO DATOS EN LA TABLA HERRAMIENTA--------------------------------------#
insert into herramienta(id_herramienta,nombre_herramienta)
values (1,'Desarmador');
insert into herramienta(id_herramienta,nombre_herramienta)
values (2,'Barreno');
insert into herramienta(id_herramienta,nombre_herramienta)
values (3,'Tubos');
insert into herramienta(id_herramienta,nombre_herramienta)
values (4,'Brocha');
insert into herramienta(id_herramienta,nombre_herramienta)
values (5,'Alicate');
#--------------------------------------AGREGANDO DATOS EN LA TABLA INVENTARIO--------------------------------------#
insert into inventario(id_inventario,id_herramienta,id_marca,precio,costo,stock)
values (1,3,4,500,200,15);
insert into inventario(id_inventario,id_herramienta,id_marca,precio,costo,stock)
values (2,1,2,40,150,12);
insert into inventario(id_inventario,id_herramienta,id_marca,precio,costo,stock)
values (3,2,3,105,50,15);
insert into inventario(id_inventario,id_herramienta,id_marca,precio,costo,stock)
values (4,5,1,250,150,15);
insert into inventario(id_inventario,id_herramienta,id_marca,precio,costo,stock)
values (5,4,5,100,50,15);
#--------------------------------------AGREGANDO DATOS EN LA TABLA PUESTOS--------------------------------------#
insert into puestos(id_puesto,ocupacion_empleado)
values (1,'Gerente');
insert into puestos(id_puesto,ocupacion_empleado)
values (2,'Vendedor');
insert into puestos(id_puesto,ocupacion_empleado)
values (3,'Cajero');
insert into puestos(id_puesto,ocupacion_empleado)
values (4,'Practicante');
insert into puestos(id_puesto,ocupacion_empleado)
values (5,'Conserje');
#--------------------------------------AGREGANDO DATOS EN LA TABLA EMPLEADOS--------------------------------------#
insert into empleados(id_empleado,nombre_empleado,telefono_empleado,trabajo_empleado)
values (1,'Pedro','25155991',5);
insert into empleados(id_empleado,nombre_empleado,telefono_empleado,trabajo_empleado)
values (2,'David','35416514',3);
insert into empleados(id_empleado,nombre_empleado,telefono_empleado,trabajo_empleado)
values (3,'Jose','46843215',2);
insert into empleados(id_empleado,nombre_empleado,telefono_empleado,trabajo_empleado)
values (4,'Pablo','84321564',1);
insert into empleados(id_empleado,nombre_empleado,telefono_empleado,trabajo_empleado)
values (5,'Andre','46482334',4);
#--------------------------------------AGREGANDO DATOS EN LA TABLA FACTURAS--------------------------------------#
insert into factura(id_factura,nit_cliente,id_empleado,id_inventario,total)
values (1,52349942,5,3,500);
insert into factura(id_factura,nit_cliente,id_empleado,id_inventario,total)
values (2,64521321,1,4,540);
insert into factura(id_factura,nit_cliente,id_empleado,id_inventario,total)
values (3,48651354,2,1,685);
insert into factura(id_factura,nit_cliente,id_empleado,id_inventario,total)
values (4,65684621,3,5,416);
insert into factura(id_factura,nit_cliente,id_empleado,id_inventario,total)
values (5,64521321,3,5,658);
#-----------------------------------------------------------------------CONSULTAS---------------------------------------------------------------------------#
select * from clientes;
select * from inventario;
select count(nombre_marca) as cantidad_de_marcas from marcas_herramienta;
select count(zona_cliente) as cantidad_de_clientes_en_x_zona from clientes where zona_cliente=4;
select count(departamento_cliente) as cantidad_de_clientes_en_x_departamento from clientes where departamento_cliente=4;
select sum(stock) as productos_en_stock from inventario;
select count(id_inventario) as cantidad_productos_x_marca from inventario where id_marca=3;
select count(id_inventario) as cantidad_productos_x_tipo_herramienta from inventario where id_herramienta=1;
#---------------------------------------------------------------AGREGANDO COLUMNA FECHA Y CONSULTANDO-------------------------------------------------------------------#
alter table factura add fecha_de_compra date;
update factura set fecha_de_compra='2021/10/21' where id_factura=1;
update factura set fecha_de_compra='2021/10/20' where id_factura=2;
update factura set fecha_de_compra='2021/10/01' where id_factura=3;
update factura set fecha_de_compra='2021/10/12' where id_factura=4;
update factura set fecha_de_compra='2021/10/23' where id_factura=5;
select count(fecha_de_compra) as peridodo_de_compra_en_x_fechas from factura where fecha_de_compra between '2021/10/01' and '2021/10/20';
select sum(total) as ingresos_totales_ferreteria_en_x_fechas from factura where fecha_de_compra between '2021/10/01' and '2021/10/20';
#-----------------------------------------------------------------------CONSULTAS ID MARCA---------------------------------------------------------------------------#
select marcas_herramienta.id_marca,herramienta.nombre_herramienta from marcas_herramienta,inventario,herramienta
where marcas_herramienta.id_marca=5 and inventario.id_marca=marcas_herramienta.id_marca and herramienta.id_herramienta=inventario.id_herramienta;
#-----------------------------------------------------------------------CONSULTAS NOMBRE MARCA---------------------------------------------------------------------------#
select marcas_herramienta.nombre_marca,herramienta.nombre_herramienta from marcas_herramienta,inventario,herramienta
where marcas_herramienta.nombre_marca='Alican' and inventario.id_marca=marcas_herramienta.id_marca and herramienta.id_herramienta=inventario.id_herramienta;