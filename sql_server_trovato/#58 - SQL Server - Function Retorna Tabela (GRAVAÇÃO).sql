--04 Function SQL Server
--Function para retorno de uma tabela
-------------------------------------
USE SQL_DB_1;
GO

select * from trovato.tb02_Estoque_Produtos;
select * from trovato.tb03_Produtos;

--FUNCTION
CREATE FUNCTION trovato.fn_04_Retorna_Situacao_Estoque(@pValorLimite decimal(10,2))
RETURNS @tbSituacao table(ID numeric(6) PRIMARY KEY NOT NULL,
                          NOME nvarchar(50) NOT NULL,
						  ESTOQUE numeric(6),
						  OBSERVACAO nvarchar(100)
						 )
AS
BEGIN

	if @pValorLimite is not null
		INSERT INTO @tbSituacao

		SELECT ep.id_produto,
		       p.NOME_PRODUTO,
			   ep.saldo,
			   CASE WHEN ep.saldo <= @pValorLimite then 'Estoque baixo' else 'Estoque ok' END 
		  FROM trovato.tb02_Estoque_Produtos ep
		       INNER JOIN trovato.tb03_Produtos p on (p.id_produto = ep.ID_PRODUTO)
		-- WHERE
		  --     ep.saldo <= @pValorLimite;

	RETURN

END;

drop function trovato.fn_04_Retorna_Situacao_Estoque;

select * from trovato.fn_04_Retorna_Situacao_Estoque(10);