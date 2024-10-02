-- 1. Crear la base de datos llamada Tienda Online
CREATE DATABASE Tienda_Online;

-- 2. Usar la base de datos llamada Tienda Online
USE Tienda_Online;

-- 3. CREAR TABLAS sin restricciones
CREATE TABLE Producto (
    codigoBarras INT AUTO_INCREMENT PRIMARY KEY,
    nombreProducto VARCHAR(50),
    categoriaProducto VARCHAR(50),
    precioProducto DECIMAL(10, 2),
    cantidadProducto INT
);

CREATE TABLE Usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nombreUsuario VARCHAR(50),
    rolUsuario VARCHAR(50)
);

CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nombreCliente VARCHAR(50),
    fechaNacimiento DATE
);

CREATE TABLE Venta (
    idVenta INT AUTO_INCREMENT PRIMARY KEY,
    fechaVenta DATE,
    totalVenta DECIMAL(10, 2),
    idClienteFK INT,
    idUsuarioFK INT
);

CREATE TABLE DetalleVenta (
    idDetalleVenta INT AUTO_INCREMENT PRIMARY KEY,
    idVentaFK INT,
    idProductoFK INT,
    cantidad INT,
    precioUnitario DECIMAL(10, 2)
);

-- 4. AGREGAR RESTRICCIONES (CONSTRAINTS) USANDO ALTER TABLE

-- Relacionar Venta con Cliente
ALTER TABLE Venta
ADD CONSTRAINT FK_Cliente_Venta
FOREIGN KEY (idClienteFK) REFERENCES Cliente(idCliente);

-- Relacionar Venta con Usuario
ALTER TABLE Venta
ADD CONSTRAINT FK_Usuario_Venta
FOREIGN KEY (idUsuarioFK) REFERENCES Usuario(idUsuario);

-- Relacionar DetalleVenta con Venta
ALTER TABLE DetalleVenta
ADD CONSTRAINT FK_Venta_Detalle
FOREIGN KEY (idVentaFK) REFERENCES Venta(idVenta);

-- Relacionar DetalleVenta con Producto
ALTER TABLE DetalleVenta
ADD CONSTRAINT FK_Producto_Detalle
FOREIGN KEY (idProductoFK) REFERENCES Producto(codigoBarras);



-- 5. HACER INSERCIONES POR TABLA

-- Insertar en la tabla Producto
INSERT INTO Producto (nombreProducto, categoriaProducto, precioProducto, cantidadProducto) 
VALUES 
('Gorros para bebé', 'Ropa', 26000, 15),
('Zapatos deportivos', 'Calzado', 55000, 25),
('Gafas de sol', 'Accesorios', 30000, 10),
('Camiseta estampada', 'Ropa', 45000, 20);

-- Insertar en la tabla Usuario
INSERT INTO Usuario (nombreUsuario, rolUsuario) 
VALUES 
('Santiago', 'Administrador'),
('Lucía', 'Empleado'),
('Carlos', 'Empleado'),
('Ana', 'Administrador');

INSERT INTO Usuario (nombreUsuario, rolUsuario)
VALUES
('Daniel Cajero', 'Cajero'),
('Daniel Administrador', 'Administrador'),
('Daniel Secretario', 'Secretario'),
('Daniel Ejecutivo', 'Ejecutivo');

-- Insertar en la tabla Cliente
/*Insertando la columna 'activo' y re insertando valores*/
ALTER TABLE Cliente
ADD COLUMN activo BOOL;

INSERT INTO Cliente (nombreCliente, fechaNacimiento, activo) 
VALUES 
('Tatiana Cabrera', '1990-06-15', TRUE),
('Juan Pérez', '1985-08-23', TRUE),
('María López', '1992-11-10', TRUE),
('Andrés Ramírez', '1988-01-05', TRUE),
('Daniel Alarcón S', '2002-05-13', TRUE);

/* Agregando la dirección de los clientes*/
ALTER TABLE Cliente
ADD COLUMN direccion varchar(50);

ALTER TABLE Cliente
MODIFY telefono BIGINT;

UPDATE Cliente
SET direccion = 'Calle 104 #13-14', telefono = 3144606918  
WHERE idCliente = 1;

UPDATE Cliente
SET direccion = 'Calle 70a# 8-27', telefono = 3242818095
WHERE idCliente = 4;
 
-- Insertar en la tabla Venta
/* Agregando la columna numOrden e insertando los valores nuevamente*/
ALTER TABLE Venta
ADD COLUMN numOrden INT;

INSERT INTO Venta (fechaVenta, totalVenta, idClienteFK, idUsuarioFK, numOrden) 
VALUES 
('2024-03-15', 100000, 1, 1, 20240901),
('2024-03-16', 55000, 2, 2, 20240902),
('2024-03-17', 30000, 3, 3, 20240903),
('2024-03-18', 45000, 4, 4, 20240904);


-- Insertar en la tabla DetalleVenta
INSERT INTO DetalleVenta (idVentaFK, idProductoFK, cantidad, precioUnitario) 
VALUES 
(1, 1, 2, 26000),
(2, 2, 1, 55000),
(3, 3, 1, 30000),
(4, 4, 1, 45000);

-- 5. PROCEDIMIENTOS ALMACENADOS Y VISTAS


-- a. Consulta general de todos los productos
SELECT * FROM Producto;

-- b. Ordenar productos por precio de menor a mayor
SELECT * FROM Producto ORDER BY precioProducto ASC;

