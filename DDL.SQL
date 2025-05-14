DROP DATABASE IF EXISTS Consultas;
create database Consultas;
use Consultas;

create table fabricante(
codigo int auto_increment not null PRIMARY KEY,
nombre varchar(100)
);

create table Producto(
codigo int auto_increment not null PRIMARY KEY, 
nombre varchar(100),
precio double,
codigo_fabricante int
);
alter table Producto 
add constraint CF foreign key(codigo_fabricante)references fabricante(codigo);


