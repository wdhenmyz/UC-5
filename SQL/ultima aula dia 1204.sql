-- função para contar o numero total de livros em uma biblioteca

create function fn_contar_livros(@cnpj nvarchar(14))
returns int
as
begin
	declare @total_livros int;
	select @total_livros = COUNT(*) from LIVRO_BIBLIOTECA
	where cnpj = @cnpj;
	return @total_livros
end

select dbo.fn_contar_livros('01234567000112') as total_livros

select * from LIVRO_BIBLIOTECA


--crie uma função para contar o total de funcionarios

alter function fn_contar_funcionarios()
returns int
as
begin
	declare @total_funcionarios int;
	select @total_funcionarios = COUNT(*) from FUNCIONARIO
	return @total_funcionarios
end

select dbo.fn_contar_funcionarios() as total_fucionarios

select * from FUNCIONARIO


--crie uma função que calcule a quantitade de eventos do tipo palestra

create function fn_eventos_palestra()
returns int
as
begin
	declare @eventos_palestra int;
	select @eventos_palestra = COUNT(*) from EVENTO
	where tipo = 'PALESTRA';
	return @eventos_palestra
end

select dbo.fn_eventos_palestra() as eventos_palestra

select * from EVENTO


alter function fn_numero_EventosTipo(@tipo nvarchar(30))
returns int
as
begin
	declare @total_evento int;
	select @total_evento = COUNT(*) from EVENTO
	where tipo = @tipo;
	return @total_evento
end

select dbo.fn_numero_EventosTipo('workshop') as quantidade