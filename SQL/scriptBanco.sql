create database crudUsuario;

use crudUsuario;

create table usuarios(
	id int primary key auto_increment,
	nome varchar(255),
	email varchar(255),
	senha varchar(255)
);

create table telefones(
	id int primary key auto_increment,
	id_usuario int,
	telefone varchar(13),
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);
