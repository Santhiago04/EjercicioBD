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
select id_ventaFK from detalle_venta_producto where precio_unitario=15000 or precio_unitario=30000
