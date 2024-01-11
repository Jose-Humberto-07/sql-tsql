/*PROCEDURES ESTÁTICAS, DINÂMICAS, COM PARÂMETROS DE ENTRADA E SAÍDA E DE SAÍDA*/
/* STORE PROCEDURES */

CREATE TABLE PESSOA(
	IDPESSOA INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(30) NOT NULL,
	SEXO CHAR(1) NOT NULL CHECK(SEXO IN('M', 'F')),
	NASCIMENTO DATE NOT NULL
)
GO

CREATE TABLE TELEFONE(
	IDTELEFONE INT NOT NULL IDENTITY,
	TIPO CHAR(3) NOT NULL CHECK(TIPO IN('CEL', 'COM')),
	NUMERO CHAR(10) NOT NULL,
	ID_PESSOA INT
)
GO

ALTER TABLE TELEFONE ADD CONSTRAINT FK_TELEFONE_PESSOA
FOREIGN KEY(ID_PESSOA) REFERENCES PESSOA(IDPESSOA)
ON DELETE CASCADE
GO

INSERT INTO PESSOA VALUES('ANTONIO', 'M', '1981-02-13')
INSERT INTO PESSOA VALUES('DANIEL', 'M', '1985-03-18')
INSERT INTO PESSOA VALUES('CLEIDE', 'F', '1979-10-13')

INSERT INTO TELEFONE VALUES('CEL','9879008',1)
INSERT INTO TELEFONE VALUES('COM','8757909',1)
INSERT INTO TELEFONE VALUES('CEL','3458949',2)
INSERT INTO TELEFONE VALUES('CEL','4564566',2)
INSERT INTO TELEFONE VALUES('CEL','6456745',3)
INSERT INTO TELEFONE VALUES('CEL','4645647',2)
INSERT INTO TELEFONE VALUES('CEL','3456456',3)

/* PROCEDURE PEQUENA TESTE */

CREATE PROC SOMA
AS 
	SELECT 10 + 10 AS SOMA
GO

/* EXECUTANDO UMA PROCEDURE */

SOMA 

ou

EXEC SOMA
GO
-- RETURN = 20

CREATE PROC CONTA(@NUM1 INT, @NUM2 INT)
AS 
	SELECT @NUM1 + @NUM2
GO

EXEC CONTA(10, 78)
GO
-- RETURN = 88

/* APAGANDO A PROCEDURE */
DROP PROC CONTA
GO

/* PROCEDURES EM TABELAS */

SELECT NOME, NUMERO
FROM PESSOA
		INNER JOIN TELEFONE
		ON PESSOA.IDPESSOA = TELEFONE.ID_PESSOA
WHERE TIPO = 'CEL'
GO

/* TRAZER OS TELEFONES DE ACORDO COM O TIPO PASSADO */
CREATE PROC TELEFONES(@TIPO CHAR(3))
AS 
	SELECT NOME, NUMERO
FROM PESSOA
		INNER JOIN TELEFONE
		ON PESSOA.IDPESSOA = TELEFONE.ID_PESSOA
WHERE TIPO = @TIPO
GO

EXEC TELEFONES('CEL')
GO

EXEC TELEFONES('COM')
GO

/*PARAMETROS DE OUTPUT(ENTRADA E SAIDA)*/

CREATE PROCEDURE GETTIPO @TIPO CHAR(3), @CONTADOR INT OUTPUT
AS 
SELECT @CONTADOR = COUNT(*)
FROM TELEFONE
WHERE TIPO = @GETTIPO
GO 

/* EXECUCAO DA PROCEDURE COM PARAMETRO DE SAIDA*/

DECLARE @SAIDA INT
EXECUTE GETTIPO('CEL', @SAIDA OUTPUT)
SELECT @SAIDA -- PRINT SAIDA
GO 

/*CRIANDO PROCEDURES COMO REGRA DE NEGÓCIO*/
/*PROCEDURE DE CADASTRO*/
CREATE PROC CADASTRO(@NOME VARCHAR(30), @SEXO CHAR(1), @NASCIMENTO DATE, @TIPO CHAR(3), @NUMERO VARCHAR(10))
AS
	DECLARE @FK INT

	INSERT INTO PESSOA VALUES(@NOME, @SEXO, @NASCIMENTO) --GERAR UM ID

	SET @FK = (SELECT IDPESSOA FROM PESSOA WHERE IDPESSOA
		= @@IDENTITY)

	INSERT INTO TELEFONE VALUES(@TIPO, @NUMERO, @FK)
GO 