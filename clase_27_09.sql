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
insert into Producto values (5,"1574851", "Gorros pera bebe", 26000, 15);
insert into Usuarios values (235, "Santi", "admin");
insert into Clientes values (5, "Tatiana", "Junio");
describe Clientes;

alter table Clientes add apellido_cliente varchar(50);
alter table Clientes add direccion_cliente varchar(50);
alter table Clientes add celular_cliente float;
alter table Clientes add apellido_cliente varchar(50);
alter table Clientes rename column mes_cumpleanios to fecha_nacimiento;

update Clientes set apellido_cliente = "Cabrera Vargas", direccion_cliente = "cll 104#13-14", celular_cliente = 3144606918
where id_cliente = 5;

describe Ventas;
alter table Ventas add num_orden int;

update Ventas set num_orden = 20240927 where id_venta = 5;

describe Clientes;
insert into Clientes values (55163118, "Tatiana", "Noviembre", "Cabrera Vargas", "Cll 104 #13-14", 3144606918);
insert into Usuarios values(1021670731, "Santiago", "Admin");
update Ventas set id_clienteFK = 55163118, id_usuarioFK = 1021670731 where id_venta = 5;
select* from Ventas;
select* from detalle_venta_producto;
delete from Clientes where id_cliente = 5;

describe Ventas;

update Usuarios set id_cliente = 1021670731 where id_cliente = 235;
insert into Ventas values(5, 5, 235, 27/06/2024);
insert into detalle_venta_producto values(5, 5, 26000, 1, 26000);

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




/*PROCEDIMIENTOS ALMACENADOS, SUBCONSULTAS Y VISTAS*/
use tiendaonline;
select * from clientes;
select nombre_cliente from clientes where id_cliente = 4;
/*PROCEDIMIENTOS ALMACENADOS -> nos permiten generar subrutinas
DELIMITER//
CREATE PROCEDURE nombre_procedimiento(parametros)
BEGIN
--LOGICA SENTENCIA QUE SE QUIERA UTILIZAR
END//
DELIMITER;
*/

describe producto;
DELIMITER //
create procedure registrarProductos (id int, cod varchar(12), nombre varchar(15), precio int, cantidad int)
begin
insert into producto values (id, cad, nombre, precio, cantidad);
end//
delimiter ;

call registrarProductos('', '12por', 'marcadores', 12000, 23);

drop procedure registrarProductos; 

create view consultarCliente as select * from clientes;
select * from consultarCliente;


ALTER TABLE Clientes ADD COLUMN activo BOOLEAN DEFAULT 1;
DELIMITER //
CREATE PROCEDURE inactivarCliente (id_cliente_input INT)
BEGIN
UPDATE Clientes SET activo = 0 WHERE id_cliente = id_cliente_input;
END //

DELIMITER //
CREATE PROCEDURE consultarProductosCliente (id_cliente_input INT)
BEGIN
SELECT P.id_producto, P.nombre_producto, DVP.cantidad, DVP.precio_total
FROM Clientes C
JOIN Ventas V ON C.id_cliente = V.id_clienteFK
JOIN detalle_venta_producto DVP ON V.id_venta = DVP.id_ventaFK
JOIN Producto P ON DVP.id_productoFK = P.id_producto
WHERE C.id_cliente = id_cliente_input;
END //
DELIMITER ;

DELIMITER //

CREATE PROCEDURE modificarMesCumpleaniosCliente (id int, nuevo_mes VARCHAR(20))
BEGIN
UPDATE Clientes
SET mes_cumpleanios = nuevo_mes
WHERE id_cliente = id;
END //

DELIMITER ;


CREATE VIEW vista_cliente_producto AS
SELECT C.nombre_cliente, P.nombre_producto, V.id_venta
FROM Clientes C
JOIN Ventas V ON C.id_cliente = V.id_clienteFK
JOIN detalle_venta_producto DVP ON V.id_venta = DVP.id_ventaFK
JOIN Producto P ON DVP.id_productoFK = P.id_producto;


CREATE VIEW vista_cliente_mas_compras AS
SELECT C.id_cliente, C.nombre_cliente, COUNT(V.id_venta) AS total_compras
FROM Clientes C
JOIN Ventas V ON C.id_cliente = V.id_clienteFK
GROUP BY C.id_cliente
ORDER BY total_compras DESC
LIMIT 1;

CREATE VIEW vista_clientes_con_compras AS
SELECT C.id_cliente, C.nombre_cliente, COUNT(V.id_venta) AS total_compras
FROM Clientes C
JOIN Ventas V ON C.id_cliente = V.id_clienteFK
GROUP BY C.id_cliente;


/*de la tienda online crear:
- procedimiento para inactivar un cliente
- procedimiento para consultar los productos que ha comprado un cliente
- procedimiento para modificar la fecha de nacimiento de cliente

-vista para saber que cliente compro un producto y muestre el numero de orden
vista para el cliente que mas compras haya hecho*/
