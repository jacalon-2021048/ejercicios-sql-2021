#-----------------------------------------------------CREANDO LA BASE DE DATOS Y USANDOLA-----------------------------------------------------------#
create database reproductor_musica;
use reproductor_musica;

#-----------------------------------------------------------CREANDO LA TABLA GENERO-----------------------------------------------------------#
create table genero(id_genero integer not null,
nombre_genero varchar(50),
primary key(id_genero));

#-----------------------------------------------------------CREANDO LA TABLA ARTISTA-----------------------------------------------------------#
create table artista(id_artista integer not null,
nombre_art varchar(50),
cantidad_rep_art integer,
primary key(id_artista));

#-----------------------------------------------------------CREANDO LA TABLA ALBUMES-----------------------------------------------------------#
create table albumes(id_album integer not null,
nombre_al varchar(50),
duracion_al float,
autor_al integer,
primary key (id_album),
foreign key (autor_al) references artista (id_artista));

#-----------------------------------------------------------CREANDO LA TABLA SENCILLOS-----------------------------------------------------------#
create table sencillos(id_sencillo integer not null,
nombre_sen varchar(50),
duracion_sen float,
album_sen integer,
primary key (id_sencillo),
foreign key (album_sen) references albumes (id_album));

#-----------------------------------------------------------CREANDO LA TABLA ASIGNACION GENERO ALBUM-----------------------------------------------------------#
create table asig_genero_alb(asignacion_gen integer not null,
genero_asig integer not null,
album_asig integer not null,
primary key (asignacion_gen),
foreign key (genero_asig) references genero (id_genero),
foreign key (album_asig) references albumes (id_album));

#-----------------------------------------------------------CREANDO LA TABLA ASIGNACION GENERO SENCILLO-----------------------------------------------------------#
create table asig_genero_sen(asignacion_gen integer not null,
genero_asig integer not null,
sencillo_asig integer not null,
primary key (asignacion_gen),
foreign key (genero_asig) references genero (id_genero),
foreign key (sencillo_asig) references sencillos (id_sencillo));

#-----------------------------------------------------------CREANDO LA TABLA USUARIO-----------------------------------------------------------#
create table usuario(id_usuario integer not null,
nombre varchar(50),
pais varchar(50),
usuario varchar(50),
clave varchar(50),
fecha_nac date,
primary key (id_usuario));

#-----------------------------------------------------------CREANDO LA TABLA PLANES-----------------------------------------------------------#
create table planes(id_plan integer not null,
nombre_pl varchar(50),
precio_pl float,
meses_hab integer,
primary key (id_plan));

#-----------------------------------------------------------CREANDO LA TABLA METODOS PAGO-----------------------------------------------------------#
create table metodos_pago(id_metodo integer not null,
nombre_met varchar(50),
primary key (id_metodo));

#-----------------------------------------------------------CREANDO LA TABLA CUENTA-----------------------------------------------------------#
create table cuenta(id_cuenta integer not null,
id_usuario integer not null,
id_plan integer not null,
id_metodo integer,
primary key (id_cuenta),
foreign key (id_usuario) references usuario (id_usuario),
foreign key (id_plan) references planes (id_plan),
foreign key (id_metodo) references metodos_pago (id_metodo));

#-----------------------------------------------------------CREANDO LA TABLA LISTA DE REPRODUCCION-----------------------------------------------------------#
create table lista_rep(id_lista_rep integer not null,
cant_reprodu integer,
id_sencillo integer not null,
id_cuenta_asoc integer not null,
primary key (id_lista_rep),
foreign key (id_sencillo) references  sencillos (id_sencillo),
foreign key (id_cuenta_asoc) references cuenta (id_cuenta));

#-----------------------------------------------------------CREANDO PROCEDIMIENTO PARA AGREGAR DATOS EN LA TABLA GENERO-----------------------------------------------------------#
delimiter $$
create procedure insertarDatosGen(id int, nombre varchar(50))
begin
	insert into genero values(id,nombre);
end$$
delimiter ;

#-----------------------------------------------------------CREANDO PROCEDIMIENTO PARA AGREGAR DATOS EN LA TABLA ARTISTA-----------------------------------------------------------#
delimiter $$
create procedure insertarDatosArt(id int, nombre varchar(50),cantidad_rep int)
begin
	insert into artista values(id,nombre,cantidad_rep);
end$$
delimiter ;

#-----------------------------------------------------------CREANDO PROCEDIMIENTO PARA AGREGAR DATOS EN LA TABLA ALBUMES-----------------------------------------------------------#
delimiter $$
create procedure insertarDatosAlb(id int, nombre varchar(50),duracion float,autor int)
begin
	insert into albumes values(id,nombre,duracion,autor);
