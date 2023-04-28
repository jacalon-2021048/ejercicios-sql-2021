create database bancos;
use bancos;

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

create table sucursal(id_sucursal integer not null, 
nombre_sucursal varchar(50),
zona_sucursal integer not null,
colonia_sucursal integer not null,
ciudad_sucursal integer not null,
municipio_sucursal integer not null,
departamento_sucursal integer not null,
primary key (id_sucursal),
foreign key (zona_sucursal) references zona (id_zona),
foreign key (colonia_sucursal) references colonia (id_colonia),
foreign key (ciudad_sucursal) references ciudad (id_ciudad),
foreign key (municipio_sucursal) references municipio (id_municipio),
foreign key (departamento_sucursal) references departamento (id_departamento));

create table empleados(id_empleado integer not null,
nombre_empleado varchar(50),
apellido_empleado varchar(50),
telefono_empleado varchar(50),
direccion_empleado varchar(50),
sucursal_de_trabajo_empleado integer not null,
foreign key (sucursal_de_trabajo_empleado) references sucursal (id_sucursal),
primary key(id_empleado));

create table cuenta_habiente(id_cuenta_habiente integer not null,
nombre_cuenta_habiente varchar(50),
apellido_cuenta_habiente varchar(50),
direccion_cuenta_habiente varchar(50),
primary key(id_cuenta_habiente));

create table tipos_de_cuenta(id_tipo_cuenta integer not null,
nombre_cuenta varchar(50),
primary key(id_tipo_cuenta));

create table asignacion_cuentas(numero_cuenta integer not null,
id_cuenta_habiente_titular integer not null,
id_tipo_cuenta integer not null,
sucursal_de_registro_cuenta_habiente integer not null,
foreign key (sucursal_de_registro_cuenta_habiente) references sucursal (id_sucursal),
foreign key (id_cuenta_habiente_titular) references cuenta_habiente (id_cuenta_habiente),
foreign key (id_tipo_cuenta) references tipos_de_cuenta (id_tipo_cuenta),
primary key(numero_cuenta));

create table cuenta_mancomunada(numero_cuenta_asociada integer not null,
id_cuenta_habiente_asociado integer not null,
foreign key (numero_cuenta_asociada) references asignacion_cuentas (numero_cuenta),
foreign key (id_cuenta_habiente_asociado) references cuenta_habiente (id_cuenta_habiente),
primary key(numero_cuenta_asociada,id_cuenta_habiente_asociado));

create table tarjetas_de_credito(id_tarjeta integer not null,
nombre_tarjeta varchar(50),
intereses_tarjeta float,
primary key(id_tarjeta));

create table asignacion_tarjeta(id_asignacion_tarjetas integer not null,
id_tarjeta_asignada integer not null,
id_cuenta_habiente integer not null,
sucursal_de_entrega_tar integer not null,
foreign key (sucursal_de_entrega_tar) references sucursal (id_sucursal),
foreign key (id_tarjeta_asignada) references tarjetas_de_credito (id_tarjeta),
foreign key (id_cuenta_habiente) references cuenta_habiente (id_cuenta_habiente),
primary key(id_asignacion_tarjetas));

create table tipo_de_transaccion(id_transaccion integer not null,
nombre_transaccion varchar(50),
primary key(id_transaccion));

