DROP DATABASE db_practica2;

create database if not exists db_practica2;

use db_practica2;

create table Practica2 (
	dpi INT PRIMARY KEY,
	nombre VARCHAR(50),
	email VARCHAR(50),
	genero VARCHAR(50)
);

insert into Practica2 (dpi, nombre, email, genero) values ('777', 'Prueba1', 'prueba1@.com', 'Male');

mysqldump -u admin -p db_practica2 > full_prueba.sql

flush binary logs;

insert into Practica2 (dpi, nombre, email, genero) values ('888', 'Prueba2', 'prueba1@.com', 'Male');

flush binary logs;
mysqlbinlog DESKTOP-LP8DVRK-bin.000002 > prueba1.sql

DROP DATABASE db_practica2;
create database if not exists db_practica2;

mysql -u admin -p -o db_practica2 < full_prueba.sql
use db_practica2;
select *from Practica2

mysql -u admin -p db_practica2 < prueba1.sql

use db_practica2;
SELECT * FROM Practica2