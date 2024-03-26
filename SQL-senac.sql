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
	horario time,
	nome varchar(20),
	numero_alunos int,
	foreign key (id_instituicao) references instituicao(id_instituicao)
);

create table curso_TEC(
	id_curso_TEC int identity(1,1) primary key,
	nome VARCHAR(30),
    area VARCHAR(40),
    horario_inicio TIME,
    horario_fim TIME,
    dia_semana VARCHAR(20),
	id_curso int
	foreign key (id_curso) references curso(id_curso)
)

create table TEC_DES_SISTEMAS(
	id_TEC_DES_SISTEMAS int identity(1,1) primary key,
	id_curso int
	foreign key (id_curso) references curso(id_curso)
)

create table curso_livre(
	id_curso_livre INT identity(1,1) PRIMARY KEY,
    nome VARCHAR(40),
    descricao TEXT,
    duracao_horas INT,
    horario_inicio TIME,
    horario_fim TIME,
    dia_semana VARCHAR(20),
	id_curso int
	foreign key (id_curso) references curso(id_curso)
)

create table idiomas(
	id_curso_idiomas int identity(1,1) primary key,
	nome VARCHAR(20),
    nivel VARCHAR(20),
    horario_inicio TIME,
    horario_fim TIME,
    dia_semana VARCHAR(20),
	id_curso int,
	id_idioma_ingles int,
	id_idioma_espanhol int,
	id_idioma_alemao int,
	id_idioma_frances int,
	id_idioma_italiano int,
	foreign key (id_curso) references curso(id_curso)
	foreign key (id_idioma_ingles) references curso(id_idioma_ingles)
	foreign key (id_idioma_espanhol) references curso(id_idioma_espanhol)
	foreign key (id_idioma_alemao) references curso(id_idioma_alemao)
	foreign key (id_idioma_frances) references curso(id_idioma_frances)
	foreign key (id_idioma_italiano ) references curso(id_idioma_italiano )
)

create table idioma_ingles(
	id_idioma_ingles int identity(1,1) primary key,
	id_curso_idiomas int,
	foreign key (id_curso_idiomas) references idiomas(id_curso_idiomas)
)


create table idioma_espanhol(
	id_idioma_espanhol int identity(1,1) primary key,
	id_curso_idiomas int
	foreign key (id_curso_idiomas) references idiomas(id_curso_idiomas)
)


create table idioma_alemao(
	id_idioma_alemao int identity(1,1) primary key,
	id_curso_idiomas int
	foreign key (id_curso_idiomas) references idiomas(id_curso_idiomas)
)


create table idioma_frances(
	id_idioma_frances int identity(1,1) primary key,
	id_curso_idiomas int
	foreign key (id_curso_idiomas) references idiomas(id_curso_idiomas)
)


create table idioma_italiano(
	id_idioma_italiano int identity(1,1) primary key,
	id_curso_idiomas int
	foreign key (id_curso_idiomas) references idiomas(id_curso_idiomas)
)


create table uc(
	id_uc int identity(1,1) primary key,
	id_curso int,
	data_inicio date,
	data_termino date,
	nome varchar(9),
	foreign key (id_curso) references curso(id_curso)
);

create table turma(
	id_turma int identity(1,1) primary key,
	id_uc int,
	id_curso int,
	nome varchar(9)
	foreign key (id_curso) references curso(id_curso),
	foreign key (id_uc) references uc(id_uc)
);

ALTER TABLE curso ADD nome VARCHAR(20)
ALTER TABLE curso ADD id_professor int
foreign key (id_professor) references professor(id_professor);
ALTER TABLE uc ADD nome VARCHAR(9)
ALTER TABLE turma ADD nome VARCHAR(9)
UPDATE curso SET nome = 'informática' WHERE id_curso = 1
UPDATE uc SET nome = 'uc-4' WHERE id_uc = 1
UPDATE turma SET nome = '1003' WHERE id_turma = 2



