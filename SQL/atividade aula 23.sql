use sistema_biblioteca;


--1. Retornar todos os livros de sociologia.
SELECT * FROM LIVRO 
join sociologia on SOCIOLOGIA.numero_registro  = livro.numero_registro;

SELECT * FROM LIVRO where numero_registro > 17 and numero_registro < 34;


--2. Listar os nomes dos funcionários que são bibliotecários.
SELECT nome FROM FUNCIONARIO where matricula like 'B%';

SELECT nome FROM BIBLIOTECARIO;

select FUNCIONARIO.nome from FUNCIONARIO
join BIBLIOTECARIO on
FUNCIONARIO.matricula = BIBLIOTECARIO.matricula;


--3. Exibir os títulos dos livros publicados antes de 2000.
SELECT titulo FROM Livro WHERE Ano_Publicacao < 2000;


--4. Mostrar o número total de livros em cada biblioteca.
select cnpj,COUNT(*) as total_livro
from LIVRO_BIBLIOTECA
group by cnpj

select * from LIVRO_BIBLIOTECA
join LIVRO on LIVRO.numero_registro = LIVRO_BIBLIOTECA.numero_registro
--where cnpj = '01234567000112'

insert into LIVRO_BIBLIOTECA
values
('01234567000112',1),
('01234567000112',2),
('01234567000112',3),
('01234567000112',4),
('01234567000112',5),
('01234567000112',6),
('01234567000112',7),
('01234567000112',8),
('01234567000112',9),
('01234567000112',10),
('01234567000112',11),
('01234567000112',12),
('01234567000112',13),
('01234567000112',14),
('01234567000112',15),
('01234567000112',16),
('01234567000112',17),
('12345678000123',18),
('12345678000123',19),
('12345678914789',20),
('12345678914789',21),
('12345678914789',22),
('12345678914789',23),
('12345678914789',24),
('12345678914789',25),
('12345678914789',26),
('23456789000134',27),
('23456789000134',28),
('23456789000134',29),
('23456789000134',30),
('23456789000134',31),
('23456789000134',32),
('23456789000134',33),
('23456789000134',34),
('34567890000145',35),
('34567890000145',36),
('34567890000145',37),
('45678901000156',38),
('45678901000156',39),
('45678901000156',40),
('45678901000156',41),
('45678901000156',42),
('56789012000167',43),
('56789012000167',44),
('56789012000167',45),
('56789012000167',46),
('45678901000156',47),
('45678901000156',48),
('45678901000156',49),
('45678901000156',50);




DELETE FROM LIVRO_BIBLIOTECA WHERE numero_registro >= 1

--5. Listar os eventos do tipo 'Workshop' que ocorreram após 2020.
SELECT * FROM EVENTO where
tipo = 'Workshop'
and year(data) > 2020;


--6. Exibir os nomes dos usuários que fizeram empréstimos de livros em janeiro de 2023.
SELECT nome FROM usuario
join EMPRESTIMO on EMPRESTIMO.usuario = usuario.id_usuario
where year(data_emprestimo) = 2023 and MONTH(data_emprestimo) = 01

select * from EMPRESTIMO


--7. Retornar os títulos dos livros de tecnologia que têm 'Python' no título.
SELECT titulo FROM Livro where Titulo LIKE '%Python%';

SELECT titulo FROM Livro
join TECNOLOGIA on livro.numero_registro = TECNOLOGIA.numero_registro
where Titulo LIKE '%Python%';


--8. Listar os títulos dos periódicos disponíveis na biblioteca com CNPJ '12345678000123'.
SELECT titulo FROM PERIODICO
join PERIODICO_BIBLIOTECA on PERIODICO_BIBLIOTECA.numero_registro  = PERIODICO.numero_registro
where CNPJ = '12345678000123';


--9. Mostrar os nomes dos funcionários que não são técnicos de TI.
SELECT nome FROM FUNCIONARIO where matricula not like 'T00%';

select * from FUNCIONARIO
where matricula not in (
	select matricula from TECNICO_TI
);


--9.1 todos os livros que não são de tecnologia
SELECT * FROM Livro
where numero_registro not in (
	select numero_registro from TECNOLOGIA 
);


