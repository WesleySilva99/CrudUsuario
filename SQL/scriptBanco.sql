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
	numero varchar(13),
	tipo varchar(7),
	ddd varchar(4)
);

create table usuario_telefone(
	id_usuario int,
	id_telefone int,
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
	FOREIGN KEY (id_telefone) REFERENCES telefones(id)
);
