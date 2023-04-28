create database reproductor_musica;
use reproductor_musica;

create table genero(id_genero integer not null,
nombre_genero varchar(50),
primary key(id_genero));

create table artista(id_artista integer not null,
nombre_art varchar(50),
primary key(id_artista));

create table albumes(id_album integer not null,
nombre_al varchar(50),
duracion_al decimal,
autor_al integer,
primary key (id_album),
foreign key (autor_al) references artista (id_artista));

create table sencillos(id_sencillo integer not null,
nombre_sen varchar(50),
duracion_sen decimal,
album_sen integer,
primary key (id_sencillo),
foreign key (album_sen) references albumes (id_album));

create table asig_genero_alb(asignacion_gen integer not null,
genero_asig integer not null,
album_asig integer not null,
primary key (asignacion_gen),
foreign key (genero_asig) references genero (id_genero),
foreign key (album_asig) references albumes (id_album));

create table asig_genero_sen(asignacion_gen integer not null,
genero_asig integer not null,
sencillo_asig integer not null,
primary key (asignacion_gen),
foreign key (genero_asig) references genero (id_genero),
foreign key (sencillo_asig) references sencillos (id_sencillo));

create table usuario(id_usuario integer not null,
nombre varchar(50),
pais varchar(50),
usuario varchar(50),
clave varchar(50),
fecha_nac date,
primary key (id_usuario));

create table planes(id_plan integer not null,
nombre_pl varchar(50),
precio_pl decimal,
meses_hab integer,
primary key (id_plan));

create table metodos_pago(id_metodo integer not null,
nombre_met varchar(50),
primary key (id_metodo));

create table cuenta(id_cuenta integer not null,
id_usuario integer not null,
id_plan integer not null,
id_metodo integer,
primary key (id_cuenta),
foreign key (id_usuario) references usuario (id_usuario),
foreign key (id_plan) references planes (id_plan),
foreign key (id_metodo) references metodos_pago (id_metodo));