--10.Exibir o título e o autor dos livros emprestados pelo usuário com ID 'U0001'.
select titulo, autor from LIVRO
join EMPRESTIMO on EMPRESTIMO.livros = livro.numero_registro
where usuario = 'U0001'


--11.Listar todas as palestras que custaram mais de R$ 100,00.
SELECT * FROM EVENTO where
tipo = 'PALESTRA' and custo > 100.00;

SELECT * FROM EVENTO 
join PALESTRA on EVENTO.id_evento = PALESTRA.id_evento
where custo > 100.00;


--12.Retornar os títulos dos livros de ciência que foram publicados após 2010.
SELECT * FROM LIVRO 
join CIENCIA on CIENCIA.numero_registro  = livro.numero_registro
WHERE Ano_Publicacao > 2010;


--13.Exibir os nomes dos atendentes que têm 'Maria' no nome.
SELECT * FROM ATENDENTE where nome like '%maria%'


--14.Mostrar os títulos dos livros que foram emprestados mais de 5 vezes.
select * from EMPRESTIMO

select LIVRO.titulo, COUNT(titulo) as total_emprestimo from LIVRO
join EMPRESTIMO on LIVRO.numero_registro = EMPRESTIMO.livros
where (select COUNT(*) from EMPRESTIMO where livro.numero_registro = EMPRESTIMO.livros) >= 1
group by titulo


--15.Listar os nomes dos usuários que emprestaram livros de tecnologia.
SELECT * FROM usuario
join EMPRESTIMO on EMPRESTIMO.usuario = usuario.id_usuario
where livros < 18



--16.Exibir os eventos do tipo palestra que ocorreram  em 2022.
select * from EVENTO where 
tipo = 'palestra' and year(data) = 2022;


--17.Retornar os títulos dos periódicos que têm 'Saúde' no título.
SELECT * FROM PERIODICO where titulo like '%saúde%';
SELECT titulo FROM PERIODICO where titulo like '%saúde%';


--18.Listar os nomes dos estagiários que começam com a letra 'L'.
SELECT * FROM ESTAGIARIO where nome like 'l%';
SELECT nome FROM ESTAGIARIO where nome like 'l%';


--19.Mostrar os títulos dos livros de sociologia que foram publicados nos anos 90.
SELECT titulo FROM LIVRO 
join sociologia on SOCIOLOGIA.numero_registro  = livro.numero_registro
WHERE ano_publicacao > 1900 and Ano_Publicacao < 2000 ;


--20.Exibir os títulos dos livros e os nomes dos autores dos livros emprestados em fevereiro de 2023.

CREATE VIEW vm_livros_emprestados
as
select titulo, autor from LIVRO
join EMPRESTIMO on EMPRESTIMO.livros = livro.numero_registro
where year(data_emprestimo) = 2023 and MONTH(data_emprestimo) = 02;

select * from vm_livros_emprestados;

select * from LIVRO
join EMPRESTIMO on EMPRESTIMO.livros = livro.numero_registro
where year(data_emprestimo) = 2023 and MONTH(data_emprestimo) = 02











--calcule a media de preços dos eventos do tipo workshop
create view media_preco_workshop
as
SELECT round(avg(custo),2) AS media_preco FROM EVENTO
where tipo = 'workshop'
--join WORKSHOP on WORKSHOP.id_evento = EVENTO.id_evento

select * from media_preco_workshop

-- soma de todos os eventos que aconteceram apartis de 2022
select round(sum(custo),2) as soma_preco
from EVENTO
where year(data) >= 2022


count  --contar
avg    --média
sum    --soma



--criando procedimento para listar fucionarios
CREATE PROCEDURE sp_Listar_funcionarios
AS
BEGIN
    SELECT * FROM FUNCIONARIO;
END;

exec sp_Listar_funcionarios;

--crie uma procedure que retorna todos os livros de tecnologia
CREATE PROCEDURE sp_livros_tecnologia
AS
BEGIN
    SELECT * FROM Livro
	join TECNOLOGIA on livro.numero_registro = TECNOLOGIA.numero_registro;
END;

exec sp_livros_tecnologia;

--criar um procedimento para buscar um livro pelo nome
CREATE PROCEDURE sp_buscar_livros
	@titulo nvarchar(100)
AS
BEGIN
    SELECT * FROM Livro where titulo like @titulo+;
END;

exec sp_buscar_livros @titulo = '%python%'