end$$
delimiter ;

#-----------------------------------------------------------CREANDO PROCEDIMIENTO PARA AGREGAR DATOS EN LA TABLA SENCILLOS-----------------------------------------------------------#
delimiter $$
create procedure insertarDatosSen(id int, nombre varchar(50),duracion float,album int)
begin
	insert into sencillos values(id,nombre,duracion,album);
end$$
delimiter ;

#-----------------------------------------------------------CREANDO PROCEDIMIENTO PARA AGREGAR DATOS EN LA TABLA ASIGNACION GENERO ALBUM-----------------------------------------------------------#
delimiter $$
create procedure insertarDatosAsigGenAl(id_asig int, id_gen_asig int, album_asi int)
begin
	insert into asig_genero_alb values(id_asig,id_gen_asig,album_asi);
end$$
delimiter ;

#-----------------------------------------------------------CREANDO PROCEDIMIENTO PARA AGREGAR DATOS EN LA TABLA ASIGNACION GENERO SENCILLO-----------------------------------------------------------#
delimiter $$
create procedure insertarDatosAsigGenSen(id_asig int, id_gen_asig int, sencillo_asi int)
begin
	insert into asig_genero_sen values(id_asig,id_gen_asig,sencillo_asi);
end$$
delimiter ;

#-----------------------------------------------------------CREANDO PROCEDIMIENTO PARA AGREGAR DATOS EN LA TABLA USUARIO-----------------------------------------------------------#
delimiter $$
create procedure insertarDatosUsu(id int, nombre varchar(50), pais varchar(50), usuario varchar(50), clave varchar(50), fecha_nac date)
begin
	insert into usuario values(id,nombre,pais,usuario,clave,fecha_nac);
end$$
delimiter ;

#-----------------------------------------------------------CREANDO PROCEDIMIENTO PARA AGREGAR DATOS EN LA TABLA PLANES-----------------------------------------------------------#
delimiter $$
create procedure insertarDatosPlanes(id int, nombre varchar(50), precio float, meses int)
begin
	insert into planes values(id,nombre,precio,meses);
end$$
delimiter ;

#-----------------------------------------------------------CREANDO PROCEDIMIENTO PARA AGREGAR DATOS EN LA TABLA METODOS PAGO-----------------------------------------------------------#
delimiter $$
create procedure insertarDatosMetodosPago(id int, nombre varchar(50))
begin
	insert into metodos_pago values(id,nombre);
end$$
delimiter ;

#-----------------------------------------------------------CREANDO PROCEDIMIENTO PARA AGREGAR DATOS EN LA TABLA CUENTA-----------------------------------------------------------#
delimiter $$
create procedure insertarDatosCuenta(id_cuenta int, id_usu int, id_plan int, id_metodo int)
begin
	insert into cuenta values(id_cuenta,id_usu,id_plan,id_metodo);
end$$
delimiter ;

#--------------------------------------------------------CREANDO PROCEDIMIENTO PARA AGREGAR DATOS EN LA TABLA LISTA DE REPRODUCCION-----------------------------------------------------------#
delimiter $$
create procedure insertarDatosListaRep(id_lista int, cantidad_reprodu int, id_sencillo int, id_cuenta int)
begin
	insert into lista_rep values(id_lista,cantidad_reprodu,id_sencillo,id_cuenta);
end$$
delimiter ;

#---------------------------------------------------------------------CONSULTAS----------------------------------------------------------------#

#------------------------------------MOSTRAR LOS ARTISTAS QUE PERTENECEN A UN MISMO GENERO MUSICAL USANDO EL NOMBRE DEL GENERO PARA BUSCARLO------------------------------------------------------------#
delimiter $$
create procedure consultaArtGen(nombre_busc varchar(50))
begin
	select genero.nombre_genero as nombre_genero,artista.nombre_art as nombre_artista from genero,albumes,asig_genero_alb,artista
	where genero.nombre_genero=nombre_busc and albumes.id_album=asig_genero_alb.album_asig and asig_genero_alb.genero_asig=genero.id_genero 
    and artista.id_artista=albumes.autor_al;
end$$
delimiter ;

#------------------------------------MOSTRAR LOS LOS USUARIOS CON EL MISMO METODO DE PAGO SEGUN EL NOMBRE DEL METODO DE PAGO----------------------------------------------------------------------------------------------#
delimiter $$
create procedure consultaUsuMetPag(nombre_busc varchar(50))
begin
	select metodos_pago.nombre_met as nombre_metodo,usuario.nombre as nombre_usuarios from metodos_pago,usuario,cuenta
    where metodos_pago.nombre_met=nombre_busc and metodos_pago.id_metodo=cuenta.id_metodo and usuario.id_usuario=cuenta.id_usuario;
