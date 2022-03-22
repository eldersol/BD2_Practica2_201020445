DROP DATABASE db_practica2;

create database if not exists db_practica2;

use db_practica2;

create table Practica2 (
	dpi INT PRIMARY KEY,
	nombre VARCHAR(50),
	email VARCHAR(50),
	genero VARCHAR(50)
);


################## FULL BACKUP  ######################################
#CONFIGURAR EL BINARYLOG
Ver binario
	show global variables like '%log_bin%';
	show binary logs;
	cd C:\ProgramData\MySQL\MySQL Server 8.0
	nano my.ini


#AGREGAR LAS SIGUIENTES 3 LINEAS
[mysqld]
log_bin				= /var/log/mysql/mysql-bin.log
expire_logs_days		= 10

Backup
	mysqldump -u admin -p db_practica2 > full_dia1.sql
	mysqldump -u admin -p db_practica2 > full_dia2.sql
	mysqldump -u admin -p db_practica2 > full_dia3.sql
	mysqldump -u admin -p db_practica2 > full_dia4.sql
	mysqldump -u admin -p db_practica2 > full_dia5.sql


################## INCREMENTAL ######################################

Guardar registros
	flush logs;
	
Crear backup incremental
	#C:\ProgramData\MySQL\MySQL Server 8.0\Data
	mysqlbinlog DESKTOP-LP8DVRK-bin.000001 > incremental_dia1.sql
	mysqlbinlog DESKTOP-LP8DVRK-bin.000002 > incremental_dia2.sql
	mysqlbinlog DESKTOP-LP8DVRK-bin.000003 > incremental_dia3.sql
	mysqlbinlog DESKTOP-LP8DVRK-bin.000004 > incremental_dia4.sql
	mysqlbinlog DESKTOP-LP8DVRK-bin.000005 > incremental_dia5.sql
	


Capturas
	use db_practica2;
	SELECT * FROM Practica2 LIMIT 10
	SELECT * FROM Practica2 ORDER BY dpi DESC LIMIT 10


Restaurar full
	mysql -u admin -p db_practica2 < full_dia1.sql	1
	mysql -u admin -p db_practica2 < full_dia2.sql	2
	mysql -u admin -p db_practica2 < full_dia3.sql	4
	mysql -u admin -p db_practica2 < full_dia4.sql	5
	mysql -u admin -p db_practica2 < full_dia5.sql  6
	
Capturas
	SELECT * FROM Practica2 LIMIT 10
	SELECT * FROM Practica2 ORDER BY dpi DESC LIMIT 10
	
	
	
	
	
Restaurar incremental
	mysql -u admin -p db_practica2 < incremental_dia1.sql

Capturas
	SELECT * FROM Practica2 LIMIT 10
	SELECT * FROM Tabla ORDER BY Practica2 DESC LIMIT 10