create PROCEDURE sp_buscar_livros_concatenado
	@titulo nvarchar(100)
AS
BEGIN
    SELECT * FROM Livro where titulo like '%'+@titulo+'%';
END;

exec sp_buscar_livros_concatenado @titulo = python

/*
crie uma procedure que retorna todos os livros do ano(2016)
*/
CREATE PROCEDURE sp_buscar_livros_ano
	@ano nvarchar(6)
AS
BEGIN
    SELECT * FROM LIVRO 
	WHERE Ano_Publicacao = @ano;
END;

exec sp_buscar_livros_ano @ano = 2016

-- crie uma procedure que filtra os livros de tecnologia por ano
CREATE PROCEDURE sp_livros_tecnologia_ano
	@ano nvarchar(6)
AS
BEGIN
    SELECT * FROM LIVRO 
	join TECNOLOGIA on livro.numero_registro = TECNOLOGIA.numero_registro
	WHERE Ano_Publicacao = @ano;
END;

exec sp_livros_tecnologia_ano @ano = 2015

-- criar procedure para inserir registro de funcionario
CREATE PROCEDURE sp_InserirFuncionarios
	@matricula nvarchar(6),
	@nome nvarchar(50)
AS
BEGIN
    insert into FUNCIONARIO (matricula, nome)
	values (@matricula, @nome);
END;

exec sp_InserirFuncionarios @matricula = 'TI0202', @nome = 'Manuel Gomes'

--criar procedure para inserir registro de funcionario do tipo educador
CREATE PROCEDURE sp_InserirFuncionario_educador
	@matricula nvarchar(6),
	@nome nvarchar(50)
AS
BEGIN
    insert into FUNCIONARIO (matricula, nome)
	values (@matricula, @nome)

	insert into EDUCADOR(matricula, nome)
	values (@matricula, @nome)
END;

exec sp_InserirFuncionario_educador @matricula='ED0203', @nome='João Gomes'

SELECT * FROM FUNCIONARIO 
join EDUCADOR on FUNCIONARIO.matricula = EDUCADOR.matricula






create table USUARIO(
	id_usuario char(5) primary key,
    Nome VARCHAR(50) NOT NULL,
);


create table ENDERECO(
	id_endereco INT IDENTITY(1,1) PRIMARY KEY,
	cidade varchar(20),
	rua varchar(20),
	bairro varchar(20),
);

create table EMPRESTIMO(
	id_emprestimos INT IDENTITY(1,1) PRIMARY KEY,
	livros int,
	usuario char(5),
	endereco int,
	data_emprestimo date,
	data_devolucao date,
	FOREIGN KEY (endereco) REFERENCES ENDERECO(id_endereco),
	FOREIGN KEY (livros) REFERENCES livro(numero_registro),
	FOREIGN KEY (usuario) REFERENCES usuario(id_usuario)
);


select * from EMPRESTIMO
select * from ENDERECO
select * from USUARIO
select * from LIVRO

insert into USUARIO
values
('U0001','carlon anon'),
('U0002','carbas'),
('U0003','cabriu')


insert into ENDERECO
values
('barão','ari','tão-tão'),
('barão','ero','distante'),
('barão','pou','caramba')









--1. Criar uma procedure para inserir um registro de funcionário do tipo educador, recebendo nome e matrícula como parâmetros.(FEITO)
CREATE PROCEDURE sp_InserirFuncionario_educador
	@matricula nvarchar(6),
	@nome nvarchar(50)
AS
BEGIN
    insert into FUNCIONARIO (matricula, nome)
	values (@matricula, @nome)

	insert into EDUCADOR(matricula, nome)
	values (@matricula, @nome)
END;

exec sp_InserirFuncionario_educador @matricula='ED0203', @nome='João Gomes'

--2. Criar uma procedure para listar os livros de uma categoria específica, recebendo o nome da categoria como parâmetro.(FEITO)
CREATE PROCEDURE sp_livros_ciencia
AS
BEGIN
    SELECT * FROM LIVRO 
	join CIENCIA on livro.numero_registro = CIENCIA.numero_registro;
END;

exec sp_livros_ciencia