-- criando tabela funcionario
create table funcionario(
	id_funcionario int identity(1,1) primary key,
	nome varchar (50) not null,
	telefone char(11),
	email varchar(50) unique,
	cpf char(11) unique,
	data_nascimento date,
	salario int
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

ALTER TABLE funcionario ADD salario int
update funcionario set salario = '2200' where id_funcionario = 1
update funcionario set salario = '2500' where id_funcionario = 2
update funcionario set salario = '3000' where id_funcionario = 3
update funcionario set salario = '2900' where id_funcionario = 4




-- criando tabela aluno
create table aluno(
	id_aluno int identity(1,1) primary key,
	nome varchar (50) not null,
	telefone char(11),
	email varchar(50) unique,
	cpf char(11) unique,
	data_nascimento date,
	data_matricula date,
	genero varchar (2)
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
values('84966666666','aabbbccc0001ab','senac zona sul')

insert into curso(
	id_instituicao,
	data_inicio,
	data_termino,
	horario,
	nome
)
values
('2','20000103','20020105','8:00:00','TEC_DES_SISTEMAS')

UPDATE curso SET data_termino = '20000603' WHERE id_curso = 2
UPDATE curso SET data_termino = '20000403' WHERE id_curso = 3
UPDATE curso SET data_termino = '20000503' WHERE id_curso = 4
UPDATE curso SET data_termino = '20000303' WHERE id_curso = 5
UPDATE curso SET data_termino = '20000503' WHERE id_curso = 6

insert into TEC_DES_SISTEMAS(
	id_curso
)
values('7')
select * from TEC_DES_SISTEMAS


insert into idiomas(
	nome ,
    nivel ,
    horario_inicio,
    horario_fim ,
    dia_semana,
	id_curso
)
values
('inglês','médio','13:00:00','17:00:00','S,T,Q,Q,S','2')

insert into idiomas(
	nome ,
    nivel ,
    horario_inicio,
    horario_fim ,
    dia_semana,
	id_curso
)
values
('espanhol','médio','8:00:00','12:00:00','S,T,Q,Q,S','3')

insert into idiomas(
	nome ,
    nivel ,
    horario_inicio,
    horario_fim ,
    dia_semana,
	id_curso
)
values
('alemão','médio','8:00:00','12:00:00','S,T,Q,Q,S','4')

insert into idiomas(
	nome ,
    nivel ,
    horario_inicio,
    horario_fim ,
    dia_semana,
	id_curso
)
values
('francês','médio','8:00:00','12:00:00','S,T,Q,Q,S','5')

insert into idiomas(
	nome ,
    nivel ,
    horario_inicio,
    horario_fim ,
    dia_semana,
	id_curso
)
values
('italiano','médio','13:00:00','17:00:00','S,T,Q,Q,S','6')

select * from idiomas

insert into idioma_alemao(
	id_curso_idiomas
)
values ('1')
insert into idioma_espanhol(
	id_curso_idiomas
)
values ('2')
insert into idioma_frances(
	id_curso_idiomas
)
values ('3')
insert into idioma_ingles(
	id_curso_idiomas
)
values ('4')
insert into idioma_italiano(
	id_curso_idiomas
)
values ('5')

select * from idioma_alemao
select * from idioma_espanhol
select * from idioma_frances
select * from idioma_ingles
select * from idioma_italiano

UPDATE idiomas SET id_idioma_espanhol = NULL WHERE id_curso_idiomas = 2;
UPDATE idiomas SET id_idioma_frances = NULL WHERE id_curso_idiomas = 2;
UPDATE idiomas SET id_idioma_italiano = NULL WHERE id_curso_idiomas = 2;
UPDATE idiomas SET id_idioma_ingles = NULL WHERE id_curso_idiomas = 2;





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

ALTER TABLE curso add numero_alunos int
ALTER TABLE curso add numero_vagas int
ALTER TABLE curso add valor int
UPDATE curso SET numero_vagas = '25' WHERE id_curso = 1
UPDATE curso SET numero_vagas = '30' WHERE id_curso = 2
UPDATE curso SET numero_vagas = '30' WHERE id_curso = 3
UPDATE curso SET numero_vagas = '30' WHERE id_curso = 4
UPDATE curso SET numero_vagas = '35' WHERE id_curso = 5
UPDATE curso SET numero_vagas = '40' WHERE id_curso = 6
UPDATE curso SET numero_vagas = '40' WHERE id_curso = 7
UPDATE curso SET id_professor = '1' WHERE id_curso = 1
UPDATE curso SET id_professor = '1' WHERE id_curso = 7

UPDATE curso SET numero_alunos = '20' WHERE id_curso = 1
UPDATE curso SET numero_alunos = '12' WHERE id_curso = 2
UPDATE curso SET numero_alunos = '23' WHERE id_curso = 3
UPDATE curso SET numero_alunos = '22' WHERE id_curso = 4
UPDATE curso SET numero_alunos = '33' WHERE id_curso = 5
UPDATE curso SET numero_alunos = '35' WHERE id_curso = 6
UPDATE curso SET numero_alunos = '40' WHERE id_curso = 7

UPDATE curso SET valor = '570' WHERE id_curso = 1
UPDATE curso SET valor = '300' WHERE id_curso = 2
UPDATE curso SET valor = '300' WHERE id_curso = 3
UPDATE curso SET valor = '300' WHERE id_curso = 4
UPDATE curso SET valor = '300' WHERE id_curso = 5
UPDATE curso SET valor = '300' WHERE id_curso = 6
UPDATE curso SET valor = '9000' WHERE id_curso = 7


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

ALTER TABLE funcionario add horario time
ALTER TABLE funcionario add data_contratacao date


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



UPDATE funcionario SET horario = '7:00:00' WHERE id_funcionario = 1
UPDATE funcionario SET horario = '7:00:00' WHERE id_funcionario = 2
UPDATE funcionario SET horario = '7:00:00' WHERE id_funcionario = 3
UPDATE funcionario SET horario = '7:00:00' WHERE id_funcionario = 4


UPDATE funcionario SET data_contratacao = '20240125' WHERE id_funcionario = 1
UPDATE funcionario SET data_contratacao = '20231125' WHERE id_funcionario = 2
UPDATE funcionario SET data_contratacao = '20231205' WHERE id_funcionario = 3
UPDATE funcionario SET data_contratacao = '20230104' WHERE id_funcionario = 4

ALTER TABLE funcionario add genero varchar(2)
UPDATE funcionario SET genero = 'M' WHERE id_funcionario = 1
UPDATE funcionario SET genero = 'F' WHERE id_funcionario = 2
UPDATE funcionario SET genero = 'F' WHERE id_funcionario = 3
UPDATE funcionario SET genero = 'M' WHERE id_funcionario = 4


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
('onde','84966667777','were@email.com','23232344455','20030404','20091001'),
('esta','84990876543','is@email.com','66677788890','20050922','20011001');


insert into aprendiz(
	id_aluno
)
values('5')
insert into pagante(
	id_aluno
)
values
('9'),
('8')
insert into PSG(
	id_aluno
)
values('7')

select * from aluno
select * from aprendiz
select * from pagante
select * from PSG


select * from instituicao

ALTER TABLE aluno add genero varchar(2)
UPDATE aluno SET genero = 'F' WHERE id_aluno = 5
UPDATE aluno SET genero = 'M' WHERE id_aluno = 6
UPDATE aluno SET genero = 'M' WHERE id_aluno = 7
UPDATE aluno SET genero = 'F' WHERE id_aluno = 8
UPDATE aluno SET genero = 'F' WHERE id_aluno = 9







--------------------
-- dados de endereco
select * from endereco

insert into endereco(
	cidade,
	bairro,
	rua,
	id_instituicao
)
values('para','pa pa pa','bam','3')

insert into endereco(
	cidade,
	bairro,
	rua,
	id_aluno 
)
values
('parada','das','bondes','8'),
('bem','alimentado','senhor','9');

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

select * from endereco


------------------------
-- atualizando enderecos das tabelas
UPDATE instituicao SET id_endereco = 11 WHERE id_instituicao = 3;
UPDATE aluno SET id_endereco = 2 WHERE id_aluno = 5;
UPDATE aluno SET id_endereco = 3 WHERE id_aluno = 6;
UPDATE aluno SET id_endereco = 4 WHERE id_aluno = 7;
UPDATE aluno SET id_endereco = 9 WHERE id_aluno = 8;
UPDATE aluno SET id_endereco = 10 WHERE id_aluno = 9;
UPDATE funcionario SET id_endereco = 5 WHERE id_funcionario = 1;
UPDATE funcionario SET id_endereco = 6 WHERE id_funcionario = 2;
UPDATE funcionario SET id_endereco = 7 WHERE id_funcionario = 3;
UPDATE funcionario SET id_endereco = 8 WHERE id_funcionario = 4;





1) select * from funcionario
2) SELECT curso.nome, curso.numero_alunos
   FROM curso
3) select * from funcionario ORDER BY salario desc
7) select nome from curso where numero_alunos = null
9) select horario from curso
10) select * from aluno WHERE nome LIKE 'a%'
11) select * from funcionario
	select * from funcionario where data_contratacao >= '20230325'
12) select curso.numero_alunos,curso.nome from curso where id_curso = 7
13) select * from curso ORDER BY numero_vagas
16) select * from curso where data_inicio >= '20000101'
17) SELECT COUNT (*) FROM aluno WHERE genero = 'F';
19) SELECT * FROM curso
	WHERE numero_alunos = (
    SELECT MAX(numero_alunos)
    FROM curso
); 




















