/*
 *2 Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
 */

create database if not exists example;

mysql> create table if not exists users (
-> id INT NOT NULL AUTO_INCREMENT,  
-> name VARCHAR(100) NOT NULL,  
-> PRIMARY KEY ( id )    
-> );  


/*
 * 3. Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample
 */

> cd C:\Program Files\MySQL\MySQL Server 8.0\bin
> mysqldump.exe -u root -p example > sample.sql