create table transaccion_bancaria(id_transaccion integer not null,
id_transaccion_realizada integer not null,
id_empleado integer not null,
id_sucursal integer not null,
id_tarjeta integer not null,
id_cuenta integer not null,
foreign key (id_transaccion_realizada) references tipo_de_transaccion (id_transaccion),
foreign key (id_empleado) references empleados (id_empleado),
foreign key (id_sucursal) references sucursal (id_sucursal),
foreign key (id_tarjeta) references asignacion_tarjeta (id_asignacion_tarjetas),
foreign key (id_cuenta) references asignacion_cuentas (numero_cuenta),
primary key(id_transaccion));
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA ZONA-----------------------------------------------------------#
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
insert into zona(id_zona,nombre_zona)
values (6,'zona 8');
insert into zona(id_zona,nombre_zona)
values (7,'zona 4');
insert into zona(id_zona,nombre_zona)
values (8,'zona 3');
insert into zona(id_zona,nombre_zona)
values (9,'zona 2');
insert into zona(id_zona,nombre_zona)
values (10,'zona 16');
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA COLONIA---------------------------------------------------------#
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
insert into colonia(id_colonia,nombre_colonia)
values (6,'El rosal');
insert into colonia(id_colonia,nombre_colonia)
values (7,'Monte negro');
insert into colonia(id_colonia,nombre_colonia)
values (8,'San gabriel');
insert into colonia(id_colonia,nombre_colonia)
values (9,'Monte maria');
insert into colonia(id_colonia,nombre_colonia)
values (10,'Reformita');
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA CIUDAD-----------------------------------------------------------#
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
insert into ciudad(id_ciudad,nombre_ciudad)
values (6,'Roosvelt');
insert into ciudad(id_ciudad,nombre_ciudad)
values (7,'San juan');
insert into ciudad(id_ciudad,nombre_ciudad)
values (8,'Mixco');
insert into ciudad(id_ciudad,nombre_ciudad)
values (9,'Ciudad real');
insert into ciudad(id_ciudad,nombre_ciudad)
values (10,'Livingstone');
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA MUNICIPIO-----------------------------------------------------------#
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
insert into municipio(id_municipio,nombre_municipio)
values (6,'Fraijanes');
insert into municipio(id_municipio,nombre_municipio)
values (7,'Palencia');
insert into municipio(id_municipio,nombre_municipio)
values (8,'San jose pinula');
insert into municipio(id_municipio,nombre_municipio)
values (9,'San miguel petapa');
insert into municipio(id_municipio,nombre_municipio)
values (10,'Villa canales');
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA DEPARTAMENTO-----------------------------------------------------------#
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
insert into departamento(id_departamento,nombre_departamento)
values (6,'Coban');
insert into departamento(id_departamento,nombre_departamento)
values (7,'Salama');
insert into departamento(id_departamento,nombre_departamento)
values (8,'Chimaltenango');
insert into departamento(id_departamento,nombre_departamento)
values (9,'Guastatoya');
insert into departamento(id_departamento,nombre_departamento)
values (10,'Escuintla');
#--------------------------------------------------------------AGREGANDO DATOS EN LA TABLA SUCURSAL-------------------------------------------------------------#
insert into sucursal(id_sucursal,nombre_sucursal,zona_sucursal,colonia_sucursal,ciudad_sucursal,municipio_sucursal,departamento_sucursal)
values (1,'Sucursal zona 1',5,2,5,4,7);
insert into sucursal(id_sucursal,nombre_sucursal,zona_sucursal,colonia_sucursal,ciudad_sucursal,municipio_sucursal,departamento_sucursal)
values (2,'Sucursal zona 8',6,4,8,2,10);
insert into sucursal(id_sucursal,nombre_sucursal,zona_sucursal,colonia_sucursal,ciudad_sucursal,municipio_sucursal,departamento_sucursal)
values (3,'Sucursal zona 3',8,10,1,3,4);
insert into sucursal(id_sucursal,nombre_sucursal,zona_sucursal,colonia_sucursal,ciudad_sucursal,municipio_sucursal,departamento_sucursal)
values (4,'Sucursal zona 4',7,3,10,9,1);
insert into sucursal(id_sucursal,nombre_sucursal,zona_sucursal,colonia_sucursal,ciudad_sucursal,municipio_sucursal,departamento_sucursal)
values (5,'Sucursal zona 16',10,5,4,5,6);
insert into sucursal(id_sucursal,nombre_sucursal,zona_sucursal,colonia_sucursal,ciudad_sucursal,municipio_sucursal,departamento_sucursal)
values (6,'Sucursal zona 15',3,7,9,5,2);
insert into sucursal(id_sucursal,nombre_sucursal,zona_sucursal,colonia_sucursal,ciudad_sucursal,municipio_sucursal,departamento_sucursal)
values (7,'Sucursal zona 5',1,3,8,4,5);
insert into sucursal(id_sucursal,nombre_sucursal,zona_sucursal,colonia_sucursal,ciudad_sucursal,municipio_sucursal,departamento_sucursal)
values (8,'Sucursal zona 10',2,9,10,6,10);
insert into sucursal(id_sucursal,nombre_sucursal,zona_sucursal,colonia_sucursal,ciudad_sucursal,municipio_sucursal,departamento_sucursal)
values (9,'Sucursal zona 1',5,1,3,7,9);
insert into sucursal(id_sucursal,nombre_sucursal,zona_sucursal,colonia_sucursal,ciudad_sucursal,municipio_sucursal,departamento_sucursal)
values (10,'Sucursal zona 20',4,4,5,3,1);
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA EMPLEADOS-----------------------------------------------------------#
insert into empleados(id_empleado,nombre_empleado,apellido_empleado,telefono_empleado,direccion_empleado,sucursal_de_trabajo_empleado)
values (1,'Armando','Gomez','5540-9755','4ta calle zona 5',5);
insert into empleados(id_empleado,nombre_empleado,apellido_empleado,telefono_empleado,direccion_empleado,sucursal_de_trabajo_empleado)
values (2,'Juana','Gonzalez','9944-5533','8va calle zona 10',5);
insert into empleados(id_empleado,nombre_empleado,apellido_empleado,telefono_empleado,direccion_empleado,sucursal_de_trabajo_empleado)
values (3,'Josefino','Andrade','5972-8799','5ta calle zona 8',5);
insert into empleados(id_empleado,nombre_empleado,apellido_empleado,telefono_empleado,direccion_empleado,sucursal_de_trabajo_empleado)
values (4,'Pedro','Pascal','4556-5313','9na calle zona 12',5);
insert into empleados(id_empleado,nombre_empleado,apellido_empleado,telefono_empleado,direccion_empleado,sucursal_de_trabajo_empleado)
values (5,'Sandra','Rodriguez','5456-6521','10ma calle zona 2',5);
insert into empleados(id_empleado,nombre_empleado,apellido_empleado,telefono_empleado,direccion_empleado,sucursal_de_trabajo_empleado)
values (6,'Ruth','Florez','5331-6584','5ta calle zona 21',3);
insert into empleados(id_empleado,nombre_empleado,apellido_empleado,telefono_empleado,direccion_empleado,sucursal_de_trabajo_empleado)
values (7,'Javier','Vasquez','8562-4532','9na calle zona 4',1);
insert into empleados(id_empleado,nombre_empleado,apellido_empleado,telefono_empleado,direccion_empleado,sucursal_de_trabajo_empleado)
values (8,'Rodrigo','Gutierrez','5543-3164','7ma calle zona 20',3);
insert into empleados(id_empleado,nombre_empleado,apellido_empleado,telefono_empleado,direccion_empleado,sucursal_de_trabajo_empleado)
values (9,'Marco','Fernandez','5432-4578','2da calle zona 3',2);
insert into empleados(id_empleado,nombre_empleado,apellido_empleado,telefono_empleado,direccion_empleado,sucursal_de_trabajo_empleado)
values (10,'Francisco','Hernandez','1285-5656','3ra calle zona 7',2);
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA CUENTA HABIENTE-----------------------------------------------------------#
insert into cuenta_habiente(id_cuenta_habiente,nombre_cuenta_habiente,apellido_cuenta_habiente,direccion_cuenta_habiente)
values (1,'Juan','Ochoa','5ta calle zona 8');
insert into cuenta_habiente(id_cuenta_habiente,nombre_cuenta_habiente,apellido_cuenta_habiente,direccion_cuenta_habiente)
values (2,'Edgar','Garcia','1ra calle zona 9');
insert into cuenta_habiente(id_cuenta_habiente,nombre_cuenta_habiente,apellido_cuenta_habiente,direccion_cuenta_habiente)
values (3,'Roberto','Gomez','9na calle zona 3');
insert into cuenta_habiente(id_cuenta_habiente,nombre_cuenta_habiente,apellido_cuenta_habiente,direccion_cuenta_habiente)
values (4,'Vicente','Palacios','6ta calle zona 5');
insert into cuenta_habiente(id_cuenta_habiente,nombre_cuenta_habiente,apellido_cuenta_habiente,direccion_cuenta_habiente)
values (5,'Luis','Avalos','5ta calle zona 2');
insert into cuenta_habiente(id_cuenta_habiente,nombre_cuenta_habiente,apellido_cuenta_habiente,direccion_cuenta_habiente)
values (6,'Fernando','Medina','4ta calle zona 3');
insert into cuenta_habiente(id_cuenta_habiente,nombre_cuenta_habiente,apellido_cuenta_habiente,direccion_cuenta_habiente)
values (7,'Carlos','Castillo','6ta calle zona 20');
insert into cuenta_habiente(id_cuenta_habiente,nombre_cuenta_habiente,apellido_cuenta_habiente,direccion_cuenta_habiente)
values (8,'Pedro','Castellanos','4ta calle zona 4');
insert into cuenta_habiente(id_cuenta_habiente,nombre_cuenta_habiente,apellido_cuenta_habiente,direccion_cuenta_habiente)
values (9,'Ana','Dominguez','8va calle zona 2');
insert into cuenta_habiente(id_cuenta_habiente,nombre_cuenta_habiente,apellido_cuenta_habiente,direccion_cuenta_habiente)
values (10,'Andrea','Jimenez','2da calle zona 4');
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA TIPOS DE CUENTAS-----------------------------------------------------------#
insert into tipos_de_cuenta(id_tipo_cuenta,nombre_cuenta)
values (1,'Ahorro');
insert into tipos_de_cuenta(id_tipo_cuenta,nombre_cuenta)
values (2,'Monetaria');
insert into tipos_de_cuenta(id_tipo_cuenta,nombre_cuenta)
values (3,'Mancomunada');
insert into tipos_de_cuenta(id_tipo_cuenta,nombre_cuenta)
values (4,'Retiro');
insert into tipos_de_cuenta(id_tipo_cuenta,nombre_cuenta)
values (5,'Euros');
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA ASIGNACIONES CUENTAS-----------------------------------------------------------#
insert into asignacion_cuentas(numero_cuenta,id_cuenta_habiente_titular,id_tipo_cuenta,sucursal_de_registro_cuenta_habiente)
values (25645609,1,2,6);
insert into asignacion_cuentas(numero_cuenta,id_cuenta_habiente_titular,id_tipo_cuenta,sucursal_de_registro_cuenta_habiente)
values (85835418,2,4,6);
insert into asignacion_cuentas(numero_cuenta,id_cuenta_habiente_titular,id_tipo_cuenta,sucursal_de_registro_cuenta_habiente)
values (45568553,3,5,6);
insert into asignacion_cuentas(numero_cuenta,id_cuenta_habiente_titular,id_tipo_cuenta,sucursal_de_registro_cuenta_habiente)
values (65432166,4,1,6);
insert into asignacion_cuentas(numero_cuenta,id_cuenta_habiente_titular,id_tipo_cuenta,sucursal_de_registro_cuenta_habiente)
values (58343541,5,5,5);
insert into asignacion_cuentas(numero_cuenta,id_cuenta_habiente_titular,id_tipo_cuenta,sucursal_de_registro_cuenta_habiente)
values (32135132,6,1,4);
insert into asignacion_cuentas(numero_cuenta,id_cuenta_habiente_titular,id_tipo_cuenta,sucursal_de_registro_cuenta_habiente)
values (38543123,7,3,3);
insert into asignacion_cuentas(numero_cuenta,id_cuenta_habiente_titular,id_tipo_cuenta,sucursal_de_registro_cuenta_habiente)
values (52953542,8,4,3);
insert into asignacion_cuentas(numero_cuenta,id_cuenta_habiente_titular,id_tipo_cuenta,sucursal_de_registro_cuenta_habiente)
values (64238945,9,1,9);
insert into asignacion_cuentas(numero_cuenta,id_cuenta_habiente_titular,id_tipo_cuenta,sucursal_de_registro_cuenta_habiente)
values (85521239,9,3,9);
insert into asignacion_cuentas(numero_cuenta,id_cuenta_habiente_titular,id_tipo_cuenta,sucursal_de_registro_cuenta_habiente)
values (96856413,10,1,9);
insert into asignacion_cuentas(numero_cuenta,id_cuenta_habiente_titular,id_tipo_cuenta,sucursal_de_registro_cuenta_habiente)
values (65156213,1,1,9);
insert into asignacion_cuentas(numero_cuenta,id_cuenta_habiente_titular,id_tipo_cuenta,sucursal_de_registro_cuenta_habiente)
values (61535665,2,1,9);
insert into asignacion_cuentas(numero_cuenta,id_cuenta_habiente_titular,id_tipo_cuenta,sucursal_de_registro_cuenta_habiente)
values (48932456,3,1,9);
insert into asignacion_cuentas(numero_cuenta,id_cuenta_habiente_titular,id_tipo_cuenta,sucursal_de_registro_cuenta_habiente)
values (46656465,4,1,9);
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA CUENTA MANCOMUNADA-----------------------------------------------------------#
insert into cuenta_mancomunada(numero_cuenta_asociada,id_cuenta_habiente_asociado)
values (38543123,1);
insert into cuenta_mancomunada(numero_cuenta_asociada,id_cuenta_habiente_asociado)
values (38543123,3);
insert into cuenta_mancomunada(numero_cuenta_asociada,id_cuenta_habiente_asociado)
values (38543123,5);
insert into cuenta_mancomunada(numero_cuenta_asociada,id_cuenta_habiente_asociado)
values (38543123,8);
insert into cuenta_mancomunada(numero_cuenta_asociada,id_cuenta_habiente_asociado)
values (38543123,10);
insert into cuenta_mancomunada(numero_cuenta_asociada,id_cuenta_habiente_asociado)
values (85521239,9);
insert into cuenta_mancomunada(numero_cuenta_asociada,id_cuenta_habiente_asociado)
values (85521239,5);
insert into cuenta_mancomunada(numero_cuenta_asociada,id_cuenta_habiente_asociado)
values (85521239,2);
insert into cuenta_mancomunada(numero_cuenta_asociada,id_cuenta_habiente_asociado)
values (85521239,4);
insert into cuenta_mancomunada(numero_cuenta_asociada,id_cuenta_habiente_asociado)
values (85521239,6);
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA TARJETAS DE CREDITO-----------------------------------------------------------#
insert into tarjetas_de_credito(id_tarjeta,nombre_tarjeta,intereses_tarjeta)
values (1,'DIAMANTE',1.50);
insert into tarjetas_de_credito(id_tarjeta,nombre_tarjeta,intereses_tarjeta)
values (2,'VIP',0.55);
insert into tarjetas_de_credito(id_tarjeta,nombre_tarjeta,intereses_tarjeta)
values (3,'ORO',0.50);
insert into tarjetas_de_credito(id_tarjeta,nombre_tarjeta,intereses_tarjeta)
values (4,'PLATINO',0.45);
insert into tarjetas_de_credito(id_tarjeta,nombre_tarjeta,intereses_tarjeta)
values (5,'CLASICA',0.10);
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA ASIGNACIONES TARJETAS-----------------------------------------------------------#
insert into asignacion_tarjeta(id_asignacion_tarjetas,id_tarjeta_asignada,id_cuenta_habiente,sucursal_de_entrega_tar)
values (1,2,10,4);
insert into asignacion_tarjeta(id_asignacion_tarjetas,id_tarjeta_asignada,id_cuenta_habiente,sucursal_de_entrega_tar)
values (2,1,10,5);
insert into asignacion_tarjeta(id_asignacion_tarjetas,id_tarjeta_asignada,id_cuenta_habiente,sucursal_de_entrega_tar)
values (3,5,10,1);
insert into asignacion_tarjeta(id_asignacion_tarjetas,id_tarjeta_asignada,id_cuenta_habiente,sucursal_de_entrega_tar)
values (4,4,5,10);
insert into asignacion_tarjeta(id_asignacion_tarjetas,id_tarjeta_asignada,id_cuenta_habiente,sucursal_de_entrega_tar)
values (5,1,3,10);
insert into asignacion_tarjeta(id_asignacion_tarjetas,id_tarjeta_asignada,id_cuenta_habiente,sucursal_de_entrega_tar)
values (6,3,1,10);
insert into asignacion_tarjeta(id_asignacion_tarjetas,id_tarjeta_asignada,id_cuenta_habiente,sucursal_de_entrega_tar)
values (7,5,2,4);
insert into asignacion_tarjeta(id_asignacion_tarjetas,id_tarjeta_asignada,id_cuenta_habiente,sucursal_de_entrega_tar)
values (8,3,6,5);
insert into asignacion_tarjeta(id_asignacion_tarjetas,id_tarjeta_asignada,id_cuenta_habiente,sucursal_de_entrega_tar)
values (9,4,7,9);
insert into asignacion_tarjeta(id_asignacion_tarjetas,id_tarjeta_asignada,id_cuenta_habiente,sucursal_de_entrega_tar)
values (10,2,8,10);
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA TIPOS DE TRANSACCIONES-----------------------------------------------------------#
insert into tipo_de_transaccion(id_transaccion,nombre_transaccion)
values (1,'Deposito');
insert into tipo_de_transaccion(id_transaccion,nombre_transaccion)
values (2,'Retiro');
insert into tipo_de_transaccion(id_transaccion,nombre_transaccion)
values (3,'Transacciones');
insert into tipo_de_transaccion(id_transaccion,nombre_transaccion)
values (4,'Cambio de divisas');
insert into tipo_de_transaccion(id_transaccion,nombre_transaccion)
values (5,'Cambio de cheques');
insert into tipo_de_transaccion(id_transaccion,nombre_transaccion)
values (6,'Pago de servicios');
insert into tipo_de_transaccion(id_transaccion,nombre_transaccion)
values (7,'Pago de impuestos');
insert into tipo_de_transaccion(id_transaccion,nombre_transaccion)
values (8,'Apertura de cuenta');
insert into tipo_de_transaccion(id_transaccion,nombre_transaccion)
values (9,'Pago tarjeta de credito');
insert into tipo_de_transaccion(id_transaccion,nombre_transaccion)
values (10,'Obtencion de tarjetas de credito');
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA TRANSACCION BANCARIA-----------------------------------------------------------#
insert into transaccion_bancaria(id_transaccion,id_transaccion_realizada,id_empleado,id_sucursal,id_tarjeta,id_cuenta)
values (1,6,5,5,1,96856413);
insert into transaccion_bancaria(id_transaccion,id_transaccion_realizada,id_empleado,id_sucursal,id_tarjeta,id_cuenta)
values (2,5,8,3,2,96856413);
insert into transaccion_bancaria(id_transaccion,id_transaccion_realizada,id_empleado,id_sucursal,id_tarjeta,id_cuenta)
values (3,7,10,2,3,96856413);
insert into transaccion_bancaria(id_transaccion,id_transaccion_realizada,id_empleado,id_sucursal,id_tarjeta,id_cuenta)
values (4,5,7,1,4,58343541);
insert into transaccion_bancaria(id_transaccion,id_transaccion_realizada,id_empleado,id_sucursal,id_tarjeta,id_cuenta)
values (5,8,9,2,5,45568553);
insert into transaccion_bancaria(id_transaccion,id_transaccion_realizada,id_empleado,id_sucursal,id_tarjeta,id_cuenta)
values (6,10,4,5,6,25645609);
insert into transaccion_bancaria(id_transaccion,id_transaccion_realizada,id_empleado,id_sucursal,id_tarjeta,id_cuenta)
values (7,9,1,5,7,61535665);
insert into transaccion_bancaria(id_transaccion,id_transaccion_realizada,id_empleado,id_sucursal,id_tarjeta,id_cuenta)
values (8,9,2,5,8,32135132);
insert into transaccion_bancaria(id_transaccion,id_transaccion_realizada,id_empleado,id_sucursal,id_tarjeta,id_cuenta)
values (9,5,6,3,10,52953542);
insert into transaccion_bancaria(id_transaccion,id_transaccion_realizada,id_empleado,id_sucursal,id_tarjeta,id_cuenta)
values (10,8,3,5,10,52953542);
#-----------------------------------------------------------CONSULTAS-----------------------------------------------------------#
select cuenta_mancomunada.numero_cuenta_asociada,cuenta_habiente.nombre_cuenta_habiente from cuenta_mancomunada,cuenta_habiente
where cuenta_mancomunada.numero_cuenta_asociada=38543123 and cuenta_mancomunada.id_cuenta_habiente_asociado=cuenta_habiente.id_cuenta_habiente;