end$$
delimiter ;

#-----------------------------------------------------MOSTRAR LOS USUARIOS QUE TIENEN UN PLAN DE MAYOR COSTO----------------------------------------------------------------------------------#
delimiter $$
create procedure consultaUsuPlanCos(nombre_busc varchar(50))
begin
	select usuario.nombre as nombre_usuarios,planes.id_plan,planes.nombre_pl as plan from usuario,planes,cuenta
    where planes.nombre_pl=nombre_busc and planes.id_plan=cuenta.id_plan and usuario.id_usuario=cuenta.id_usuario;
end$$
delimiter ;

#-----------------------------------------------------INGRESOS TOTALES DE LOS USUARIOS CON PLAN BASICO----------------------------------------------------------------------------------#
delimiter $$
create procedure consultaMontTotIng()
begin
	select sum(precio_pl) as ingresos_de_plan_basico from planes,cuenta where planes.id_plan=5 and cuenta.id_plan=planes.id_plan;
end$$
delimiter ;

#-----------------------------------------------------MOSTRAR TODOS LOS USUARIOS MENORES DE EDAD----------------------------------------------------------------------------------#
delimiter $$
create procedure consultaUsuMenEdad()
begin
	select nombre as nombre_menores_edad from usuario where fecha_nac between '2004/01/01' and '2021/10/05';
end$$
delimiter ;

#--------------------------------MOSTRAR LOS ARTISTAS QUE PERTENECEN A UN MISMO GENERO MUSICAL USANDO EL NOMBRE DEL GENERO PARA BUSCARLO--------------------------------------------------------------------------#
delimiter $$
create procedure consultaArtGenCant(nombre_busc varchar(50))
begin
	select genero.nombre_genero as nombre_genero, count(id_artista) as cantidad_artistas from genero,albumes,asig_genero_alb,artista
	where genero.nombre_genero=nombre_busc and albumes.id_album=asig_genero_alb.album_asig and asig_genero_alb.genero_asig=genero.id_genero 
    and artista.id_artista=albumes.autor_al;
end$$
delimiter ;

#--------------------------------------------------MOSTRAR LA CANTIDAD DE USUARIOS POR PAIS--------------------------------------------------------------------------#
delimiter $$
create procedure consultaPais(nombre_busc varchar(50))
begin
	select count(id_usuario) as cantidad_usuarios_pais from usuario where pais=nombre_busc;
end$$
delimiter ;

#--------------------------------------------------MOSTRAR USUARIOS MENORES DE EDAD--------------------------------------------------------------------------#
delimiter $$
create procedure consultaCuentaMenEd()
begin
	select count(id_usuario) as cantidad_menores_edad from usuario where fecha_nac between '2004/01/01' and '2021/10/05';
end$$
delimiter ;

#--------------------------------------------------MOSTRAR LOS USUARIOS CON EL PLAN MAS ALTO DE CADA PAIS--------------------------------------------------------------------------#
delimiter $$
create procedure consultaPlanPais(nombre_busc varchar(50))
begin
	select usuario.nombre,usuario.pais,planes.nombre_pl as nombre_plan from usuario,planes,cuenta 
    where usuario.pais=nombre_busc and planes.id_plan=2 and planes.id_plan=cuenta.id_plan and usuario.id_usuario=cuenta.id_usuario;
end$$
delimiter ;

#------------------------------------------------------------------CANTIDAD DE USUARIOS EN LA BD----------------------------------------------------------------#
delimiter $$
create procedure consultaCantidadUsu()
begin
	select count(id_usuario) as usuarios_totales_en_la_BD from usuario;
end$$
delimiter ;

#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA GENERO-----------------------------------------------------------#
call insertarDatosGen(1,'Pop');
call insertarDatosGen(2,'Rock');
call insertarDatosGen(3,'Hip hop');
call insertarDatosGen(4,'House');
call insertarDatosGen(5,'Grunge');

#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA ARTISTA-----------------------------------------------------------#
call insertarDatosArt(1,'Kinalitos',822);
call insertarDatosArt(2,'Eminem',6841);
call insertarDatosArt(3,'Alberto Losas',150);
call insertarDatosArt(4,'Carlos Rosa',2388);
call insertarDatosArt(5,'Daft Punk',105611);
call insertarDatosArt(6,'The Weeknd',179513);
call insertarDatosArt(7,'Nirvana',150364);
call insertarDatosArt(8,'Gorillaz',231586);
call insertarDatosArt(9,'The Beatles',150000);

