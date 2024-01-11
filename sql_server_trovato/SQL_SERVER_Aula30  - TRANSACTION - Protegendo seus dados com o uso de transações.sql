--TRANSACTION
--Aula 30

--BEGIN TRANSACTION
--ROLLBACK TRANSACTION
--COMMIT;
----------------------------------------------

DROP TABLE TTEMP;

SELECT *
  INTO tTEMP
  FROM ALUNOS;

SELECT * FROM tTEMP;

BEGIN TRANSACTION;
   UPDATE tTEMP 
      SET SEXO = LOWER(SEXO);
COMMIT;

BEGIN TRANSACTION;
    UPDATE tTEMP SET SEXO = UPPER(SEXO);
ROLLBACK;

BEGIN TRANSACTION;
   DROP TABLE tTEMP;
ROLLBACK;

------------------
DECLARE @TR1 VARCHAR(20);
 SELECT @TR1 = 'Transação Delete';

BEGIN TRANSACTION @TR1;

  DELETE FROM tTEMP 
   WHERE NOME LIKE 'G%';

COMMIT TRANSACTION @TR1;

SELECT * FROM tTEMP;

--Múltiplos pontos de Transaction
--Nomeando as transações
/*
O exemplo a seguir cria uma tabela, gera três níveis de transações aninhadas e, 
em seguida, confirma a transação aninhada. Embora cada instrução COMMIT TRANSACTION 
tenha um parâmetro transaction_name, não há nenhuma relação entre as instruções 
COMMIT TRANSACTION e BEGIN TRANSACTION. Os parâmetros transaction_name ajudam 
o programador a assegurar que o número correto de confirmações seja codificado 
para decrementar @@TRANCOUNT para 0 e, assim, confirmar a transação externa.
*/
------------------------

IF OBJECT_ID('TabelaTeste','U') is not null
   DROP TABLE TabelaTeste;
GO

CREATE TABLE TabelaTeste (ID int PRIMARY KEY, LETRA char(1));
GO

--Iniciar a variável de controle de transctions @@TRANCOUNT para 1

BEGIN TRANSACTION TR1;
      PRINT 'Transaction : contador depois do BEGIN = ' + CAST(@@TRANCOUNT as NVARCHAR(10));
	  INSERT INTO TabelaTeste VALUES (1, 'A');

BEGIN TRANSACTION TR2;
      PRINT 'Transaction : contador depois do 2º BEGIN = ' + CAST(@@TRANCOUNT as NVARCHAR(10));
	  INSERT INTO TabelaTeste VALUES (2, 'B');

BEGIN TRANSACTION TR3;
      PRINT 'Transaction : contador depois do 3º BEGIN = ' + CAST(@@TRANCOUNT as NVARCHAR(10));
	  INSERT INTO TabelaTeste VALUES (3, 'C');

COMMIT TRANSACTION TR2;
      PRINT 'Transaction : contador depois do COMMIT TR2 = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));

COMMIT TRANSACTION TR1;
      PRINT 'Transaction : contador depois do COMMIT TR1 = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));

COMMIT TRANSACTION TR3;
      PRINT 'Transaction : contador depois do COMMIT TR3 = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));