-- c. Consultar los clientes que nacen en enero
SELECT * FROM Cliente WHERE MONTH(fechaNacimiento) = 1;

-- d. Consultar los usuarios con rol de empleado
SELECT * FROM Usuario WHERE rolUsuario = 'Cajero' OR rolUsuario = 'Secretario';

-- e. Consultar las órdenes generadas entre marzo y junio
SELECT * FROM Venta WHERE MONTH(fechaVenta) BETWEEN 3 AND 6;

-- f. Consultar los productos que contengan la letra 'r'
SELECT * FROM Producto WHERE nombreProducto LIKE '%r%';

-- g. Consultar las ventas con productos de precio 15,000 o 30,000
SELECT DISTINCT v.idVenta, v.fechaVenta, p.nombreProducto, dv.cantidad, p.precioProducto
FROM Venta v
JOIN DetalleVenta dv ON v.idVenta = dv.idVentaFK
JOIN Producto p ON dv.idProductoFK = p.codigoBarras
WHERE p.precioProducto BETWEEN 15000 AND 30000;

-- Procedimiento para inactivar un cliente
DELIMITER //
CREATE PROCEDURE inactivarCliente (id_cliente_input INT)
BEGIN
    UPDATE Cliente SET activo = FALSE WHERE idCliente = id_cliente_input;
END //
DELIMITER ;

-- COMPROBACIÓN
 CALL inactivarCliente(4);
 SELECT * FROM Cliente WHERE idCliente = 4;
 
-- Procedimiento para consultar los productos que ha comprado un cliente
DELIMITER //
CREATE PROCEDURE consultarProductosCliente (id_cliente_input INT)
BEGIN
    SELECT P.nombreProducto, D.cantidad, D.precioUnitario 
    FROM Producto P 
    INNER JOIN DetalleVenta D ON P.codigoBarras = D.idProductoFK 
    INNER JOIN Venta V ON D.idVentaFK = V.idVenta 
    INNER JOIN Cliente C ON V.idClienteFK = C.idCliente 
    WHERE C.idCliente = id_cliente_input;
END //
DELIMITER ;

-- COMPROBACIÓN
CALL consultarProductosCliente(1);
SELECT * FROM Venta WHERE idClienteFK = 1;

-- Procedimiento para modificar la fecha de nacimiento de un cliente
DELIMITER //
CREATE PROCEDURE modificarFechaNacimiento (id_cliente_input INT, nueva_fecha DATE)
BEGIN
    UPDATE Cliente SET fechaNacimiento = nueva_fecha WHERE idCliente = id_cliente_input;
END //
DELIMITER ;

-- COMPROBACIÓN
 CALL modificarFechaNacimiento(4, '2024-10-31');
 SELECT * FROM Cliente WHERE idCliente = 4;
 
-- Vista para saber qué cliente compró un producto y mostrar el número de orden
CREATE VIEW vista_cliente_producto AS
SELECT C.nombreCliente, P.nombreProducto, V.numOrden
FROM Cliente C
JOIN Venta V ON C.idCliente = V.idClienteFK
JOIN DetalleVenta D ON V.idVenta = D.idVentaFK
JOIN Producto P ON D.idProductoFK = P.codigoBarras;

SELECT * FROM vista_cliente_producto;

-- Vista para mostrar el cliente con más compras
CREATE VIEW vista_cliente_mas_compras AS
SELECT C.nombreCliente, COUNT(V.idVenta) AS totalCompras
FROM Cliente C
JOIN Venta V ON C.idCliente = V.idClienteFK
GROUP BY C.idCliente
ORDER BY totalCompras DESC
LIMIT 1;

SELECT * FROM vista_cliente_mas_compras;

/*---------------
---------------*/
/* Sentencias anidadas para subconsultas
	SELECT CAMPO 1, CAMPO 2, CAMPO 3 FROM TABLA GRANDE
    WHERE CAMPO 2 = (SELECT CAMPO 2X FROM OTRA TABLA 
					 WHERE CONDICION);
*/

-- EJEMPLO: CONSULTAR LOS DATOS DE LOS EMPLEADOS Y SU SUELDO PROMEDIO

/* SELECT idEmpleado, nombreEmpleado, salario
   FROM Empleado WHERE salario > (SELECT AVG(salario)
   FROM Empleado);
*/

/* Consultar el área a la que pertenece un empleado
	SELECT idEmpleado, nombreEmpleado, idArea, nombreArea
    FROM Empleado WHERE idEmpleado = (SELECT idEmpleado FROM Departamento WHERE idEmpleado = 1234)
*/

-- Calcular los productos que se venden a un precio mayor del promedio de todos los productos
SELECT codigoBarras, codigoBarras, nombreProducto, precioProducto
FROM Producto WHERE precioProducto > (SELECT avg(precioProducto) FROM Producto);

-- Mostrar los clientes que en el total de compra sea mayor al promedio de compras de la tienda
SELECT idVenta, totalVenta, idUsuarioFK
FROM Venta WHERE totalVenta > (SELECT AVG(totalVenta) FROM Venta);

-- Mostrar el promedio de precios de productos comprados por clientes
SELECT c.idCliente, c.nombreCliente, 
       (SELECT AVG(p.precioProducto)
        FROM DetalleVenta dv
        JOIN Producto p ON dv.idProductoFK = p.codigoBarras
        WHERE dv.idVentaFK IN 
              (SELECT v.idVenta
               FROM Venta v
               WHERE v.idClienteFK = c.idCliente)) AS promedioPrecioProductos
FROM Cliente c;