#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA ALBUMES-----------------------------------------------------------#
call insertarDatosAlb(1,'Random Access Memories',1.14,5);
call insertarDatosAlb(2,'Kinacoing',1.02,1);
call insertarDatosAlb(3,'The Eminem Show',1.17,2);
call insertarDatosAlb(4,'La llamada',2.30,4);
call insertarDatosAlb(5,'El resplandeciente',1.50,3);
call insertarDatosAlb(6,'Plastic Beach',56.53,8);
call insertarDatosAlb(7,'Abbey Road',47.29,9);
call insertarDatosAlb(8,'In Utero',41.27,7);
call insertarDatosAlb(9,'Starboy',1.08,6);

#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA SENCILLOS-----------------------------------------------------------#
call insertarDatosSen(1,'Fragments of time',4.39,1);
call insertarDatosSen(2,'Without Me',4.50,3);
call insertarDatosSen(3,'¿Ganamos 4to?',3.01,2);
call insertarDatosSen(4,'El adios',5.20,5);
call insertarDatosSen(5,'Welcome to the game',1.20,4);
call insertarDatosSen(6,'Come Together',4.19,7);
call insertarDatosSen(7,'Heart-Shaped box',4.41,8);
call insertarDatosSen(8,'Rhinestone Eyes',3.20,6);
call insertarDatosSen(9,'Attention',3.17,9);

#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA ASIGNACION GENERO ALBUM-----------------------------------------------------------#
call insertarDatosAsigGenAl(1,4,1);
call insertarDatosAsigGenAl(2,4,4);
call insertarDatosAsigGenAl(3,3,3);
call insertarDatosAsigGenAl(4,4,5);
call insertarDatosAsigGenAl(5,5,2);
call insertarDatosAsigGenAl(6,4,2);
call insertarDatosAsigGenAl(7,3,6);
call insertarDatosAsigGenAl(8,5,3);
call insertarDatosAsigGenAl(9,1,5);
call insertarDatosAsigGenAl(10,2,1);
call insertarDatosAsigGenAl(11,5,8);
call insertarDatosAsigGenAl(12,2,7);
call insertarDatosAsigGenAl(13,3,9);
call insertarDatosAsigGenAl(14,2,6);

#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA ASIGNACION GENERO SENCILLO-----------------------------------------------------------#
call insertarDatosAsigGenSen(1,5,3);
call insertarDatosAsigGenSen(2,2,4);
call insertarDatosAsigGenSen(3,1,5);
call insertarDatosAsigGenSen(4,2,1);
call insertarDatosAsigGenSen(5,4,1);
call insertarDatosAsigGenSen(6,3,3);
call insertarDatosAsigGenSen(7,4,3);
call insertarDatosAsigGenSen(8,1,3);
call insertarDatosAsigGenSen(9,2,5);
call insertarDatosAsigGenSen(10,3,1);
call insertarDatosAsigGenSen(11,2,6);
call insertarDatosAsigGenSen(12,3,9);
call insertarDatosAsigGenSen(13,1,8);
call insertarDatosAsigGenSen(14,5,7);

#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA USUARIO-----------------------------------------------------------#
call insertarDatosUsu(1,'Jhonatan','Guatemala','Jhon','ABC1234','2005/04/15');
call insertarDatosUsu(2,'Juan','Colombia','Juanito','1234SER','2000/06/10');
call insertarDatosUsu(3,'Carlos','España','Carl','SASD568','1980/06/04');
call insertarDatosUsu(4,'Pancho','España','Pan','ASDF456','1973/08/12');
call insertarDatosUsu(5,'Nancy','Paraguay','Nanche','6623ABH','2012/09/10');
call insertarDatosUsu(6,'Josefino','Uruguay','Jose','TBQDW49','2017/08/09');
call insertarDatosUsu(7,'Luis','Canada','Wicho','485652A','2010/09/07');
call insertarDatosUsu(8,'Pedro','Estados Unidos','Peter','45623SD','1986/12/20');
call insertarDatosUsu(9,'Ana','España','Änä','64ASZCX','1978/09/14');
call insertarDatosUsu(10,'Andrea','España','Andre','4562AVE','1989/07/16');

#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA PLANES-----------------------------------------------------------#
call insertarDatosPlanes(1,'Gratis',0.00,12);
call insertarDatosPlanes(2,'Premium',19.99,12);
call insertarDatosPlanes(3,'Oro',14.99,10);
call insertarDatosPlanes(4,'Plata',9.99,5);
call insertarDatosPlanes(5,'VIP',4.99,1);

