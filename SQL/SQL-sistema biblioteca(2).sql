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


select * from LIVRO;
select * from LIVRO order by ano_publicacao;
select * from LIVRO order by ano_publicacao desc;
select * from LIVRO order by autor;

