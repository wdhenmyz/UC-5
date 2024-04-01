use sistema_biblioteca;


--1. Retornar todos os livros de sociologia.
SELECT * FROM LIVRO where numero_registro > 17 and numero_registro < 34;
SELECT * FROM LIVRO 
join sociologia on SOCIOLOGIA.numero_registro  = livro.numero_registro;


--2. Listar os nomes dos funcionários que são bibliotecários.
SELECT nome FROM FUNCIONARIO where matricula like 'B%';
SELECT nome FROM BIBLIOTECARIO;


--3. Exibir os títulos dos livros publicados antes de 2000.
SELECT titulo FROM Livro WHERE Ano_Publicacao < 2000;


--4. Mostrar o número total de livros em cada biblioteca.
SELECT count(*) FROM LIVRO
join LIVRO_BIBLIOTECA on LIVRO_BIBLIOTECA.numero_registro = LIVRO.numero_registro


insert into LIVRO_BIBLIOTECA
values
('01234567000112',1),
('01234567000112',2),
('01234567000112',3),
('01234567000112',4),
('01234567000112',5);



--5. Listar os eventos do tipo 'Workshop' que ocorreram após 2020.
SELECT * FROM EVENTO where
tipo = 'Workshop'
and year(data) > 2020;


--6. Exibir os nomes dos usuários que fizeram empréstimos de livros em janeiro de 2023.
SELECT nome FROM usuario
join EMPRESTIMO on EMPRESTIMO.usuario = usuario.id_usuario
where year(data_emprestimo) = 2023 and MONTH(data_emprestimo) = 01



--7. Retornar os títulos dos livros de tecnologia que têm 'Python' no título.
SELECT titulo FROM Livro where Titulo LIKE '%Python%';


--8. Listar os títulos dos periódicos disponíveis na biblioteca com CNPJ '12345678000123'.
SELECT * FROM PERIODICO
join PERIODICO_BIBLIOTECA on PERIODICO_BIBLIOTECA.numero_registro  = PERIODICO.numero_registro
where CNPJ = '12345678000123';


--9. Mostrar os nomes dos funcionários que não são técnicos de TI.
SELECT nome FROM FUNCIONARIO where matricula not like 'T00%';


--10.Exibir o título e o autor dos livros emprestados pelo usuário com ID 'U0001'.
select titulo, autor from LIVRO
join EMPRESTIMO on EMPRESTIMO.livros = livro.numero_registro
where usuario = 'U0001'



--11.Listar todas as palestras que custaram mais de R$ 100,00.
SELECT * FROM EVENTO where
tipo = 'PALESTRA' and custo > 100.00;


--12.Retornar os títulos dos livros de ciência que foram publicados após 2010.
SELECT * FROM LIVRO 
join CIENCIA on CIENCIA.numero_registro  = livro.numero_registro
WHERE Ano_Publicacao > 2010;


--13.Exibir os nomes dos atendentes que têm 'Maria' no nome.
SELECT * FROM ATENDENTE where nome like '%maria%'


--14.Mostrar os títulos dos livros que foram emprestados mais de 5 vezes.





--15.Listar os nomes dos usuários que emprestaram livros de tecnologia.
SELECT * FROM usuario
join EMPRESTIMO on EMPRESTIMO.usuario = usuario.id_usuario
where livros < 18



--16.Exibir os eventos do tipo palestra que ocorreram  em 2022.
select * from EVENTO where 
tipo = 'palestra' and year(data) = 2022;


--17.Retornar os títulos dos periódicos que têm 'Saúde' no título.
SELECT * FROM PERIODICO where titulo like '%saúde%';


--18.Listar os nomes dos estagiários que começam com a letra 'L'.
SELECT * FROM ESTAGIARIO where nome like 'l%';


--19.Mostrar os títulos dos livros de sociologia que foram publicados nos anos 90.
SELECT titulo FROM LIVRO 
join sociologia on SOCIOLOGIA.numero_registro  = livro.numero_registro
WHERE Ano_Publicacao < 2000;


--20.Exibir os títulos dos livros e os nomes dos autores dos livros emprestados em fevereiro de 2023.
select * from LIVRO
join EMPRESTIMO on EMPRESTIMO.livros = livro.numero_registro
where year(data_emprestimo) = 2023 and MONTH(data_emprestimo) = 02








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