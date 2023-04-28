create database escuela;
use escuela;

create table instructor(id_inst integer not null, 
nombre_inst varchar(50), 
apellido_inst varchar(50), 
telefono_inst varchar(50), 
direccion_inst varchar(50), 
primary key(id_inst));


create table materia(id_materia integer not null, 
nombre_mat varchar(50), 
descrip_mat varchar(50), 
primary key(id_materia));


create table salon(id_salon integer not null, 
nombre_sal varchar(50), 
cant_per_sal varchar(50), 
primary key(id_salon));


create table asignacion(id_asig integer not null, 
inst_asig integer not null, 
salon_asig integer not null, 
hora_inicio datetime, 
hora_final datetime, 
primary key(id_asig), 
foreign key (inst_asig) references instructor (id_inst), 
foreign key (salon_asig) references salon (id_salon));

insert into instructor values();