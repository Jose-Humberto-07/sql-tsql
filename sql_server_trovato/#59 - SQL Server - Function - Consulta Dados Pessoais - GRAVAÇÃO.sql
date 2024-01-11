--05 Function SQL Server
--Função para retornar dados pessoais
-------------------------------------

use sql_db_1;
go

CREATE TABLE trovato.tb04_Pessoas(
	ID_PESSOA numeric(6) PRIMARY KEY NOT NULL,
	NOME      nvarchar(100) NOT NULL, 
	SOBRENOME nvarchar(100) NOT NULL, 
	DT_NASC   date NOT NULL,
    CPF	      numeric(11)
);

CREATE TABLE trovato.tb05_Informacoes_Pessoais(
	ID_PESSOA numeric(6) NOT NULL,
	ID_ENDERECO numeric(6) NOT NULL,
	TEL_CEL numeric(9),
	DDD_TEL_CEL numeric(2),
	TEL_RES numeric(9),
	DDD_TEL_RES numeric(2)
);

CREATE TABLE trovato.tb06_Endereco(
	ID_ENDERECO numeric(6) PRIMARY KEY NOT NULL,
	ID_ESTADO   numeric(3) NOT NULL,
	LOGRADOURO  nvarchar(50) NOT NULL,
	NUMERO      nvarchar(6) NOT NULL, 
	BAIRRO      nvarchar(50) NOT NULL,
	COMPL       nvarchar(50),
	CEP         numeric(8)
);

CREATE TABLE trovato.tb07_Estados(
	ID_ESTADO numeric(3) PRIMARY KEY NOT NULL,
	NOME_ESTADO nvarchar(100) NOT NULL,
	ID_REGIAO numeric(3) NOT NULL
);

CREATE TABLE trovato.tb08_Regiao(
	ID_REGIAO numeric(3) PRIMARY KEY NOT NULL,
	NOME nvarchar(50) NOT NULL
);

ALTER TABLE trovato.tb07_Estados 
    ADD CONSTRAINT fk_Regiao FOREIGN KEY (id_regiao) REFERENCES trovato.tb08_Regiao(id_regiao);

ALTER TABLE trovato.tb06_Endereco
    ADD CONSTRAINT fk_Estado FOREIGN KEY (id_estado) REFERENCES trovato.tb07_Estados(id_estado);

ALTER TABLE trovato.tb05_Informacoes_Pessoais
    ADD CONSTRAINT fk_Endereco FOREIGN KEY (id_endereco) REFERENCES trovato.tb06_Endereco(id_endereco);

ALTER TABLE trovato.tb05_Informacoes_Pessoais
	ADD CONSTRAINT fk_Pessoa FOREIGN KEY (id_pessoa) REFERENCES trovato.tb04_Pessoas(id_pessoa);

-- Adicionar dados
------------------

INSERT INTO trovato.tb08_Regiao(ID_REGIAO, NOME) VALUES
   (1, 'NORTE'), (2, 'NORDESTE'), (3, 'CENTRO-OESTE'), (4, 'SUDESTE'), (5, 'SUL');

INSERT INTO trovato.tb07_Estados(ID_ESTADO, NOME_ESTADO, ID_REGIAO) VALUES
   (1, 'São Paulo', 4), (2, 'Rio de Janeiro', 4), (3, 'Manaus', 1);

INSERT INTO trovato.tb06_Endereco(ID_ENDERECO, ID_ESTADO, LOGRADOURO, NUMERO, BAIRRO, COMPL, CEP) VALUES
   (1, 1, 'Rua Floriano Peixoto', 100, 'Centro', null, 11999000),
   (2, 1, 'Rua Santa Rita', 88, 'Rancho Grande', null, 13300888);

INSERT INTO trovato.tb04_Pessoas(ID_PESSOA, NOME, SOBRENOME, DT_NASC, CPF) VALUES
   (1, 'Alessandro', 'Trovato', '11/11/1972', 11122233399), 
   (2, 'Marcia', 'Rodrigues', '07/08/1972', 2223334455), 
   (3, 'Rafael', 'Medeiros', '01/01/1980', 3334445588);

INSERT INTO trovato.tb05_Informacoes_Pessoais(ID_PESSOA, ID_ENDERECO, TEL_CEL, DDD_TEL_CEL, TEL_RES, DDD_TEL_RES) VALUES
   (1, 1, 988880000, 11, 22223344, 11), (2, 2, 977776666, 11, 22130000, 11);

TRUNCATE TABLE trovato.tb04_Pessoas;
TRUNCATE TABLE trovato.tb05_Informacoes_Pessoais;
TRUNCATE TABLE trovato.tb06_Endereco;
TRUNCATE TABLE trovato.tb07_Estados;
TRUNCATE TABLE trovato.tb08_Regiao;

DROP TABLE trovato.tb04_Pessoas;
DROP TABLE trovato.tb05_Informacoes_Pessoais;
DROP TABLE trovato.tb06_Endereco;
DROP TABLE trovato.tb07_Estados;
DROP TABLE trovato.tb08_Regiao;

-------------------------------------------
CREATE FUNCTION trovato.fn_05_Consulta_Dados_Pessoais(@CPF numeric(11))
RETURNS @tbSituacao table(Codigo numeric(6) PRIMARY KEY,
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

select * from trovato.fn_05_Consulta_Dados_Pessoais(11122233399);

DROP FUNCTION trovato.fn_05_Consulta_Dados_Pessoais;