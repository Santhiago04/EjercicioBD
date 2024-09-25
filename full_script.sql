/*primer punto*/
create database mascotas;
use mascotas;
/*creacion de tablas*/
create table mascota(
idMascota int(11) primary key,
nombreMascota varchar(15) ,
generoMascota varchar(15),
razaMascota varchar(15),
cantidad int(10));

create table mascota_vacuna(
codigovacunaFK int(11),
idMascotaFK int(11),
enfermedad varchar(15));

create table vacuna(
codigoVacuna int(11) primary key,
nombreVacuna varchar(15),
dosisVacuna int(10),
enfermedad varchar(15));


create table cliente(
cedulaCliente int primary key,
nombreCliente varchar(15),
apellidoCliente varchar(15),
direccionCliente varchar(10),
telefono int(10),
idMascotaFK int);

create table producto(
codigoProducto int(11) primary key,
nombreProducto varchar(15),
marca varchar(15),
precio Float,
cedulaClienteFK int(11));

/*relaciones entre tablas*/

alter table producto
add constraint cedula_cliente
foreign key(cedulaClienteFK)
references cliente(cedulaCliente);

alter table cliente
add constraint id_mascotica
foreign key(idMascotaFK)
references mascota(idMascota);

alter table mascota_vacuna
add constraint cod_mascotaFK
foreign key(idMascotaFK)
references mascota(idMascota);

alter table mascota_vacuna
add constraint cod_vacuna
foreign key(codigoVacunaFK)
references vacuna(codigoVacuna);

/*cantidad entero obligatorio en producto*/

alter table producto 
add cantidad int not null;

/*cambiar nombre de columna cantidad a cantidadMascota*/
alter table mascota
change column cantidad
cantidadMascota int;

/*cambiar nombre de mascota_vacuna por detalleVacuna */
alter table mascota_vacuna rename to detalle_vacuna;

use mascotas;
/*clase 18/09*/
describe mascota;
describe cliente;
describe vacuna;
insert into mascota values(1,"juanpachon","M","criollo",1),("2","chiquijara","M","criollo",2),(3,"tanka","M","bulldog",1);
insert into cliente values(987,"Chiqui","jara","callebait","777",2)(123,"Andrés","Miranda","callexd1","3201236547",1);
insert into producto values(1,"shampoo","pets",10500,987,1);
insert into vacuna values(1,"malaria",10,"malaria"),(2,"rabia",5,"rabia");
select*from mascota;
select* from cliente;
select nombreCliente from cliente;
select razaMascota from mascota;
delete from cliente where cedulaCliente=987;


/*clase 20/09/24
hoy la clase es pura consultas, select, que se puede jugar con los parametros para consultar solo ciertas cosas o mostrarlas con cierto alias*/

select* from cliente;
select nombreMascota, razaMascota from mascota;
select cedulaCliente as "documento",direccionCliente as "direccion" from cliente; 
select nombreCliente from cliente order by cedulaCliente asc;
select cedulaCliente as "documento",idMascotaFK as "codigo mascota" from cliente order by nombreCliente asc;
select nombreProducto,marca from producto order by precio desc;
select nombreProducto from producto where precio>1000;
select enfermedad from detalle_vacuna where codigovacunaFK=123;
select nombreProducto from producto where codigoProducto>2 and precio=1000;
select nombreMascota as "nombre", genero from mascota where razaMascota="criollo" and cantidad=1;
select idMascota as "id", nombreMascota as "Nombre" from mascota where cantidad=2;
select nombreVacuna as "Nombre", dosis from vacuna where enfermedad="malaria";
select enfermedad from vacuna where dosis<10 and enfermedad="rabia";
select cedulaCliente as "cedula", nombreCliente as "Nombre" from cliente where direccion="callebait" and idMascotaFK=1;
select direccionCliente as "direccion" from cliente where cedulaCliente=123 or nombreCliente="chiqui";
drop table Producto;
drop table Usuarios;
drop table Clientes;
drop table Ventas;
drop table detalle_venta_producto;

/*clase 23/09/24*/

