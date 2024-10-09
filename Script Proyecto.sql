/*+++++ EN ESTE SCRIPT, SE CREARÁ LA BASE DE DATOS PARA EL PROYECTO *****/

CREATE DATABASE ProyectoIngDatos;
USE ProyectoIngDatos;

/****** CREANDO LAS TABLAS *****/
CREATE TABLE Producto (
	id_producto INT AUTO_INCREMENT PRIMARY KEY,
    stock INT NOT NULL,
    descripcion VARCHAR(50)
);

-- Hizo falta agregar una columna
ALTER TABLE Producto
ADD COLUMN id_categriaFK INT;

CREATE TABLE Cliente (
	id_cliente INT PRIMARY KEY,
    nombreCliente VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono INT NOT NULL
);

CREATE TABLE Venta (
	id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha_venta DATE,
    id_productoFK INT,
    id_clienteFK INT,
    cantidad INT NOT NULL
);

CREATE TABLE Categoria (
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombreCategoria VARCHAR (15) NOT NULL
);

/***** AGREGANDO LAS RESTRICCIONES *****/
ALTER TABLE Producto
ADD CONSTRAINT FKidCategoria
FOREIGN KEY (id_categriaFK) REFERENCES Categoria(id_categoria);

ALTER TABLE Venta
ADD CONSTRAINT FKidProducto
FOREIGN KEY (id_productoFK) REFERENCES Producto(id_producto);

ALTER TABLE Venta
ADD CONSTRAINT FKidCliente
FOREIGN KEY (id_clienteFK) REFERENCES Cliente(id_cliente);

/***** HACIENDO LAS INSERCIONES CLIENTES*****/
ALTER TABLE Cliente
MODIFY COLUMN telefono BIGINT;

ALTER TABLE Venta
DROP FOREIGN KEY FKidCliente;

ALTER TABLE Cliente
MODIFY COLUMN id_cliente BIGINT;

ALTER TABLE Venta
MODIFY COLUMN id_clienteFK BIGINT;

ALTER TABLE Venta
ADD CONSTRAINT FKidCliente
FOREIGN KEY (id_clienteFK) REFERENCES Cliente(id_cliente);

INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (1771015132, 'CAMILA FERNANDEZ', 'Calle 45 #27-15', 3196549873);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (140131907, 'OLGA LUCIA TRUJILLO', 'Carrera 15 #72-30', 3149871234);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (1937850673, 'VICTOR DUEÑAS', 'Calle 85 #12-21', 3265437890);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (7054981938, 'OSCAR ALBA', 'Avenida Carrera 9 #113-10', 3104567890);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (94295614, 'JUAN PABLO ROA', 'Carrera 7 #32-99', 3231239876);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (284353151, 'CARLOS MANRIQUE', 'Calle 13 #20-50', 3216547890);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (31558083, 'MAURICIO VILLALBA', 'Calle 100 #7-80', 3294567891);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (730506542, 'NIKO D"HILL', 'Carrera 68 #22-15', 3126781234);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (183267071, 'JUAN GARCIA', 'Carrera 10 #63-44', 3205678943);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (3788189555, 'NEFTALY BONILLA', 'Calle 26 #96-30', 3136541237);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (7061157361, 'MISAEL RAMIREZ', 'Carrera 50 #35-45', 3276781234);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (5218037478, 'OLME MARIN', 'Calle 19 #4-09', 3115437892);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (49767673, 'ANDRES CONTRERAS', 'Avenida Suba #123-45', 3156547893);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (720609550, 'JUAN PABLO CHAVARRO', 'Calle 53 #30-20', 3244567890);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (92640630, 'EDUARDO SANDOVAL', 'Carrera 17 #102-18', 3171239874);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (6779697364, 'MARIA CAMILA', 'Carrera 8 #15-55', 3227895432);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (34811317, 'OMAR ALFONSO ANTHONI', 'Calle 93 #14-12', 3145678912);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (29183787, 'SANTIAGO PAEZ', 'Carrera 13 #85-40', 3129876543);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (161659308, 'MAICOL CUESTA', 'Carrera 11 #98-35', 3231239871);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (21818428, 'FERNANDO LOPEZ', 'Calle 72 #19-89', 3201234567);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (6869837238, 'DIEGO QUINTERO', 'Carrera 30 #48-10', 3289876543);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (97358121, 'LAURA URBINA', 'Carrera 68D #60-25', 3216783452);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (41493515, 'MONICA', 'Calle 127 #15-20', 3281239876);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (743780861, 'DUVAN ALONSO', 'Carrera 9 #85-32', 3139876541);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (91125942, 'RICARDO MEZA', 'Avenida Boyacá #56-44', 3156781234);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (614893524, 'ANDRES LOZANO', 'Calle 24 #17-95', 3256789123);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (9345722521, 'DAVID RAMIREZ', 'Carrera 15 #80-22', 3107891234);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (749132302, 'SERGIO TORRES', 'Avenida 19 #152-34', 3189876543);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (180813631, 'CHRISTIAN CARDENAS', 'Calle 63 #40-22', 3271234567);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (5464640417, 'GUILLE BARROS', 'Carrera 14 #82-34', 3116782345);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (3372960960, 'MISAEL RAMIREZ', 'Calle 134 #15-05', 3245671234);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (455953722, 'OLME MARIN', 'Carrera 20 #44-38', 3199876543);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (85085706, 'ANDRES CONTRERAS', 'Carrera 50 #85-30', 3187654321);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (57551203, 'JUAN PABLO CHAVARRO', 'Calle 50 #25-65', 3227896541);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (65022668, 'EDUARDO SANDOVAL', 'Avenida El Dorado #103-20', 3161237894);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (567871329, 'DANIEL HERRERA', 'Calle 140 #14-25', 3256789123);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (5393384754, 'LUCIA MORALES', 'Carrera 15 #134-50', 3145678912);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (907629758, 'JAVIER RIOS', 'Calle 53 #70-80', 3162345687);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (320255010, 'PATRICIA SALAZAR', 'Carrera 24 #70-15', 3177654321);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (1162571604, 'MARTIN VALENZUELA', 'Avenida Chile #9-20', 3291236789);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (556195217, 'CLAUDIA SANCHEZ', 'Carrera 7 #50-30', 3193451234);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (54660223, 'GABRIEL PINEDA', 'Calle 100 #20-12', 3135436789);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (2206072000, 'ELENA CASTRO', 'Carrera 68C #85-60', 3201236547);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (1117383170, 'JOSE MENDOZA', 'Calle 80 #40-35', 3196549873);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (61099677, 'CAROLINA RUIZ', 'Carrera 10 #20-12', 3184561230);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (8389999110, 'FELIPE ARIAS', 'Calle 40 #30-22', 3127896541);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (815203698, 'JUAN VALENZUELA', 'Carrera 15 #118-60', 3109871234);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (51843672, 'DANIEL CASTRO', 'Calle 116 #45-20', 3173456781);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (7381987571, 'MARIANA ARROYO', 'Carrera 19 #82-40', 3265439871);
INSERT INTO Cliente (id_cliente, nombreCliente, direccion, telefono) VALUES (7209798794, 'CAMILO BENAVIDES', 'Avenida Caracas #50-12', 3171239874);

/***** HACIENDO LAS INSERCIONES CATEGORIA *****/
INSERT INTO Categoria (nombreCategoria) VALUES ('Almacenamiento');
INSERT INTO Categoria (nombreCategoria) VALUES ('Computadoras');
INSERT INTO Categoria (nombreCategoria) VALUES ('Memorias RAM');
INSERT INTO Categoria (nombreCategoria) VALUES ('Accesorios');
INSERT INTO Categoria (nombreCategoria) VALUES ('Pantallas y Baterías');