--3. Criar uma procedure para obter os nomes dos funcionários de um determinado cargo, recebendo o cargo como parâmetro. (FEITO)
CREATE PROCEDURE sp_funcionarios_ATENDENTES
AS
BEGIN
    SELECT * FROM FUNCIONARIO
	join ATENDENTE on FUNCIONARIO.matricula = ATENDENTE.matricula;
END;

EXEC sp_funcionarios_ATENDENTES

--4. Criar uma procedure para exibir os títulos dos livros publicados antes de um ano específico, recebendo o ano como parâmetro. (FEITO)
create procedure sp_livros_anteriores_a
	@ano char(4)
as
begin
	SELECT titulo FROM Livro 
	WHERE Ano_Publicacao < @ano;
end;

exec sp_livros_anteriores_a @ano = 2020

--5. Criar uma procedure para contar o número total de livros em uma biblioteca específica, recebendo o CNPJ da biblioteca como parâmetro. (MESMA DA 15)
create procedure sp_numeroLivros
	@cnpj nvarchar(14)
as
begin
	select count(*) as total_livro from LIVRO
	join LIVRO_BIBLIOTECA on LIVRO.numero_registro = LIVRO_BIBLIOTECA.numero_registro
	where cnpj = @cnpj
end;

exec sp_numeroLivros @cnpj = '12345678000123'

DROP PROCEDURE sp_CalcularLivros_biblioteca

--6. Criar uma procedure para listar os eventos de um tipo específico que aconteceram após um ano determinado, recebendo o tipo de evento e o ano como parâmetros. (FEITO)
CREATE PROCEDURE sp_EventosPorAno
	@ano nvarchar (30),
	@tipo nvarchar (30)
AS
BEGIN
    SELECT * FROM EVENTO
	where year(data) > @ano 
	and tipo = @tipo ;
END;

exec sp_EventosPorAno @ano = 2020, @tipo = 'workshop'

--7. Criar uma procedure para mostrar os nomes dos usuários que fizeram empréstimos de livros em um mês e ano específicos, recebendo o mês e o ano como parâmetros. (FEITO)
alter PROCEDURE sp_empréstimos_mês_ano
	@ano int,
	@mes int
as
begin
	select Nome from USUARIO
	join EMPRESTIMO on usuario.id_usuario = EMPRESTIMO.usuario
	where year(data_emprestimo) = @ano and MONTH(data_emprestimo) = @mes;
end;

exec sp_empréstimos_mês_ano @ano = 2023, @mes = 01 

--8. Criar uma procedure para encontrar os títulos dos livros de uma categoria específica que contenham uma palavra-chave no título, recebendo a categoria e a palavrachave como parâmetros. (FEITO)
create procedure sp_LIVRO_sociologia_chave
	@palavra_chave nvarchar (30)
as
begin
	SELECT * from LIVRO
	join SOCIOLOGIA on SOCIOLOGIA.numero_registro  = livro.numero_registro
	where titulo like '%'+@palavra_chave+'%';
end;

EXEC sp_LIVRO_sociologia_chave @palavra_chave = 'casa'

--9. Criar uma procedure para listar os títulos dos periódicos disponíveis em uma biblioteca específica, recebendo o CNPJ da biblioteca como parâmetro. (FEITO)
create procedure sp_periodicos_biblioteca
	@cnpj nvarchar(14)
as
begin
	SELECT titulo FROM PERIODICO
	join PERIODICO_BIBLIOTECA on PERIODICO_BIBLIOTECA.numero_registro = PERIODICO.numero_registro
	where CNPJ = @cnpj;
end;

exec sp_periodicos_biblioteca @cnpj = 12345678000123

--10.Criar uma procedure para exibir o título e o autor dos livros emprestados por um usuário específico, recebendo o ID do usuário como parâmetro. (FEITO)
create procedure sp_emprestimo_usuario
	@usuario char (5)
as
begin
	select titulo, autor from LIVRO
	join EMPRESTIMO on EMPRESTIMO.livros = livro.numero_registro
	where usuario = @usuario;
end;

exec sp_emprestimo_usuario @usuario = U0001

drop procedure sp_emprestimo_usuario

--11.Criar uma procedure para inserir um registro de funcionário do tipo educador, recebendo nome e matrícula como parâmetros. (FEITO)
CREATE PROCEDURE sp_InserirFuncionario_educador
	@matricula nvarchar(6),
	@nome nvarchar(50)