#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA METODOS PAGO-----------------------------------------------------------#
call insertarDatosMetodosPago(1,'Tarjeta de credito');
call insertarDatosMetodosPago(2,'Tarjeta de debito');
call insertarDatosMetodosPago(3,'PayPal');
call insertarDatosMetodosPago(4,'Bitcoint');
call insertarDatosMetodosPago(5,'Gratis');

#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA CUENTA-----------------------------------------------------------#
call insertarDatosCuenta(1,1,5,1);
call insertarDatosCuenta(2,2,1,5);
call insertarDatosCuenta(3,3,2,4);
call insertarDatosCuenta(4,4,1,5);
call insertarDatosCuenta(5,5,3,3);
call insertarDatosCuenta(6,6,5,2);
call insertarDatosCuenta(7,7,5,3);
call insertarDatosCuenta(8,8,2,1);
call insertarDatosCuenta(9,9,1,5);
call insertarDatosCuenta(10,10,5,1);

#--------------------------------------------------------AGREGANDO DATOS EN LA TABLA LISTA DE REPRODUCCION-----------------------------------------------------------#
call insertarDatosListaRep(1,54,8,9);
call insertarDatosListaRep(2,18,1,5);
call insertarDatosListaRep(3,8,5,4);
call insertarDatosListaRep(4,13,5,2);
call insertarDatosListaRep(5,3,4,6);
call insertarDatosListaRep(6,6,1,2);
call insertarDatosListaRep(7,5,2,3);
call insertarDatosListaRep(8,3,5,8);
call insertarDatosListaRep(9,1,5,1);
call insertarDatosListaRep(10,5,1,4);
call insertarDatosListaRep(11,1,4,5);
call insertarDatosListaRep(12,5,2,1);
call insertarDatosListaRep(13,51,2,6);
call insertarDatosListaRep(14,5,3,2);
call insertarDatosListaRep(15,2,1,1);
call insertarDatosListaRep(16,23,7,9);
call insertarDatosListaRep(17,7,2,7);
call insertarDatosListaRep(18,5,2,8);
call insertarDatosListaRep(19,564,6,10);
call insertarDatosListaRep(20,3,4,3);
call insertarDatosListaRep(21,2,4,9);
call insertarDatosListaRep(22,1,1,6);
call insertarDatosListaRep(23,2,4,7);
call insertarDatosListaRep(24,145,8,10);
call insertarDatosListaRep(25,9,1,8);

#-----------------------------------------------------------------------CONSULTAS----------------------------------------------------------------#

#------------------------------------MOSTRAR LOS ARTISTAS QUE PERTENECEN A UN MISMO GENERO MUSICAL USANDO EL NOMBRE DEL GENERO PARA BUSCARLO------------------------------------------------------------#
call consultaArtGen('rock');

#------------------------------------MOSTRAR LOS LOS USUARIOS CON EL MISMO METODO DE PAGO SEGUN EL NOMBRE DEL METODO DE PAGO----------------------------------------------------------------------------------------------#
call consultaUsuMetPag('Gratis');

#--------------------------------------------------MOSTRAR LOS USUARIOS QUE TIENEN UN PLAN DE MAYOR COSTO----------------------------------------------------------------------------------#
call consultaUsuPlanCos('Premium');

#--------------------------------------------------INGRESOS TOTALES DE LOS USUARIOS CON PLAN BASICO----------------------------------------------------------------------------------#
call consultaMontTotIng();

#--------------------------------------------------MOSTRAR TODOS LOS USUARIOS MENORES DE EDAD----------------------------------------------------------------------------------#
call consultaUsuMenEdad();

#------------------------------------MOSTRAR LOS ARTISTAS QUE PERTENECEN A UN MISMO GENERO MUSICAL USANDO EL NOMBRE DEL GENERO PARA BUSCARLO--------------------------------------------------------------------------#
call consultaArtGenCant('rock');

#--------------------------------------------------MOSTRAR LA CANTIDAD DE USUARIOS POR PAIS--------------------------------------------------------------------------#
call consultaPais('guatemala');

#--------------------------------------------------MOSTRAR USUARIOS MENORES DE EDAD--------------------------------------------------------------------------#
call consultaCuentaMenEd();

#--------------------------------------------------MOSTRAR LOS USUARIOS CON EL PLAN MAS ALTO DE CADA PAIS--------------------------------------------------------------------------#
call consultaPlanPais('españa');

#------------------------------------------------------------------CANTIDAD DE USUARIOS EN LA BD----------------------------------------------------------------#
call consultaCantidadUsu();