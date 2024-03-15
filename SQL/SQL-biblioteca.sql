--criando banco de dados "biblioteca"
create database biblioteca;
--usando o banco de dados 
use biblioteca;

--criando tabelas
--tabela cliente
create table cliente(
	cod_cliente char(10) primary key,
	nome nvarchar(40),
	email nchar(50),
	telefone_1 char(11),
	telefone_2 char(11),
	rua varchar(25),
	bairro varchar(30),
	cidade varchar(30),
	estado varchar(30)
);

--classificando cliente em
create table pessoa_Fisica(
	cod_cliente char(10) primary key,
	rg char(6),
	cpf char(11),
	foreign key (cod_cliente) references cliente(cod_cliente)
);
--ou
create table pessoa_Juridica(
	cod_cliente char(10) primary key,
	cnpj char(14),
	ie varchar(14),
	foreign key (cod_cliente) references cliente(cod_cliente)
);

--criando tabela para informaçoes sobre os pedidos feitos
create table pedido(
	cod_pedido char(12) primary key,
	cod_cliente char(10),
	data date,
	valor_pedido decimal(7, 2),
	foreign key (cod_cliente) references cliente(cod_cliente)
);

--criando tabela para informaçoes sobre as editoras
create table editora(
	cod_editora char(9) primary key,
	telefone_1 char(11),
	telefone_2 char(11),
	nome_contato varchar(30),
	email nvarchar(40),
);

--criando tabela para informaçoes sobre os livros possuidos
create table livro(
	cod_livro char(18) primary key,
	cod_editora char(9),
	valor decimal(5,2),
	ano_publicacao date,
	categoria text,
	titulo text,
	autor nvarchar(40),
	foreign key (cod_editora) references editora(cod_editora)
);

--criando tabela para informaçoes sobre o estoque de livros
create table estoque(
	cod_editora char(9),
	cod_livro char(18),
	qtde_estoque int,
	foreign key (cod_editora) references editora(cod_editora),
	foreign key (cod_livro) references livro(cod_livro),
);

--criando tabela auxiliar para relacionar os items/livros com os pedidos
create table item_pedido(
	cod_pedido char(12),
	cod_livro char(18),
	foreign key (cod_livro) references livro(cod_livro),
	foreign key (cod_pedido) references pedido(cod_pedido),
);

insert into cliente(
	cod_cliente,
	nome ,
	email ,
	telefone_1 ,
	telefone_2 ,
	rua ,
	bairro,
	cidade,
	estado
)
values 
('7890000123','ful ano','meu@email.com','44912345678','44987654321','cirian','aqulele','tal','consta'),
('8884567000','cic ano','aura@email.com','55912345678','55987654321','cirian','aqulele','tal','consta'),
('0000000123','fulano','meu@email.com','44912345678','44987654321','cirian','aqulele','tal','consta'),
('1234567000','cicrano','aura@email.com','55912345678','55987654321','cirian','aqulele','tal','consta');


insert into pessoa_Fisica(
	cod_cliente,
	rg,
	cpf
)
values ('0000000123','333333','12345678933')

insert into pessoa_Juridica(
	cod_cliente,
	cnpj,
	ie
)
values ('1234567000','XXXXXXXXYYYYZZ','12.345.678-9')

insert into pedido(
	cod_pedido,
	cod_cliente,
	data,
	valor_pedido
)
values 
('112233445566','0000000123','2022-03-13','5000'),
('225577998800','1234567000','2022-03-13','6000');

insert into editora(
	cod_editora,
	telefone_1,
	telefone_2,
	nome_contato,
	email
)
values ('123456789','22944445555','22933338888','editora lux-auria','lux@email.com')

insert into livro(
	cod_livro,
	cod_editora,
	valor,
	ano_publicacao,
	categoria,
	titulo,
	autor
)
values ('12321123212','123456789','400','2003-03-12','ação','aventuras sortudas','criante')

insert into estoque(
	cod_editora,
	cod_livro,
	qtde_estoque
)
values ('123456789','12321123212','20')

insert into item_pedido(
	cod_pedido,
	cod_livro
)
values
('112233445566','12321123212'),
('225577998800','12321123212');



select * from cliente
select * from pessoa_Fisica
select * from pessoa_Juridica
select * from pedido
select * from editora
select * from livro
select * from estoque
select * from item_pedido



exec sp_rename 'pessoa_Juridica.id', 'ie','COLUMN';

-- busca por atributo
select nome from cliente;
select cod_pedido from pedido;
select nome_contato from editora;

--buscar por algo em especifico
select * from cliente where cod_cliente = '1234567000';

--buscar dados específicos usando caractere curinga
select * from cliente where nome like 'C%';
select * from cliente where nome like 'f%';

--buscar por sobrenome do aluno
select * from cliente where nome like '%ano';

--oredenação de valores
select * from cliente order by nome;

--consultar todos clientes em uma tabela especifica: com nome da table.
select cliente.nome
from cliente
join pessoa_Fisica on cliente.cod_cliente = pessoa_Fisica.cod_cliente;

select cliente.nome
from cliente
join pessoa_Juridica on cliente.cod_cliente = pessoa_Juridica.cod_cliente;

--consultar todos clientes em uma tabela especifica: de forma simplificada.
select c.nome
from cliente c      --tabela cliente passou a ser "c"
join pessoa_Fisica pF on c.cod_cliente = pF.cod_cliente;

select c.nome
from cliente c
join pessoa_Juridica pJ on c.cod_cliente = pJ.cod_cliente;

--contagem de valores
select * from cliente
select count(*) as total_clientes from cliente;

