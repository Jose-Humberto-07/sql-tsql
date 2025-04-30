--1) Abra o SSML- SQL Server Management Studio e crie uma nova consulta.

--2) Crie uma tabela:

CREATE TABLE TABELA_TESTE (ID VARCHAR(10));Copiar código
--3) Para recriar uma tabela use o comando DROP:



DROP CREATE TABLE TABELA_TESTE;
CREATE TABLE TABELA_TESTE (ID VARCHAR(10));Copiar código
--5) Para testar se a tabela existe para criar novamente a tabela use o script:

IF OBJECT_ID('TABELA_TESTE','U') IS NOT NULL DROP TABLE TABELA_TESTE;
IF OBJECT_ID('TABELA_TESTE','U') IS NULL CREATE TABLE TABELA_TESTE (ID VARCHAR(10));Copiar código
--6) Relembrando funções de data:

SELECT GETDATE()Copiar código
--7) Se quiser buscar o nome de um componente da data, neste exemplo está retornando o dia da semana:

SELECT DATENAME(WEEKDAY, GETDATE())Copiar código
--8) Para retornar o dia mais a frente:

SELECT GETDATE(), DATEADD(DAY, 5, GETDATE())Copiar código
--9) Para retornar que dia da semana será daqui a cinco dias:

SELECT DATENAME(WEEKDAY,  DATEADD(DAY, 5, GETDATE()))Copiar código
--10) Rode o script para determinar se é em dia da semana ou final de semana:

DECLARE @DIA_SEMANA VARCHAR(20);
DECLARE @NUMERO_DIAS INT;

SET @NUMERO_DIAS = 16;
SET @DIA_SEMANA = DATENAME(WEEKDAY,  DATEADD(DAY, @NUMERO_DIAS, GETDATE()));
PRINT @DIA_SEMANA;

IF @DIA_SEMANA = 'Domingo' OR @DIA_SEMANA = 'Sábado'
PRINT 'Este dia é fim de semana';
ELSE
PRINT 'Este dia é dia de semana';Copiar código
--11) Mostre a tabela de clientes:

SELECT * FROM [TABELA DE CLIENTES]Copiar código
--12) A consulta do limite de crédito de cada bairro é mostrado com o comando:

SELECT BAIRRO, SUM([LIMITE DE CREDITO]) FROM [TABELA DE CLIENTES] GROUP BY BAIRROCopiar código
--13) Para mostrar de um determinado bairro:

SELECT SUM([LIMITE DE CREDITO]) FROM [TABELA DE CLIENTES] WHERE BAIRRO = 'Água Santa'Copiar código
--14) Para mostrar se o limite de crédito de determinado bairro estourou:

DECLARE @LIMITE_MAXIMO FLOAT;
DECLARE @LIMITE_ATUAL FLOAT;
DECLARE @BAIRRO VARCHAR(20);

SET @LIMITE_MAXIMO = 50000;
SET @BAIRRO = 'Água Santa';

SELECT @LIMITE_ATUAL = SUM([LIMITE DE CREDITO]) FROM [TABELA DE CLIENTES] WHERE BAIRRO = @BAIRRO;
IF @LIMITE_MAXIMO <= @LIMITE_ATUAL
PRINT 'VALOR ESTOUROU';
ELSE
PRINT 'VALOR NÃO ESTOUROU';Copiar código
--15) Alterando script para colocar o SELECT dentro do IF:

DECLARE @LIMITE_MAXIMO FLOAT;
DECLARE @BAIRRO VARCHAR(20);

SET @LIMITE_MAXIMO = 150000;
SET @BAIRRO = 'Água Santa';

IF @LIMITE_MAXIMO <= (SELECT SUM([LIMITE DE CREDITO]) FROM [TABELA DE CLIENTES] WHERE BAIRRO = @BAIRRO)
PRINT 'VALOR ESTOUROU';
ELSE
PRINT 'VALOR NÃO ESTOUROU';