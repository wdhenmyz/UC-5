--criando um banco de dados
create database ifood;
--usando o banco de dados criado
use ifood;
--criando um tabela no ifood
-- Criando Banco de dados
create database ifood;
--Usando o banco de dados
use ifood;
--Criando uma tabela no ifood
create table cliente(
	nome nchar(50),
	cpf char(11) primary key,
	email nchar(50),
	telefone char(11),
	data_nascimento date,
	rua varchar(50),
	numero varchar(50),
	bairro varchar(50),
	cidade varchar(50),
	id_cliente int,
	id_pagamento int,
	id_endereco int,
);
create table produto(
	nome varchar(50),
	descricao varchar(100),
	preco float,
	id_produto int primary key
);
create table estabelecimento_pagamento(
	nome varchar(64),
	telefone char(13),
	endereco varchar(64),
	horario time,
	id_estabelecimento int primary key,
);