SELECT * FROM Producto;
/***** HACIENDO LAS INSERCIONES PRODUCTO *****/
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (10, 'UNIDAD DE ESTADO SOLIDO SSD SATA', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (18, 'T-FORCE VULCAN Z', 4);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (8, 'SSD CRUCIAL BX500 ', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (9, 'SSD LEXAR NS100', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (8, 'SSD TIMETEC ', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (10, 'SSD TIMETEC ', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (7, 'SSD SP A55', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (7, 'SSD SP A55', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (18, 'SSD SP A55', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (15, ' SSD M2 NVME', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (5, 'SSD M.2 NVME SAMSUNG EVO 980', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (8, ' SSD M.2 NVME SAMSUNG EVO 970 PLUS', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (5, 'SSD M.2 NVME SAMSUNG EVO 970 PLUS', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (11, 'SSD M.2 NVME CRUCIAL P2', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (16, 'SSD M.2 SATA NGFF 500GB WESTERN DIGITAL BLUE', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (15, 'SSD M.2 NVME WESTERN DIGITAL SN570', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (16, 'SSD M.2 NVME SABRENT ', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (12, 'Timetec MAC SSD NVMe PCIe Gen3x4 3D NAND TLC ', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (16, 'Timetec MAC SSD NVMe PCIe Gen3x4 3D NAND TLC ', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (10, 'BATERIAS PORTATILES', 5);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (10, 'MACBOOK AIR 11" M2012 - 2015', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (15, 'MACBOOK AIR 11" M2012 - 2015', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (16, 'MACBOOK AIR 13" M2012 - 2017 ', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (15, 'MACBOOK PRO 13" 2008 -2012', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (7, 'MACBOOK 12" 2015 -2017', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (15, 'MACBOOK 15" 2011', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (15, 'MACBOOK PRO RETINA 13" 2013 - 2015', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (12, 'MACBOOK PRO 13" 2016 - 2017', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (13, 'MACBOOK PRO R. 15" L  2013', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (11, 'MACBOOK PRO 13" 2018 - 2019', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (13, 'PANTALLAS', 5);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (13, 'IMAC 21.5 L2012', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (9, 'MEMORIA RAM SODIMM', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (12, 'DDR2 2GB KOMPUTER BAY PC 667 ', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (11, 'DDR3 HYNIX 1333', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (13, 'DDR3 SAMSUNG 1333 ', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (12, 'DDR3 SK HYNIX MAC 1600', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (9, 'DDR3 CORSAIR 1333', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (12, 'DDR3 HYNIX 1333', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (18, 'DDR3 HYNIX 1600 ', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (18, 'DDR3 HYNIX MAC 1600', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (14, 'DDR3 KIGNSTON -HP  1600', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (16, 'DDR3 OWC MAC 2010 - 2011 PC 1333', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (16, 'DDR4 SAMSUNG PC 2666 ', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (6, 'DDR4 CRUCIAL PC 2666', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (12, 'DDR4 MAC 2666', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (11, 'DDR4 SAMSUNG PC 3200', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (15, 'DDR4 Imac 2017 PC 2400 ', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (17, 'DDR3 8 GB KOMPUTER BAY PC1060 - 1333', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (13, 'DDR3 OWC IMAC L2015 PC 1867 ', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (9, 'DDR3 TIMETEC PARA MAC PC 1600L', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (6, 'DDR4 SAMSUNG PC 2400', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (6, 'DDR4 TIMETEC PARA Imac 2017 PC 2400 ', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (10, 'DDR4 OWC MAC 2018-2020 2666', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (14, 'DDR4 TEAMGROUP PC  3200 ', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (8, 'DDR4 TIMETEC PARA Imac  2019-2020 PC 2666 ', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (10, 'DDR4 TIMETEC PARA Imac 2017 PC 2400', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (15, 'DDR4 TIMETEC PARA Imac 2019 -2020 PC 2666', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (15, 'MEMORIA RAM PC', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (11, 'DDR3 PC 1600 TEAMGROUP', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (12, 'DDR3 PC 1333 KINGSTON ', 3);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (14, 'ACCESORIOS', 4);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (11, 'ADAPTADOR METAL SSD 2.5', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (9, 'CADDY DVD 9MM', 4);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (5, 'ADAPTADOR USB TIPO C HDMI, RJ45, USB A', 4);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (16, 'CAJA DISCO DURO ORINCO USB 3.O 2.5" ', 4);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (5, 'CAJA DISCO DURO XUE USB 3.5"', 4);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (13, 'CINTAS IMAC 21.5"', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (16, 'CINTAS IMAC 27"', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (9, 'ADAPTADOR HDMI - VGA', 4);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (7, 'CONVERTIDOR USB TIPOC A USB', 4);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (7, 'CABLE Y SATA', 4);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (9, 'T. RED USB TPLINK AC600', 4);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (11, 'ADAPTADOR SSD M.2 SATA SSK NGFF', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (11, 'ADAPTADOR SSD M.2 SATA SSK NVME', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (17, 'TECLADO MACBOOK AIR A1370 - A1465', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (12, 'TECLADO  A1278 CON 80 TORNILLOS INGLES', 4);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (6, 'TECLADO  MEETION IKEY K210', 4);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (7, 'CARGADOR MACSAFE 1', 4);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (14, 'CARGADOR MACSAFE 2', 4);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (7, 'ADAPTADOR SSD NVME M.2  AIR - PRO', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (13, 'PARLANTES A1278 MACBOOK PRO 2009-2012', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (17, 'LINTERNA LED RECARGABLE', 4);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (17, 'ADAPTADOR M2 NGFF MCBOOK 13-2017 SSD', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (6, 'ADAPTADOR MINI DISPLAY PORT - HDMI', 4);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (9, 'BATERIA PORTATIL TOSHBA', 5);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (18, 'ADAPTADOR SSD NVME MACBOOK PRO 2016 2017 ', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (13, 'FUENTE DE PODER ATX', 4);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (7, 'TOALLA MICRO FIBRA 12" X 12"', 4);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (5, 'CABLE SATA SSD HDD', 1);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (7, 'SOPORTES BASE IMAC 27¨', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (8, 'Adaptador de corriente USB C de 118 W', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (14, 'Cable de carga USB C a C', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (15, 'Cover Compatible with Apple iMac 21.5"', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (13, 'Cover Compatible with Apple iMac 27"', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (7, 'Ratón Bluetooth inalámbrico Bluetooth para iPad', 2);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (15, 'Harfoowo', 4);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (15, 'Cable MagSafe1', 4);
INSERT INTO Producto (stock, descripcion, id_categriaFK) VALUES (18, 'Cable MagSafe 2', 4);


/****** REGISTRANDO VENTAS *****/


INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-08-27', 3, 1771015132, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-30', 2, 140131907, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-08-21', 3, 1937850673, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-24', 4, 7054981938, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-03', 5, 94295614, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-25', 5, 284353151, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-08-09', 7, 31558083, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-16', 7, 730506542, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-09-17', 7, 183267071, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-10-02', 10, 3788189555, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-10-03', 11, 7061157361, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-27', 12, 5218037478, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-27', 13, 49767673, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-09-25', 14, 720609550, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-04', 15, 92640630, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-08-06', 16, 6779697364, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-30', 17, 34811317, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-09-10', 18, 29183787, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-05', 18, 161659308, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-08-06', 20, 21818428, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-10-03', 21, 6869837238, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-09-21', 21, 97358121, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-24', 23, 41493515, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-08-27', 24, 743780861, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-08-05', 25, 91125942, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-24', 26, 614893524, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-25', 27, 9345722521, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-18', 28, 749132302, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-03', 29, 180813631, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-27', 30, 5464640417, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-10-08', 31, 3372960960, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-04', 32, 455953722, 2);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-27', 33, 57551203, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-08-05', 34, 65022668, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-08', 35, 567871329, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-30', 36, 5393384754, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-09-17', 37, 907629758, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-08-27', 38, 320255010, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-03', 35, 1162571604, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-09-21', 40, 556195217, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-25', 41, 54660223, 2);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-09-25', 42, 2206072000, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-16', 43, 1117383170, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-18', 44, 61099677, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-27', 45, 8389999110, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-07-24', 46, 815203698, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-08-09', 47, 51843672, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-10-02', 48, 7381987571, 1);
INSERT INTO Venta (fecha_venta, id_productoFK, id_clienteFK, cantidad) VALUES ('2024-09-10', 49, 7209798794, 1);


/***** CONSULTA GENERAL *****/
SELECT *
FROM Categoria;

/***** SUBCONSULTAS *****/
-- Cliente con mayor cantidad de compra
SELECT nombreCliente 
FROM Cliente 
INNER JOIN Venta on Venta.id_clientefk = Cliente.id_cliente where Venta.cantidad>1;

-- Buscando productos que estén repetidos 
SELECT descripcion, COUNT(*)
FROM Producto
GROUP BY descripcion
HAVING COUNT(*) > 1;

-- Comparando la cantidad de productos en venta 
SELECT (SELECT COUNT(*) FROM Producto) AS total_productos,
       (SELECT COUNT(DISTINCT id_productoFK) FROM Venta) AS productos_vendidos;
       