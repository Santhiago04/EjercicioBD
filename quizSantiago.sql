/*punto 1*/
create database mascotas;
use mascotas; 

/*punto 2*/
create table vacuna (
codigoVacuna int primary key,
nombreVacuna varchar(15),
dosisVacuna int,
enfermedad varchar(15)
);

create table mascota(
idMascota int primary key,
nombreMascota varchar(15),
generoMascota varchar(15),
razaMascota varchar(15),
cantidad int
);

create table mascota_vacuna(
codigoVacunaFK int not null,
idMascotaFk int not null,
enfermedad varchar(15)
);

create table producto(
codigoProducto int primary key,
nombreProducto varchar(15),
marca varchar(15),
precio float,
cedulaClienteFK int not null
);

create table cliente(
cedulaCliente int primary key,
nombreCliente varchar(15),
apellidoCliente varchar(15),
direccionCliente varchar(15),
telefono int,
idMascotaFK int not null
);

/*punto 3*/

alter table producto
add constraint FKcedulaCliente
foreign key(cedulaClienteFK)
references cliente(cedulaCliente);

alter table cliente
add constraint FKideMascota
foreign key(idMascotaFK)
references mascota(idMascota);

alter table mascota_vacuna
add constraint FKcodigoVacuna
foreign key(codigoVacunaFK)
references vacuna(codigoVacuna);

alter table mascota_vacuna
add constraint FKidMascota
foreign key(idMascotaFK)
references mascota(idMascota);

/*punto 4*/
alter table producto add cantidad int not null;

/*punto 5*/
alter table mascota CHANGE column cantidad  cantidadMascota int;

/*punto 6*/
alter table mascota_vacuna rename to detalleVacuna; 

/*************************************************************************/*

/*Clase miercoles 18 de septiembre 2024*/
describe mascota;
insert into mascota values(1, 'Rusth', 'M', 'Criollo', 1);
insert into mascota values(2, 'Floky', 'M', 'Criollo', 1);
insert into mascota values(3, 'Luna', 'F', 'Criollo', 1);
insert into mascota values(4, '', '', '', '');
select * from mascota;

describe vacuna;
insert into vacuna values('1', 'fiebre amarilla', 1, 'fiebre amarilla');
insert into vacuna values('2', 'malaria', 1, 'malaria');
select * from vacuna;

describe cliente;
alter table cliente modify telefono varchar(20);
delete from cliente where cedulaCliente = 1021670731;
insert into cliente values(1021670731, 'Santiago', 'Gomez', 'calle 1c', '3015390748', 2);
insert into cliente values(1011520691, 'Juan', 'Pachon', 'Villa Alsacia', '3115395848', 1);
select * from cliente;
describe producto;

insert into producto values(1, 'Shampoo', 'pets', 10500, 1021670731, 1);
insert into producto values(2, 'Galletas', 'tankpets', 55500, 1011520691, 2);
select * from producto;

insert into detalleVacuna values(1, 1, 'fiebre amarilla');
insert into detalleVacuna values(2, 3, 'malaria');

select nombreMascota as 'nombre', generoMascota as 'genero' from mascota;

select cedulaCliente as 'Documento', nombreCliente as 'Nombre', direccionCliente as ' Dirección' from cliente;
select* from cliente;

select codigoVacuna as 'Codigo', nombreVacuna as 'Nombre', dosisVacuna as 'Dosis' from vacuna;
select* from vacuna;

select nombreProducto as 'Nombre', marca as 'Marca Producto', precio as 'Valor Unitario' from producto;

/*ORDER BY*/
select cedulaCliente as 'Documento', idMascotaFK as 'Código Mascota' from cliente order by nombreCliente asc;
select nombreProducto as 'Nombre', marca from producto order by precio desc;

/*WHERE*/
select nombreProducto as 'Nombre' from producto where precio > 10500;

select * from detalleVacuna;

/*dos consultas sobre vacuna, cliente y mascota con operadores logicos y relacionales*/
select * from vacuna;
select * from cliente;
describe producto;
describe cliente;
select * from mascota;
select nombreVacuna as 'Nombre', dosisVacuna as 'Dosis Vacuna' from vacuna where dosisVacuna >=1;
select cedulaCliente as 'Documento', nombreCliente as 'Nombre' from cliente where telefono = '3015390748' and idMascotaFK >= 1;
select nombreMascota as 'Nombre', generoMascota as 'Genero' from mascota where cantidadMascota >= 1 and idMascota >= 2;

/*BETWEEN*/
select nombreProducto from producto where precio between 10000 and 100000; 

/*LIKE & NOT LIKE*/
select nombreProducto as 'Nombre' from producto where marca like 't%';
select nombreProducto as 'Nombre' from producto where marca not like 't%';	
