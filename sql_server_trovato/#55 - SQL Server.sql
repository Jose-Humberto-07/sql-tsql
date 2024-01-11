--Aula 01 - Functions SQL Server
--Função para remover espaços de
--strings
--------------------------------
USE SQL_DB_1;
GO

CREATE TABLE trovato.tb01_Nomes (
	NOMES nvarchar(100) NOT NULL
);
GO

drop table trovato.tb01_nomes;
truncate table trovato.tb01_nomes;

select count(*) as total from trovato.tb01_nomes;

DROP FUNCTION Trovato.fn_01_RemoverEspaços;

-- FUNÇÃO REMOVER_ESPAÇOS

CREATE FUNCTION Trovato.fn_01_RemoverEspaços(@Texto as varchar(100))
returns varchar(100)
as 
begin

	if @Texto is null return null;

	--Declaração das variáveis
	--------------------------
	declare @NovoTexto      varchar(100);
	declare @cont           bit;

	--Inicializar as variáveis
	--------------------------
	select @NovoTexto = @Texto;

	--Remover caracteres à esquerda
	-------------------------------
	set @NovoTexto = LTRIM(@NovoTexto);
	set @NovoTexto = RTRIM(@NovoTexto);
	
	while charindex('  ', @NovoTexto) > 0
	begin
		set @NovoTexto = replace(@NovoTexto, '  ', ' ');
	end

	return @NovoTexto;

end;

select trovato.fn_01_RemoverEspaços(nomes) from trovato.tb01_nomes;