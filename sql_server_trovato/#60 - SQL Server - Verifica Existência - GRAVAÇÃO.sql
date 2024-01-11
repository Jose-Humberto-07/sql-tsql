select * from trovato.fn_05_Consulta_Dados_Pessoais(11122233399);

DROP FUNCTION trovato.fn_05_Consulta_Dados_Pessoais;

CREATE FUNCTION trovato.fn_05_Consulta_Dados_Pessoais(@CPF numeric(11))
RETURNS @tbSituacao table(ID_Pessoa numeric(6) PRIMARY KEY,
                          Dt_Nasc   date,
						  Nome      nvarchar(100), 
						  Sobrenome nvarchar(100), 
						  DDD_Cel   numeric(2),
						  Tel_Cel   numeric(9),
						  Endereco  nvarchar(100), 
						  Estado    nvarchar(100),
						  Região    nvarchar(50)
						  )
AS
BEGIN

	IF @CPF IS NOT NULL
		INSERT INTO @tbSituacao

		SELECT 
		       P.ID_PESSOA,
			   P.DT_NASC,
			   P.NOME,
			   P.SOBRENOME,
			   InfP.DDD_TEL_CEL,
			   InfP.TEL_CEL,
			   CONCAT(E.LOGRADOURO, ', ', E.NUMERO) Endereco,
			   Est.NOME_ESTADO,
			   R.NOME
		  FROM trovato.tb04_Pessoas P
		       inner join trovato.tb05_Informacoes_Pessoais InfP on InfP.id_pessoa = p.id_pessoa
		       inner join trovato.tb06_Endereco E on E.id_endereco = infP.id_endereco
			   inner join trovato.tb07_Estados Est on Est.id_estado = E.id_estado
			   inner join trovato.tb08_Regiao R on R.id_regiao = est.id_regiao
		 WHERE 
		       P.CPF = @CPf

	RETURN;

END;


select * from sys.objects where name like 'fn_%' and schema_id = 5 and type = 'TF';

--VERIFICA SE UMA FUNÇÃO EXISTE
-------------------------------
IF EXISTS(
	SELECT *
	  FROM sys.objects
	 WHERE object_id = object_id(N'trovato.fn_05_Consulta_Dados_Pessoais')
	   AND type in (N'FN', N'IF', N'TF', N'FS', N'FT')
) DROP FUNCTION trovato.fn_05_Consulta_Dados_Pessoais;
