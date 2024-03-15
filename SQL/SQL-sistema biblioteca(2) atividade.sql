use sistema_biblioteca

-- questão 1 (confusão)
select * from LIVRO_BIBLIOTECA where cnpj = '12345678000123';


--questão 2 (feito)
select FUNCIONARIO.nome
from FUNCIONARIO
join BIBLIOTECARIO on FUNCIONARIO.matricula = BIBLIOTECARIO.matricula;


--questão 3 (feito)
select * from livro where numero_registro = 10
select titulo,autor from livro where numero_registro = 10


--questão 4 (feito)
select * from EVENTO where tipo = 'workshop' and custo > 150.00;


--questão 5 (feito)
select * from livro where numero_registro < 18


--questão 6 (feito)
select FUNCIONARIO.nome
from FUNCIONARIO
join ATENDENTE on FUNCIONARIO.matricula = ATENDENTE.matricula;


--questão 7  (feito)
select * from PERIODICO where ano_publicacao = 2023


--questão 8 (feito)
select * from livro 
where numero_registro > 18
and numero_registro < 38


--questão 9 (feito)
select * from EDUCADOR


--questão 10 (feito)
select * from PERIODICO where titulo like 'c%';


--questão 11 (feito)
select * from EVENTO 
where tipo = 'palestra' 
and year(data) < 2022


--questão 12 (confusão)
select * from LIVRO order by ano_publicacao;



--questão 13 (feito)
select nome from TECNICO_TI where nome like 'Rodrigo%';


--questão 14 (feito)
select * from FUNCIONARIO where matricula like 'AS000%'


--questão 15 (feito)
select * from LIVRO where titulo like 'Programação%';


--questão 16 (feito)
select * from PERIODICO where titulo like 'Saúde%';


--questão 17 (feito)
select nome from FUNCIONARIO where matricula like 'G000%' 
and nome like 'c%' 


--questão 18 (feito)
select * from LIVRO
where ano_publicacao >= 2010
and ano_publicacao <= 2020


--questão 19 (feito)
select * from FUNCIONARIO 
where matricula like 'ES000%' 
and nome like '%lima' 

