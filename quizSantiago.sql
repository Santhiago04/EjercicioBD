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
alter table mascota CHANGE column cantidad cantidadMascota;

/*punto 6*/
alter table mascota_vacuna rename to detalleVacuna;