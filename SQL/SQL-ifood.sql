-- Criando Banco de dados
create database ifood_manha;
--Usando o banco de dados
use ifood_manha;
--Criando uma tabela no ifood
create table cliente(
	nome nchar(50),
	cpf char(11) primary key,
	email nchar(50),
	telefone char(11),
	data_nascimento date,
	rua varchar(25),
	numero varchar(9),
	bairro varchar(30),
	cidade varchar(30),
	id_pagamento varchar(10),
	id_endereco int,
);

create table produto(
	nome varchar(50),
	descricao varchar(100),
	preco float(),
	id_produto int primary key
);

create table estabelecimento(
	nome varchar(64),
	telefone char(13),
	endereco varchar(64),
	horario time,
	id_estabelecimento int primary key,
);

create table pedido(
	data datetime,
	id_produto int,
	id_estabelecimento int,
	cpf char(11),
	id_pedido int primary key,
	status text,
	foreign key (id_produto) references produto(id_produto),
	foreign key (id_estabelecimento) references estabelecimento(id_estabelecimento),
	foreign key (cpf) references cliente(cpf),
);


create table inventario(
	id_produto int,
	id_estabelecimento int,
	quant_produto int,
	foreign key (id_produto) references produto(id_produto),
	foreign key (id_estabelecimento) references estabelecimento(id_estabelecimento),
);

create table pagamento(
	id_pedido int,
	foreign key (id_pedido) references pedido(id_pedido),
	valor nvarchar(10),
	cpf char(11),
	id_pagamento int,
	foreign key (cpf) references cliente(cpf),
);

create table pix(
	id_pix int primary key,
	cnpj char(14),
	cpf char(11),
	telefone char(11),
	email nvarchar(30),
	foreign key (cpf) references cliente(cpf)
);

create table dinheiro_fisico(
	id_dinheiroFisico int primary key,
	cpf char(11),
	foreign key (cpf) references cliente(cpf)
);

create table cartao(
	id_cartao int primary key,
);

create table cartaoCredito(
	id_cartaoCredito int primary key,
	id_cartao int
	foreign key (id_cartao) references cartao(id_cartao)
);

create table cartaoDebito(
	id_cartaoDebito int primary key,
	id_cartao int
	foreign key (id_cartao) references cartao(id_cartao)
);

create table entregador(
	id_entregador int primary key,
	id_pedido int,
	nome nvarchar(30),
	foreign key (id_pedido) references pedido(id_pedido)
);

create table carro(
	id_carro int primary key,
	modelo varchar(20),
	placa char(7),
	cor text
);

create table moto(
	id_moto int primary key,
	modelo varchar(20),
	placa char(7),
	cor text
);

create table bicicleta(
	id_bicilcleta int primary key,
	modelo varchar(20),
	cor text
);



insert into produto(
	nome,
	descricao,
	preco,
	id_produto
)
values ('flor','petalas vermelhas, pequena', 10.00 ,'4000001');

insert into cliente(
	nome,
	cpf,
	email,
	telefone,
	data_nascimento,
	rua,
	numero,
	bairro,
	cidade,
	id_pagamento,
	id_endereco
)
values ('fulano','12345679','meu@email.com','84912345678','10/01/2000','rua tal','2345','bairro cicrano','cidade quero','1232132','2354564');

insert into estabelecimento(
	nome,
	telefone, 
	endereco, 
	horario, 
	id_estabelecimento 
)
values ('estabelecimento A','33190876543','rua z, cidade x, bairro a, 32165467', '8:00:00','1098976545');

insert into cartao(
	id_cartao 
)
values (123456784);

insert into carro(
	id_carro,
	modelo,
	placa,
	cor
)
values ('2948934','volkis','PKL1234','vermelho');

insert into moto(
	id_moto,
	modelo,
	placa,
	cor
)
values('1234567','yamaha','ymh1234','azul');

insert into bicicleta(
	id_bicilcleta,
	modelo,
	cor
)
values ('1928376','monark','preto');

insert into pedido(
	data,
	id_produto,
	id_estabelecimento,
	cpf,
	id_pedido,
	status
)
values ('2024-03-12 09:30:00','4000001','1098976545','12345679','123456789','enviando');

insert into inventario(
	id_produto,
	id_estabelecimento,
	quant_produto
)
values('4000001','1098976545','100')

insert into pagamento(
	id_pedido,
	valor,
	cpf,
	id_pagamento
)
values('123456789','258.50','12345679','987456123')

insert into pix(
	id_pix,
	cnpj,
	cpf,
	telefone,
	email
)
values ('1092983','09876543212345','12345678912','84912345678','meu@email.com')

insert into dinheiro_fisico(
	id_dinheiroFisico,
	cpf
)
values ('432165879','12345678912')

insert into cartaoCredito(
	id_cartaoCredito,
	id_cartao
)
values ('8890123','123456784')

insert into cartaoDebito(
	id_cartaoDebito,
	id_cartao
)
values ('8890334','123456784')

insert into entregador(
	id_entregador,
	id_pedido,
	nome
)
values ('233245678','123456789','aruano')



select * from produto
select * from cliente
select * from estabelecimento
select * from cartao
select * from carro
select * from moto
select * from bicicleta
select * from pedido
select * from inventario
select * from pagamento
select * from pix
select * from dinheiro_fisico
select * from cartaoCredito
select * from cartaoDebito
select * from entregador




--alterar o nome da tabela
exec sp_rename 'cliente', 'pessoa';

--alterar o nome das tabelas
exec sp_rename 'cliente.id_endereco', 'CEP','COLUMN';

--alterar os registros, alterando o nome do aluno usando o seu respectivo cpf
UPDATE cliente
set nome = 'arian'
where cpf= '12345678912';

-- .bak