select count(sucursal_de_trabajo_empleado) as trabajadores_por_id_de_sucursal from empleados where sucursal_de_trabajo_empleado=3;

select count(id_cuenta_habiente_titular) as trabajadores_por_nombre_de_sucursal from asignacion_cuentas,sucursal 
where sucursal.nombre_sucursal='Sucursal zona 15' and asignacion_cuentas.sucursal_de_registro_cuenta_habiente=sucursal.id_sucursal;

select id_empleado,nombre_empleado,apellido_empleado,telefono_empleado from empleados,sucursal 
where sucursal.nombre_sucursal='Sucursal zona 16' and empleados.sucursal_de_trabajo_empleado=sucursal.id_sucursal 
order by apellido_empleado asc;

select id_empleado,nombre_empleado,apellido_empleado,telefono_empleado from empleados,sucursal 
where sucursal.nombre_sucursal='Sucursal zona 16' and empleados.sucursal_de_trabajo_empleado=sucursal.id_sucursal 
order by apellido_empleado desc;

select cuenta_habiente.nombre_cuenta_habiente,tipos_de_cuenta.nombre_cuenta,sucursal.nombre_sucursal from cuenta_habiente,tipos_de_cuenta,sucursal,asignacion_cuentas
where tipos_de_cuenta.nombre_cuenta='Ahorro' and sucursal.nombre_sucursal='Sucursal zona 1' 
and asignacion_cuentas.id_tipo_cuenta=tipos_de_cuenta.id_tipo_cuenta and asignacion_cuentas.sucursal_de_registro_cuenta_habiente=sucursal.id_sucursal 
and cuenta_habiente.id_cuenta_habiente=asignacion_cuentas.id_cuenta_habiente_titular;

select count(id_asignacion_tarjetas) as cantidad_tarjeta_credito from asignacion_tarjeta,sucursal
where sucursal.nombre_sucursal='Sucursal zona 20' and asignacion_tarjeta.sucursal_de_entrega_tar=sucursal.id_sucursal;