use sistema_biblioteca

-- quest�o 1 (confus�o)
select * from LIVRO_BIBLIOTECA where cnpj = '12345678000123';


--quest�o 2 (feito)
select FUNCIONARIO.nome
from FUNCIONARIO
join BIBLIOTECARIO on FUNCIONARIO.matricula = BIBLIOTECARIO.matricula;


--quest�o 3 (feito)
select * from livro where numero_registro = 10
select titulo,autor from livro where numero_registro = 10


--quest�o 4 (feito)
select * from EVENTO where tipo = 'workshop' and custo > 150.00;


--quest�o 5 (feito)
select * from livro where numero_registro < 18


--quest�o 6 (feito)
select FUNCIONARIO.nome
from FUNCIONARIO
join ATENDENTE on FUNCIONARIO.matricula = ATENDENTE.matricula;


--quest�o 7  (feito)
select * from PERIODICO where ano_publicacao = 2023


--quest�o 8 (feito)
select * from livro 
where numero_registro > 18
and numero_registro < 38


--quest�o 9 (feito)
select * from EDUCADOR


--quest�o 10 (feito)
select * from PERIODICO where titulo like 'c%';


--quest�o 11 (feito)
select * from EVENTO 
where tipo = 'palestra' 
and year(data) < 2022


--quest�o 12 (confus�o)
select * from LIVRO order by ano_publicacao;



--quest�o 13 (feito)
select nome from TECNICO_TI where nome like 'Rodrigo%';


--quest�o 14 (feito)
select * from FUNCIONARIO where matricula like 'AS000%'


--quest�o 15 (feito)
select * from LIVRO where titulo like 'Programa��o%';


--quest�o 16 (feito)
select * from PERIODICO where titulo like 'Sa�de%';


--quest�o 17 (feito)
select nome from FUNCIONARIO where matricula like 'G000%' 
and nome like 'c%' 


--quest�o 18 (feito)
select * from LIVRO
where ano_publicacao >= 2010
and ano_publicacao <= 2020


--quest�o 19 (feito)
select * from FUNCIONARIO 
where matricula like 'ES000%' 
and nome like '%lima' 

