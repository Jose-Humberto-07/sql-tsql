--Aula 01 - Functions SQL Server
--Fun��o para remover espa�os de
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

DROP FUNCTION Trovato.fn_01_RemoverEspa�os;

-- FUN��O REMOVER_ESPA�OS

CREATE FUNCTION Trovato.fn_01_RemoverEspa�os(@Texto as varchar(100))
returns varchar(100)
as 
begin

	if @Texto is null return null;

	--Declara��o das vari�veis
	--------------------------
	declare @NovoTexto      varchar(100);
	declare @cont           bit;

	--Inicializar as vari�veis
	--------------------------
	select @NovoTexto = @Texto;

	--Remover caracteres � esquerda
	-------------------------------
	set @NovoTexto = LTRIM(@NovoTexto);
	set @NovoTexto = RTRIM(@NovoTexto);
	
	while charindex('  ', @NovoTexto) > 0
	begin
		set @NovoTexto = replace(@NovoTexto, '  ', ' ');
	end

	return @NovoTexto;

end;

select trovato.fn_01_RemoverEspa�os(nomes) from trovato.tb01_nomes;