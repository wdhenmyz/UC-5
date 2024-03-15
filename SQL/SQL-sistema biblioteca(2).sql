-- usando banco de dados
use sistema_biblioteca;

-- mostrando todos os funcionarios
select * from FUNCIONARIO;

-- mostrando todos atendentes
select * from ATENDENTE;

select * from FUNCIONARIO order by nome;
select * from FUNCIONARIO where nome like 'ca%';
select count(*) as total_funcionario from FUNCIONARIO;
select * from FUNCIONARIO where nome like '%silva';

select FUNCIONARIO.nome
from FUNCIONARIO
join ESTAGIARIO on FUNCIONARIO.matricula = ESTAGIARIO.matricula;

-- mostrando todos os livros
select * from LIVRO;
select * from LIVRO order by ano_publicacao;
select * from LIVRO order by ano_publicacao desc;
select * from LIVRO order by autor;

--selecionar todos os livros com ano de publicação acima de 2018
select * from livro where ano_publicacao > 2018;
--titulo do livro onde o autor começa com paulo
select * from LIVRO where autor like 'paulo%';
select titulo from LIVRO where autor like 'paulo%';
--mostre todos os livros que são de tecnologia
select * from livro where numero_registro < 18;
select livro.titulo
from LIVRO
join tecnologia on TECNOLOGIA.numero_registro = livro.numero_registro;

-- retornar o tipo da coluna
select column_name, data_type
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'livro';

-- mostrar a tabela de eventos
select * from EVENTO;
select * from EVENTO where custo > 100.00;
select * from EVENTO where tipo = 'palestra' and custo > 100.00;

select * from EVENTO 
where tipo = 'palestra' 
and custo > 100.00 
and year(data) > 2022
