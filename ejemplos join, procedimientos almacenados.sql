create database empresa;
use empresa;

create table departamento
( id integer not null,
nombre varchar(20),
primary key (id));

create table empleados
(
id_empleado integer not null,
nombre varchar(20),
departamento_id integer,
primary key(id_empleado),
foreign key(departamento_id) references departamento(id));

insert into departamento values(33,'ventas');
insert into departamento values(34,'Ingenieria');
insert into departamento values(35,'Contabilidad');
insert into departamento values(36,'Marketing');
insert into departamento values(37,'Desarrollo');

insert into empleados values(100,'Juan',33);
insert into empleados values(101,'Alex',34);
insert into empleados values(102,'Diego',35);
insert into empleados values(103,'Alberto',33);
insert into empleados values(104,'Cristopher',36);
insert into empleados values(105,'Fabian',35);
#---------------Consultas
select * from empleados;
select * from departamento;

#---------------Joins

#---------------Inner join
select * from empleados e
join departamento d on e.departamento_id=d.id;

#----------------Left join
select empleados.nombre,departamento.nombre from empleados
left join departamento on empleados.departamento_id=departamento.id;

#----------------Right join
select e.nombre as 'Empleados',d.nombre as 'departamento'
from empleados e right join departamento d on e.departamento_id=d.id;

#----------------Procedimientos almacenados
delimiter $$
create procedure mostrarVariable()
begin
	declare variable int;
    set variable=23;
    
    select variable;
    
end$$
delimiter ;

#drop procedure mostrarVariable;


delimiter $$
create procedure suma(a int,b int)
begin
	declare total int;
    set total=a+b ;
    
    select total;
end $$
delimiter ;


delimiter $$
create procedure consulta()
begin

select * from empleados;

end $$
delimiter ;


delimiter $$
create procedure consultaN()
begin

select nombre from departamento;

end$$
delimiter ;

delimiter $$
create procedure consultaEmp(id int)
begin

	select * from empleados where id_empleado=id;
end$$
delimiter ;

call consultaEmp(100);

call consultaN();
call mostrarVariable();
call suma(100,200);
call consulta();
#---------------------------Insertar datos con el procedimiento-----------#

delimiter $$
create procedure insertarDatos(id int, nombre varchar(20))
begin
	insert into departamento values(id,nombre);

end$$
delimiter ;
call insertarDatos(40,'Mantenimiento');
call insertarDatos(39,'Cobros');
call insertarDatos(51,'Cajas');
select * from departamento;

#---------------------------Modificar una tupla con un procedimiento---------------#
delimiter $$
create procedure modificarDatos(id int, nombre_mod varchar(20))
begin
	update departamento set nombre=nombre_mod where departamento.id=id;


end$$
delimiter ;
call modificarDatos(33,'Sistemas')
#---------------------------Eliminar una tupla con un procedimiento---------------#
delimiter $$
create procedure eliminarTupla(id int)
begin
	delete from departamento where id=departamento.id;
end$$
delimiter ;
call eliminarTupla(37)