/* primer punto crear una base de datos que se llame tiendaOnline
segundo punto habilitar la base de datos
tercer punto crear tablas Producto(id autoincrement cb), Usuarios, Clientes(autoincrement) y Ventas(id autoincrement) atributos los que te parezca conveniente
cuarto punto realizar relaciones:
un cliente puede realizar muchas ordenes(ventas); un usuario puede generar muchas ordenes; un cliente puede comprar muchos productos; una orden puede contener muchos productos; un producto puede ser comprado muchas veces
quinto punto 4 inserciones a tablas
sexto realizar las consultas:
consulta general de todos los productos
ordenar productos por precio de menor a mayor
consultar los clientes que nacen en Enero
consultar los usuarios con rol empleado
consultar las ordenes generadas entre marzo y junio
consultar productos que contengan la letra "r"
consultar las ventas que tengan productos con precio de 15000 o 30000*/
/*creacion de database*/
create database TiendaOnline;
/*habilitacion de database*/
use TiendaOnline;
/*creacion de tablas*/
create table Producto(
id_producto int auto_increment primary key,
cod_bar varchar(12),
nombre_producto varchar(15),
precio int,
cantidad int);
create table Usuarios(
id_usuario int primary key,
nombre_usuario varchar(20),
rol varchar(15)
);
create table Clientes(
id_cliente int auto_increment primary key,
nombre_cliente varchar(20),
mes_cumpleanios varchar(20)
);
create table detalle_venta_producto(
id_ventaFK int,
id_productoFK int,
precio_unitario int,
cantidad int,
precio_total int
);
create table Ventas(
id_venta int auto_increment primary key,
id_clienteFK int,
id_usuarioFK int,
fecha date
);

/*relaciones*/
alter table detalle_venta_producto
add constraint ide_venta 
foreign key (id_ventaFK)
references Ventas(id_venta);

alter table detalle_venta_producto
add constraint ide_producto
foreign key(id_productoFK)
references Producto(id_producto);

alter table Ventas
add constraint ide_cliente
foreign key(id_clienteFK)
references Clientes(id_cliente);

alter table Ventas
add constraint ide_usuario
foreign key(id_usuarioFK)
references Usuarios(id_usuario);
use tiendaonline;
/*inserciones de datos*/
insert into Producto values(1,"123456","zapatos",30000,20),(2,"98765","gafas",20000,30),(3,"56789432","carro de juguete",15000,10),(4,"09871234","short",30000,13);
insert into Usuarios values(777,"Vegetta","admin"),(40,"ezio","empleado"),(18,"Marcus","empleado"),(386,"geppetto's puppet","admin");
insert into Clientes values(1,"juanpa chon", "enero"),(2,"dracko","febrero"),(3,"juanjocp","marzo"),(4,"Daniel","abril");
insert into Ventas values(1,1,777,03/04/2024),(2,2,40,05/04/2024),(3,3,18,07/06/2024),(4,4,386,23/06/2024);
insert into detalle_venta_producto values(1,1,30000,2,60000),(2,2,20000,1,20000),(3,3,15000,2,30000),(4,4,30000,3,90000);
/*consultas*/
select* from Producto;
select nombre_producto from Producto order by precio asc;
select nombre_cliente from clientes where mes_cumpleanios="enero";
select nombre_usuario from usuarios where rol="empleado";
select id_venta from ventas where fecha between 01/03/2024 and 30/06/2024;
select nombre_producto from producto where nombre_producto like "%r%";
select id_ventaFK from detalle_venta_producto where precio_unitario=15000 or precio_unitario=30000;
use mascotas;
select count(cedulaCliente) from cliente;
select precio from ventas where id_clienteFK="xd";
select max(precio_total) from detalle_venta_producto;
select id_clienteFK from detalle_venta_producto inner join Ventas on Ventas.id_venta=detalle_venta_producto.id_ventaFK where detalle_venta_producto.precio_total;
/*cliente de mayor venta
select usuario y cliente de una venta
consultar los productos que compro un cliente especifico
consultar todos los clientes que han hecho ventas
*/
select id_clienteFK from detalle_venta_producto inner join Ventas on Ventas.id_venta=detalle_venta_producto.id_ventaFK where detalle_venta_producto.precio_total;
