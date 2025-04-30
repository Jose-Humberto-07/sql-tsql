--1) No SQL Server Management Studio -SSMS iremos abrir nova janela de consulta.

--2) Entre com o código para testar o WHILE:

   DECLARE @I INT
   SET @I = 1;
   WHILE @I <= 100
   BEGIN
      PRINT @I;
      SET @I = @I + 1;
   END;Copiar código
--3) Cada consulta é uma conexão, Vamos criar uma tabela temporária

CREATE TABLE #TABELA01 (ID VARCHAR(10), NOME VARCHAR(30));
INSERT INTO #TABELA01 VALUES ('1','JOÃO');Copiar código
--4) Verifique a criação da tabela.

SELECT * FROM #TABELA01;Copiar código
--5) Em uma nova conexão (consulta) verifique que a tabela temporária #TABELA01 não é mostrada.

--6) Na primeira consulta crie umas segunda linha e verifique o conteúdo:

INSERT INTO #TABELA01 VALUES ('2','KATIA');
SELECT * FROM #TABELA01;Copiar código
--7) Na segunda consulta, entre com o código e olhe o conteúdo da tabela nos dois scripts.

CREATE TABLE ##TABELA02 (ID VARCHAR(10), NOME VARCHAR(30));
INSERT INTO ##TABELA02 VALUES ('1','JOÃO');
INSERT INTO ##TABELA02 VALUES ('2','KATIA');
SELECT * FROM ##TABELA02;Copiar código
--8) Insira mais uma linha:

INSERT INTO ##TABELA02 VALUES ('3','JORGE');
SELECT * FROM ##TABELA02;Copiar código
--9) Para usar uma tabela temporária como variável use o script.

   DECLARE @NUMERO_INICIAL_SEQUENCIA INT, @NUMERO_FINAL_SEQUENCIA INT;
   DECLARE @TESTE_NOTA_FISCAL INT;
   DECLARE @TABELA_DE_NUMEROS TABLE ([NUMERO] INT, [STATUS] VARCHAR(20));
   CREATE TABLE #TABELA_DE_NUMEROS ([NUMERO] INT, [STATUS] VARCHAR(20));

   SET @NUMERO_INICIAL_SEQUENCIA = 1;
   SET @NUMERO_FINAL_SEQUENCIA = 100000;

   SET NOCOUNT ON;
   WHILE @NUMERO_INICIAL_SEQUENCIA <= @NUMERO_FINAL_SEQUENCIA
   BEGIN
       SELECT @TESTE_NOTA_FISCAL = COUNT(*) FROM [NOTAS FISCAIS] WHERE 
       NUMERO = @NUMERO_INICIAL_SEQUENCIA;
       IF @TESTE_NOTA_FISCAL = 1
          BEGIN
            INSERT INTO @TABELA_DE_NUMEROS ([NUMERO], [STATUS]) 
            VALUES (@NUMERO_INICIAL_SEQUENCIA, 'É NOTA FISCAL');
            INSERT INTO #TABELA_DE_NUMEROS ([NUMERO], [STATUS]) 
            VALUES (@NUMERO_INICIAL_SEQUENCIA, 'É NOTA FISCAL');
          END;
       ELSE
          BEGIN
             INSERT INTO @TABELA_DE_NUMEROS ([NUMERO], [STATUS]) 
             VALUES (@NUMERO_INICIAL_SEQUENCIA, 'NÃO É NOTA FISCAL'); 
             INSERT INTO #TABELA_DE_NUMEROS ([NUMERO], [STATUS]) 
             VALUES (@NUMERO_INICIAL_SEQUENCIA, 'NÃO É NOTA FISCAL'); 
          END;
       SET @NUMERO_INICIAL_SEQUENCIA = @NUMERO_INICIAL_SEQUENCIA + 1;
   END;Copiar código
--10) Verifique as duas tabelas

SELECT * FROM @TABELA_DE_NUMEROS;
SELECT * FROM #TABELA_DE_NUMEROS;