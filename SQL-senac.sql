-- criar banco
create database senac;
-- usar banco senac
use senac;
-- criando tabela senac
create table instituicao(
	id_instituicao int identity(1,1) primary key,
	telefone char(11),
	cnpj char(14),
	nome varchar(30)
);

create table curso(
	id_curso int identity(1,1) primary key,
	id_instituicao int,
	data_inicio date,
	data_termino date,
	horario time
	foreign key (id_instituicao) references instituicao(id_instituicao)
);

create table uc(
	id_uc int identity(1,1) primary key,
	id_curso int,
	data_inicio date,
	data_termino date,
	foreign key (id_curso) references curso(id_curso)
);

create table turma(
	id_turma int identity(1,1) primary key,
	id_uc int,
	id_curso int,
	foreign key (id_curso) references curso(id_curso),
	foreign key (id_uc) references uc(id_uc)
);



-- criando tabela funcionario
create table funcionario(
	id_funcionario int identity(1,1) primary key,
	nome varchar (50) not null,
	telefone char(11),
	email varchar(50) unique,
	cpf char(11) unique,
	data_nascimento date
);

create table contrato(
	id_contrato int identity(1,1) primary key,
	id_funcionario int,
	id_instituicao int,
	foreign key (id_funcionario) references funcionario(id_funcionario),
	foreign key (id_instituicao) references instituicao(id_instituicao)
);

create table porteiro(
	id_porteiro int identity(1,1) primary key,
	id_funcionario int,
	foreign key (id_funcionario) references funcionario(id_funcionario)
);

create table professor(
	id_professor int identity(1,1) primary key,
	id_funcionario int,
	foreign key (id_funcionario) references funcionario(id_funcionario)
);

create table ASG(
	id_ASG int identity(1,1) primary key,
	id_funcionario int,
	foreign key (id_funcionario) references funcionario(id_funcionario)
);

create table pedagogo(
	id_pedagogo int identity(1,1) primary key,
	id_funcionario int,
	foreign key (id_funcionario) references funcionario(id_funcionario)
);



-- criando tabela aluno
create table aluno(
	id_aluno int identity(1,1) primary key,
	nome varchar (50) not null,
	telefone char(11),
	email varchar(50) unique,
	cpf char(11) unique,
	data_nascimento date,
	data_matricula date
);

create table aprendiz(
	id_aprendiz int identity(1,1) primary key,
	id_aluno int,
	foreign key (id_aluno) references aluno(id_aluno)
);

create table pagante(
	id_pagante int identity(1,1) primary key,
	id_aluno int,
	foreign key (id_aluno) references aluno(id_aluno)
);

create table PSG(
	id_PSG int identity(1,1) primary key,
	id_aluno int,
	foreign key (id_aluno) references aluno(id_aluno)
);



-- criando tabela endereco
create table endereco(
	id_endereco int identity(1,1) primary key,
	cidade varchar(30),
	bairro varchar(30),
	rua varchar(30),
	id_instituicao int,
	id_aluno int,
	id_funcionario int,
	foreign key (id_aluno) references aluno(id_aluno),
	foreign key (id_funcionario) references funcionario(id_funcionario),
	foreign key (id_instituicao) references instituicao(id_instituicao),
);


--adicionar a coluna "endereco" como "foreing key"
ALTER TABLE aluno ADD id_endereco int
foreign key (id_endereco) references endereco(id_endereco);

ALTER TABLE funcionario ADD id_endereco int
foreign key (id_endereco) references endereco(id_endereco);

ALTER TABLE instituicao ADD id_endereco int
foreign key (id_endereco) references endereco(id_endereco);






