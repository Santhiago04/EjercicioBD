/*Creacion y habilitacion BD*/
create database tienda;
use tienda;

/*Creacion de tablas*/
create table usuario(
idUsuario int auto_increment primary key,
numOrdenFK int not null
);
alter table usuario drop column numOrdenFK;
describe usuario;

create table venta(
numOrden int primary key ,
idUsuarioFK int not null,
idClienteFK int not null,
idVentas int auto_increment unique
);

create table ventaProducto(
codigoBarrasFk varchar(20) not null,
numOrdenFK int not null, 
cantidad int,
total int
);

create table producto(
idProducto int auto_increment unique,
codigoBarras varchar(20) primary key,
stock int,
precioProducto int
);

create table cliente(
idCliente int auto_increment primary key
);



/*Relaciones*/
alter table venta
add constraint FKidUsuario
foreign key(idUsuarioFK)
references usuario(idUsuario);

alter table venta 
add constraint FKidCliente
foreign key(idClienteFK)
references cliente(idCliente);

alter table ventaProducto
add constraint FKcodBarras
foreign key(codigoBarrasFK)
references producto(codigoBarras);

alter table ventaProducto
add constraint FKnumOrden
foreign key(numOrdenFK)
references venta(numOrden);

/*Insert*/
insert into cliente values('');
insert into cliente values('');
insert into cliente values('');
insert into cliente values('');

insert into usuario values('');
insert into usuario values('');
insert into usuario values('');
insert into usuario values('');

insert into venta values(1, 1, 1, '');
insert into venta values(2, 2, 2, '');
insert into venta values(3, 3, 3, '');
insert into venta values(4, 4, 4, '');

insert into producto values('', 'jsenvkkale', 34, 24000);
insert into producto values('', 'ekpaklfkek', 7, 18500);
insert into producto values('', 'vscomecoa', 82, 110000);
insert into producto values('', 'plllecllm', 1, 8000);










