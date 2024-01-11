--Aula 01 - Function Remover_Espaços
------------------------------------
--Autor: Alessandro Trovato
--Aula 55- Playlist SQL Server
--https://www.youtube.com/aletrovato
------------------------------------

use sql_db_1;
go

DROP SCHEMA trovato;
CREATE SCHEMA trovato;

CREATE TABLE trovato.tb01_Nomes(
	NOMES nvarchar(100) NOT NULL
);

select count(*) from trovato.tb01_Nomes;
select * from trovato.tb01_Nomes;
select LTRIM(NOMES) from trovato.tb01_Nomes;
select TRIM(NOMES) from trovato.tb01_Nomes;
select REPLACE(NOMES, '  ', ' ') from trovato.tb01_Nomes;

--RTRIM | Remove os espaços à direita
--LTRIM | Remove os espaços à esquerda
--TRIM  | Remove os caracteres não imprimíveis
--REPLACE | Substituição de caracteres

--------------------------------------------------

CREATE FUNCTION trovato.fn_01_Remover_Espaços(@Texto as nvarchar(100))
returns nvarchar(100)
as
BEGIN
	
	if @Texto is null return null;

	--Declaração das variáveis
	--------------------------
	declare @NovoTexto	nvarchar(100);

	--Inicializar as variáveis
	--------------------------
	select @NovoTexto = @Texto;

	--Remover os caracteres (espaço)
	set @NovoTexto = LTRIM(@NovoTexto)
	set @NovoTexto = RTRIM(@NovoTexto)

	while charindex('  ', @NovoTexto) > 0
	begin
		set @NovoTexto = replace(@NovoTexto, '  ', ' ');
	end
	
	return @NovoTexto;

END;

------------------------------------------

select trovato.fn_01_Remover_Espaços(NOMES) as Nome_Sem_Espaços from trovato.tb01_Nomes;
