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

ALTER TABLE instituicao ALTER COLUMN Nome varchar (30) not null





-- inserindo dados da instituicao
insert into instituicao(
	telefone,
	cnpj,
	nome	
)
values('84912345678','xxyyyzzz0001ab','senac zona norte')

insert into curso(
	id_instituicao,
	data_inicio,
	data_termino,
	horario 
)
values('2','20000103','20020105','13:00:00')

insert into uc(
	id_curso,
	data_inicio,
	data_termino
)
values('1','20000303','20000428')

insert into turma(
	id_uc,
	id_curso
)
values('1','1')

select * from instituicao
select * from curso
select * from uc
select * from turma



------------------------
-- dados de funcionarios
insert into funcionario(
	nome,
	telefone,
	email,
	cpf,
	data_nascimento 
)
values
('bam','84911111111','bam@horas.com','12347789500','20020101')


insert into contrato(
	id_funcionario,
	id_instituicao
)
values 
('1','2'),
('2','2'),
('3','2'),
('4','2')
select * from contrato

insert into professor(
	id_funcionario
)
values('1')
insert into pedagogo(
	id_funcionario
)
values('2')
insert into ASG(
	id_funcionario
)
values('3')
insert into porteiro(
	id_funcionario
)
values('4')
select * from professor
select * from pedagogo
select * from ASG
select * from porteiro





-------------------
-- dados de alunos
insert into aluno(
	nome,
	telefone,
	email,
	cpf,
	data_nascimento,
	data_matricula
)
values 
('aria','84900112233','aria@email.com','11111111100','20031001','20091001'),
('are','84932111234','are@email.com','22222222200','20061001','20121001'),
('ori','84988889999','ori@email.com','33333333300','20051001','20011001');


insert into aprendiz(
	id_aluno
)
values('5')
insert into pagante(
	id_aluno
)
values('6')
insert into PSG(
	id_aluno
)
values('7')

select * from aprendiz
select * from pagante
select * from PSG


select * from instituicao
select * from aluno
select * from funcionario


--------------------
-- dados de endereco
select * from endereco

insert into endereco(
	cidade,
	bairro,
	rua,
	id_instituicao
)
values('tal','aquele','strata','2')

insert into endereco(
	cidade,
	bairro,
	rua,
	id_aluno 
)
values
('tal','aquele','ara','5'),
('tal','aquele','bora','6'),
('tal','aquele','ora','7');

insert into endereco(
	cidade ,
	bairro ,
	rua,
	id_funcionario
)
values
('tal','bombom','tão','1'),
('tal','boes','bom','2'),
('tal','aass','de','3'),
('tal','eve','comer','4');


------------------------
-- atualizando enderecos das tabelas
UPDATE instituicao SET id_endereco = 1 WHERE id_instituicao = 2;
UPDATE aluno SET id_endereco = 2 WHERE id_aluno = 5;
UPDATE aluno SET id_endereco = 3 WHERE id_aluno = 6;
UPDATE aluno SET id_endereco = 4 WHERE id_aluno = 7;
UPDATE funcionario SET id_endereco = 5 WHERE id_funcionario = 1;
UPDATE funcionario SET id_endereco = 6 WHERE id_funcionario = 2;
UPDATE funcionario SET id_endereco = 7 WHERE id_funcionario = 3;
UPDATE funcionario SET id_endereco = 8 WHERE id_funcionario = 4;





