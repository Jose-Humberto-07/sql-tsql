/* ____   ___  _       ____  _____ ______     _______ ____  
  / ___| / _ \| |     / ___|| ____|  _ \ \   / / ____|  _ \ 
  \___ \| | | | |     \___ \|  _| | |_) \ \ / /|  _| | |_) |
   ___) | |_| | |___   ___) | |___|  _ < \ V / | |___|  _ < 
  |____/ \__\_\_____| |____/|_____|_| \_\ \_/  |_____|_| \_\ */ 

--Aula Extra 005 | FUNCTIONs

create function dbo.MultiplicaPorDois(@valor as int)
returns int
as
begin

	if @valor is null return null;

	declare @Numero int;
	select @Numero = @valor * 2;

	return @Numero;

end;

drop function dbo.MultiplicaPorDois;

select dbo.MultiplicaPorDois(100) as Total;

---------------------------------------
--Calculo de Imposto
--Valor da Ordem de Serviço * 12%
---------------------------------------

create function dbo.CalculaImposto(@valor as money)
returns money
as
begin

	if @valor is null return null;

	declare @Numero money;
	select @Numero = @valor * 0.12;

	return @Numero;

end;

drop function dbo.CalculaImposto;

select dbo.CalculaImposto(1230) Imposto;

select * from dbo.tbOrdemServico;

select lower(cliente), cidade, servico, valor_os, dbo.CalculaImposto(valor_os) imposto,
       valor_os - dbo.CalculaImposto(valor_os) Liquido
  from dbo.tbOrdemServico;

----------------------------------------------------------
--Conversão de caracteres para Primeira Letra em maiúscula
----------------------------------------------------------

select nome, UPPER(LEFT(nome,1)) + LOWER(RIGHT(nome, LEN(nome) -1)) NomeTrabalhado
  from dbo.Alunos n;

--Criar função
--------------
create function dbo.PrimeiraMaiuscula(@Texto as varchar(8000))
returns varchar(8000)
as 
begin

	if @Texto is null return null;

	declare @CheckTexto bit;
	declare @Retorno varchar(8000);
	declare @i int;
	declare @c char(1);

	select @CheckTexto = 1, @i = 1, @Retorno='';

	while (@i <= len(@Texto))
		
		select @c = substring(@Texto, @i, 1),
		@Retorno = @Retorno + CASE WHEN @CheckTexto = 1 then UPPER(@c) ELSE LOWER(@c) end,
		@CheckTexto  = CASE WHEN @c like '[a-zA-Z]' then 0 else 1 end,
		@i = @i + 1
       
	return @Retorno

end;

select dbo.PrimeiraMaiuscula('alessandro trovato de andrade');

select dbo.PrimeiraMaiuscula(cliente) as cliente,
       cidade, uf,
	   dbo.PrimeiraMaiuscula(mecanico) as mecanico,
	   dbo.CalculaImposto(valor_os) as imposto
  from dbo.tbOrdemServico;

  select
      case when 'a' like '[1-9]'
	       then 'Faz parte da range de caracteres'
		   else 'Não faz parte' end Tipo;