create table creacion_lista_rep(id_lista_rep integer not null,
cant_reprodu integer,
id_sencillo integer not null,
id_cuenta_asoc integer not null,
primary key (id_lista_rep),
foreign key (id_sencillo) references  sencillos (id_sencillo),
foreign key (id_cuenta_asoc) references cuenta (id_cuenta));
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA GENERO-----------------------------------------------------------#
insert into genero(id_genero,nombre_genero)
values (1,'Pop');
insert into genero(id_genero,nombre_genero)
values (2,'Rock');
insert into genero(id_genero,nombre_genero)
values (3,'Hip hop');
insert into genero(id_genero,nombre_genero)
values (4,'House');
insert into genero(id_genero,nombre_genero)
values (5,'Grunge');
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA ARTISTA-----------------------------------------------------------#
insert into artista(id_artista,nombre_art)
values (1,'Kinalitos');
insert into artista(id_artista,nombre_art)
values (2,'Eminem');
insert into artista(id_artista,nombre_art)
values (3,'Alberto Losas');
insert into artista(id_artista,nombre_art)
values (4,'Carlos Rosa');
insert into artista(id_artista,nombre_art)
values (5,'Daft Punk');
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA ALBUMES-----------------------------------------------------------#
insert into albumes(id_album,nombre_al,duracion_al,autor_al)
values (1,'Random Access Memories',1.14,5);
insert into albumes(id_album,nombre_al,duracion_al,autor_al)
values (2,'Kinacoing',1.02,1);
insert into albumes(id_album,nombre_al,duracion_al,autor_al)
values (3,'The Eminem Show',1.17,2);
insert into albumes(id_album,nombre_al,duracion_al,autor_al)
values (4,'La llamada',0.30,4);
insert into albumes(id_album,nombre_al,duracion_al,autor_al)
values (5,'El resplandeciente',1.50,3);
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA SENCILLOS-----------------------------------------------------------#
insert into sencillos(id_sencillo,nombre_sen,duracion_sen,album_sen)
values (1,'Fragments of time',4.39,1);
insert into sencillos(id_sencillo,nombre_sen,duracion_sen,album_sen)
values (2,'Without Me',4.50,3);
insert into sencillos(id_sencillo,nombre_sen,duracion_sen,album_sen)
values (3,'¿Ganamos 4to?',3.01,2);
insert into sencillos(id_sencillo,nombre_sen,duracion_sen,album_sen)
values (4,'El adios',5.20,5);
insert into sencillos(id_sencillo,nombre_sen,duracion_sen,album_sen)
values (5,'Welcome to the game',1.20,4);
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA ASIGNACION GENERO ALBUM-----------------------------------------------------------#
insert into asig_genero_alb(asignacion_gen,genero_asig,album_asig)
values (1,4,1);
insert into asig_genero_alb(asignacion_gen,genero_asig,album_asig)
values (2,4,4);
insert into asig_genero_alb(asignacion_gen,genero_asig,album_asig)
values (3,3,3);
insert into asig_genero_alb(asignacion_gen,genero_asig,album_asig)
values (4,4,5);
insert into asig_genero_alb(asignacion_gen,genero_asig,album_asig)
values (5,5,2);
insert into asig_genero_alb(asignacion_gen,genero_asig,album_asig)
values (6,4,2);
insert into asig_genero_alb(asignacion_gen,genero_asig,album_asig)
values (7,3,5);
insert into asig_genero_alb(asignacion_gen,genero_asig,album_asig)
values (8,5,3);
insert into asig_genero_alb(asignacion_gen,genero_asig,album_asig)
values (9,1,5);
insert into asig_genero_alb(asignacion_gen,genero_asig,album_asig)
values (10,2,1);
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA ASIGNACION GENERO SENCILLO-----------------------------------------------------------#
insert into asig_genero_sen(asignacion_gen,genero_asig,sencillo_asig)
values (1,5,3);
insert into asig_genero_sen(asignacion_gen,genero_asig,sencillo_asig)
values (2,2,4);
insert into asig_genero_sen(asignacion_gen,genero_asig,sencillo_asig)
values (3,1,5);
insert into asig_genero_sen(asignacion_gen,genero_asig,sencillo_asig)
values (4,2,1);
insert into asig_genero_sen(asignacion_gen,genero_asig,sencillo_asig)
values (5,4,1);
insert into asig_genero_sen(asignacion_gen,genero_asig,sencillo_asig)
values (6,3,3);
insert into asig_genero_sen(asignacion_gen,genero_asig,sencillo_asig)
values (7,4,3);
insert into asig_genero_sen(asignacion_gen,genero_asig,sencillo_asig)
values (8,1,3);
insert into asig_genero_sen(asignacion_gen,genero_asig,sencillo_asig)
values (9,2,5);
insert into asig_genero_sen(asignacion_gen,genero_asig,sencillo_asig)
values (10,3,1);
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA USUARIO-----------------------------------------------------------#
insert into usuario(id_usuario,nombre,pais,usuario,clave,fecha_nac)
values (1,'Jhonatan','Guatemala','Jhon','ABC1234','2005/04/15');
insert into usuario(id_usuario,nombre,pais,usuario,clave,fecha_nac)
values (2,'Juan','Colombia','Juanito','1234SER','2100/06/10');
insert into usuario(id_usuario,nombre,pais,usuario,clave,fecha_nac)
values (3,'Carlos','Paises Bajos','Carl','SASD568','1980/06/04');
insert into usuario(id_usuario,nombre,pais,usuario,clave,fecha_nac)
values (4,'Pancho','España','Pan','ASDF456','1973/08/12');
insert into usuario(id_usuario,nombre,pais,usuario,clave,fecha_nac)
values (5,'Nancy','Paraguay','Nanche','6623ABH','2012/09/10');
insert into usuario(id_usuario,nombre,pais,usuario,clave,fecha_nac)
values (6,'Josefino','Uruguay','Jose','TBQDW49','2017/08/09');
insert into usuario(id_usuario,nombre,pais,usuario,clave,fecha_nac)
values (7,'Luis','Canada','Wicho','485652A','2010/09/07');
insert into usuario(id_usuario,nombre,pais,usuario,clave,fecha_nac)
values (8,'Pedro','Estados Unidos','Peter','45623SD','1986/12/20');
insert into usuario(id_usuario,nombre,pais,usuario,clave,fecha_nac)
values (9,'Ana','Alemania','Änä','64ASZCX','1978/09/14');
insert into usuario(id_usuario,nombre,pais,usuario,clave,fecha_nac)
values (10,'Andrea','Francia','Andre','4562AVE','1989/07/16');
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA PLANES-----------------------------------------------------------#
insert into planes(id_plan,nombre_pl,precio_pl,meses_hab)
values (1,'Gratis',null,null);
insert into planes(id_plan,nombre_pl,precio_pl,meses_hab)
values (2,'Premium',19.99,12);
insert into planes(id_plan,nombre_pl,precio_pl,meses_hab)
values (3,'Oro',14.99,10);
insert into planes(id_plan,nombre_pl,precio_pl,meses_hab)
values (4,'Plata',9.99,5);
insert into planes(id_plan,nombre_pl,precio_pl,meses_hab)
values (5,'VIP',4.99,1);
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA METODOS PAGO-----------------------------------------------------------#
insert into metodos_pago(id_metodo,nombre_met)
values (1,'Tarjeta de credito');
insert into metodos_pago(id_metodo,nombre_met)
values (2,'Tarjeta de debito');
insert into metodos_pago(id_metodo,nombre_met)
values (3,'PayPal');
insert into metodos_pago(id_metodo,nombre_met)
values (4,'Bitcoint');
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA CUENTA-----------------------------------------------------------#
insert into cuenta(id_cuenta,id_usuario,id_plan,id_metodo)
values (1,1,5,1);
insert into cuenta(id_cuenta,id_usuario,id_plan,id_metodo)
values (2,2,1,null);
insert into cuenta(id_cuenta,id_usuario,id_plan,id_metodo)
values (3,3,2,4);
insert into cuenta(id_cuenta,id_usuario,id_plan,id_metodo)
values (4,4,1,null);
insert into cuenta(id_cuenta,id_usuario,id_plan,id_metodo)
values (5,5,3,3);
insert into cuenta(id_cuenta,id_usuario,id_plan,id_metodo)
values (6,6,5,2);
insert into cuenta(id_cuenta,id_usuario,id_plan,id_metodo)
values (7,7,4,3);
insert into cuenta(id_cuenta,id_usuario,id_plan,id_metodo)
values (8,8,2,1);
insert into cuenta(id_cuenta,id_usuario,id_plan,id_metodo)
values (9,9,1,null);
insert into cuenta(id_cuenta,id_usuario,id_plan,id_metodo)
values (10,10,5,1);
#-----------------------------------------------------------AGREGANDO DATOS EN LA TABLA -----------------------------------------------------------#
insert into creacion_lista_rep(id_lista_rep,cant_reprodu,id_sencillo,id_cuenta_asoc)
values (1,2,1,1);
insert into creacion_lista_rep(id_lista_rep,cant_reprodu,id_sencillo,id_cuenta_asoc)
values (2,5,2,1);
insert into creacion_lista_rep(id_lista_rep,cant_reprodu,id_sencillo,id_cuenta_asoc)
values (3,1,5,1);
insert into creacion_lista_rep(id_lista_rep,cant_reprodu,id_sencillo,id_cuenta_asoc)
values (4,13,5,2);
insert into creacion_lista_rep(id_lista_rep,cant_reprodu,id_sencillo,id_cuenta_asoc)
values (5,5,3,2);
insert into creacion_lista_rep(id_lista_rep,cant_reprodu,id_sencillo,id_cuenta_asoc)
values (6,6,1,3);
insert into creacion_lista_rep(id_lista_rep,cant_reprodu,id_sencillo,id_cuenta_asoc)
values (7,5,2,3);
insert into creacion_lista_rep(id_lista_rep,cant_reprodu,id_sencillo,id_cuenta_asoc)
values (8,3,4,4);
insert into creacion_lista_rep(id_lista_rep,cant_reprodu,id_sencillo,id_cuenta_asoc)
values (9,8,5,4);
insert into creacion_lista_rep(id_lista_rep,cant_reprodu,id_sencillo,id_cuenta_asoc)
values (10,5,1,5);
insert into creacion_lista_rep(id_lista_rep,cant_reprodu,id_sencillo,id_cuenta_asoc)
values (11,1,4,5);
insert into creacion_lista_rep(id_lista_rep,cant_reprodu,id_sencillo,id_cuenta_asoc)
values (12,18,1,6);
insert into creacion_lista_rep(id_lista_rep,cant_reprodu,id_sencillo,id_cuenta_asoc)
values (13,51,2,6);
insert into creacion_lista_rep(id_lista_rep,cant_reprodu,id_sencillo,id_cuenta_asoc)
values (14,3,4,7);
insert into creacion_lista_rep(id_lista_rep,cant_reprodu,id_sencillo,id_cuenta_asoc)
values (15,1,1,7);
insert into creacion_lista_rep(id_lista_rep,cant_reprodu,id_sencillo,id_cuenta_asoc)
values (16,2,4,8);
insert into creacion_lista_rep(id_lista_rep,cant_reprodu,id_sencillo,id_cuenta_asoc)
values (17,7,2,8);
insert into creacion_lista_rep(id_lista_rep,cant_reprodu,id_sencillo,id_cuenta_asoc)
values (18,5,2,9);
insert into creacion_lista_rep(id_lista_rep,cant_reprodu,id_sencillo,id_cuenta_asoc)
values (19,9,1,9);
insert into creacion_lista_rep(id_lista_rep,cant_reprodu,id_sencillo,id_cuenta_asoc)
values (20,3,5,10);
insert into creacion_lista_rep(id_lista_rep,cant_reprodu,id_sencillo,id_cuenta_asoc)
values (21,2,4,10);
#------------------------------------------------------------------REALIZANDO CONSULTAS----------------------------------------------------------------#
select usuario.nombre,albumes.nombre_al from sencillos,albumes,cuenta,usuario,creacion_lista_rep
where usuario.nombre='Jhonatan' and creacion_lista_rep.id_cuenta_asoc=cuenta.id_cuenta and cuenta.id_usuario=usuario.id_usuario 
and creacion_lista_rep.id_sencillo=sencillos.id_sencillo and sencillos.album_sen=albumes.id_album;

select cuenta.id_cuenta,sencillos.nombre_sen,creacion_lista_rep.cant_reprodu from cuenta,creacion_lista_rep,sencillos
where cuenta.id_cuenta=6 and creacion_lista_rep.id_cuenta_asoc=cuenta.id_cuenta and creacion_lista_rep.id_sencillo=sencillos.id_sencillo
order by cant_reprodu desc;

select count(asignacion_gen) as sencillos_en_x_genero from sencillos,genero,asig_genero_sen
where genero.nombre_genero='Rock' and genero.id_genero=asig_genero_sen.genero_asig and sencillos.id_sencillo=asig_genero_sen.sencillo_asig;

select genero.nombre_genero,albumes.nombre_al from genero,albumes,asig_genero_alb
where genero.nombre_genero='House' and albumes.id_album=asig_genero_alb.album_asig and asig_genero_alb.genero_asig=genero.id_genero;