AS
BEGIN
    insert into FUNCIONARIO (matricula, nome)
	values (@matricula, @nome)

	insert into EDUCADOR(matricula, nome)
	values (@matricula, @nome)
END;

exec sp_InserirFuncionario_educador @matricula='ED0203', @nome='João Gomes'

--12.Criar uma procedure para listar os livros de uma categoria específica, recebendo o nome da categoria como parâmetro. (FEITO)
create procedure sp_LIVRO_ciencia
as
begin
	SELECT * from LIVRO
	join CIENCIA on CIENCIA.numero_registro  = livro.numero_registro
end;

exec sp_LIVRO_ciencia

--13.Criar uma procedure para obter os nomes dos funcionários de um determinado cargo, recebendo o cargo como parâmetro. (confusão) (igual a 3)
create procedure sp_funcionario_cargo
	@cargo nvarchar (7)
as
begin
	select * from FUNCIONARIO
	where matricula = @cargo;
end;

exec sp_funcionario_cargo @cargo = A
drop procedure sp_funcionario_cargo
 
--14.Criar uma procedure para exibir os títulos dos livros publicados antes de um ano específico, recebendo o ano como parâmetro. (mesmo da 4)
create procedure sp_livros_anteriores_a
	@ano char(4)
as
begin
	SELECT titulo FROM Livro WHERE Ano_Publicacao < @ano;
end;

exec sp_livros_anteriores_a @ano = 2020

--15.Criar uma procedure para contar o número total de livros em uma biblioteca específica, recebendo o CNPJ da biblioteca como parâmetro.(FEITO)
create procedure sp_numeroLivros
	@cnpj nvarchar(14)
as
begin
	select COUNT(*) as total_livro from LIVRO
	join LIVRO_BIBLIOTECA on LIVRO.numero_registro = LIVRO_BIBLIOTECA.numero_registro
	where cnpj = @cnpj
end;

exec sp_numeroLivros @cnpj = '01234567000112'
drop procedure sp_numeroLivros

--16.Criar uma procedure para listar os eventos de um tipo específico que aconteceram após um ano determinado, recebendo o tipo de evento e o ano como parâmetros. (FEITO)
create procedure sp_evento_TipoAno
	@tipo nvarchar (30),
	@ano char (4)
as
begin
	select * from EVENTO where 
	tipo = @tipo and year(data) > @ano;
end;

exec sp_evento_TipoAno @tipo = 'workshop', @ano = 2010
drop procedure sp_evento_TipoAno

--17.Criar uma procedure para mostrar os nomes dos usuários que fizeram empréstimos de livros em um mês e ano específicos, recebendo o mês e o ano como parâmetros. (FEITO)
create procedure sp_usuarios_emprestimos
	@mes char(2),
	@ano char(4)
as
begin
	SELECT Nome FROM usuario
	join EMPRESTIMO on EMPRESTIMO.usuario = usuario.id_usuario
	where year(data_emprestimo) = @ano and MONTH(data_emprestimo) = @mes;
end;

exec sp_usuarios_emprestimos @ano = 2023, @mes = 01

--18.Criar uma procedure para encontrar os títulos dos livros de uma categoria específica que contenham uma palavra-chave no título, recebendo a categoria e a palavrachave como parâmetros. (confusão)
create procedure
as
begin

end;



--19.Criar uma procedure para listar os títulos dos periódicos disponíveis em uma biblioteca específica, recebendo o CNPJ da biblioteca como parâmetro. (FEITO)
create procedure sp_PeriodicosBiblioteca
	@cnpj nvarchar (14)
as
begin
	SELECT titulo FROM PERIODICO
	join PERIODICO_BIBLIOTECA on PERIODICO_BIBLIOTECA.numero_registro  = PERIODICO.numero_registro
	where CNPJ = @cnpj;
end;

exec sp_PeriodicosBiblioteca @cnpj = 12345678000123

--20.Criar uma procedure para exibir o título e o autor dos livros emprestados por um usuário específico, recebendo o ID do usuário como parâmetro. (MESMA DA 10)
create procedure sp_emprestimo_usuario
	@usuario char (5)
as
begin
	select titulo, autor from LIVRO
	join EMPRESTIMO on EMPRESTIMO.livros = livro.numero_registro
	where usuario = @usuario;
end;

exec sp_emprestimo_usuario @usuario = U0001


