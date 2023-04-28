create database abarroteria;
use abarroteria;
create table clientes( id_cliente integer not null,
nit varchar(20),
nombre varchar(50),
apellido varchar(50),
direccion varchar(100),
telefono integer,
primary key(id_cliente));
create table productos(id_producto integer not null,
nombre varchar(15),
descripcion varchar(25),
cantidad integer,
precio float,
costo float,
primary key(id_producto));
create table factura(num_factura integer not null,
id_cliente integer,
id_producto integer,
cantidad integer,
total float,
primary key(num_factura),
foreign key (id_cliente) references clientes(id_cliente),
foreign key (id_producto) references productos(id_producto));
show columns from clientes;
show columns from productos;
show columns from factura;