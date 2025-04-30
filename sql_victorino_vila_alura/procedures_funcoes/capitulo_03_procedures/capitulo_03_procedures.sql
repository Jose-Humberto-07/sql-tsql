CREATE PROCEDURE sp_Calcula (@NumberOfGrades INT)
AS
BEGIN
    DECLARE @Total INT = 0;

    DECLARE @Counter INT = 1;

    WHILE (@Counter <= @NumberOfGrades)
    BEGIN
        DECLARE @CurrentGrade INT;
        SET @CurrentGrade = (SELECT GRADE FROM GRADES WHERE ID = @Counter);

        SET @Total = @Total + @CurrentGrade;
        SET @Counter = @Counter + 1;
    END;

    DECLARE @Average INT = (@Total / @NumberOfGrades);
    SELECT @Average AS AverageGrade;
END;

--Vamos primeiro obter a consulta que me apresenta as vendas por sabor, tendo como filtro a data inicial e final de análise.

SELECT TP.[SABOR]
, SUM(INF.QUANTIDADE * INF.[PREÇO]) AS FATURAMENTO
FROM [TABELA DE PRODUTOS] TP
INNER JOIN [ITENS NOTAS FISCAIS] INF
ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
INNER JOIN [NOTAS FISCAIS] NF
ON NF.NUMERO = INF.NUMERO
WHERE NF.DATA >= '2015-01-01' AND NF.DATA <= '2015-12-31'
GROUP BY TP.[SABOR]Copiar código
--Para obter o faturamento precisamos de buscar os dados na tabela de itens de notas fiscais. Já as datas na tabela de notas fiscais e o sabor da tabela de produto. Por isso o INNER JOIN entre estas três tabelas.

--Para construir a informação requisitada pela presidência precisamos ter numa tabela temporária a relação entre os sabores e os dois novos departamentos. Mas, como esta relação não existe na base de dados, podemos criar uma variável do tipo tabela e incluir esta relação.

DECLARE @DEPARTAMENTO TABLE (SABOR VARCHAR(20), DEPARTAMENTO VARCHAR(20))
INSERT INTO @DEPARTAMENTO 
SELECT DISTINCT SABOR, 'FRUTAS NÃO CÍTRICAS' as DEPARTAMENTO 
FROM [TABELA DE PRODUTOS] WHERE 
SABOR IN ('Açai','Cereja','Cereja/Maça','Maça','Manga','Maracujá','Melância')
UNION
SELECT DISTINCT SABOR, 'FRUTAS CÍTRICAS' as DEPARTAMENTO 
FROM [TABELA DE PRODUTOS] WHERE 
SABOR IN ('Laranja','Uva','Limão','Morango','Morango/Limão','Lima/Limão')Copiar código
--Com a tabela criada podemos fazer um INNER JOIN entre ela e a primeira consulta para obter os dados de vendas agrupados por estes novos departamentos.

DECLARE @DEPARTAMENTO TABLE (SABOR VARCHAR(20), DEPARTAMENTO VARCHAR(20))
INSERT INTO @DEPARTAMENTO 
SELECT DISTINCT SABOR, 'FRUTAS NÃO CÍTRICAS' as DEPARTAMENTO 
FROM [TABELA DE PRODUTOS] WHERE 
SABOR IN ('Açai','Cereja','Cereja/Maça','Maça','Manga','Maracujá','Melância')
UNION
SELECT DISTINCT SABOR, 'FRUTAS CÍTRICAS' as DEPARTAMENTO 
FROM [TABELA DE PRODUTOS] WHERE 
SABOR IN ('Laranja','Uva','Limão','Morango','Morango/Limão','Lima/Limão')

SELECT DP.[DEPARTAMENTO]
, SUM(INF.QUANTIDADE * INF.[PREÇO]) AS FATURAMENTO
FROM [TABELA DE PRODUTOS] TP
INNER JOIN [ITENS NOTAS FISCAIS] INF
ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
INNER JOIN [NOTAS FISCAIS] NF
ON NF.NUMERO = INF.NUMERO
INNER JOIN @DEPARTAMENTO DP
ON TP.SABOR = DP.SABOR
WHERE NF.DATA >= '2015-01-01' AND NF.DATA <= '2015-12-31'
GROUP BY DP.[DEPARTAMENTO]Copiar código
--O passo final é criar uma SP que faça o código T-SQL acima passando como parâmetro a data inicial e final.

CREATE PROCEDURE faturamentoDepartamento (@dataInicial DATE, @dataFinal DATE)
AS
BEGIN
DECLARE @DEPARTAMENTO TABLE (SABOR VARCHAR(20), DEPARTAMENTO VARCHAR(20))
INSERT INTO @DEPARTAMENTO 
SELECT DISTINCT SABOR, 'FRUTAS NÃO CÍTRICAS' as DEPARTAMENTO 
FROM [TABELA DE PRODUTOS] WHERE 
SABOR IN ('Açai','Cereja','Cereja/Maça','Maça','Manga','Maracujá','Melância')
UNION
SELECT DISTINCT SABOR, 'FRUTAS CÍTRICAS' as DEPARTAMENTO 
FROM [TABELA DE PRODUTOS] WHERE 
SABOR IN ('Laranja','Uva','Limão','Morango','Morango/Limão','Lima/Limão')
SELECT DP.[DEPARTAMENTO]
, SUM(INF.QUANTIDADE * INF.[PREÇO]) AS FATURAMENTO
FROM [TABELA DE PRODUTOS] TP
INNER JOIN [ITENS NOTAS FISCAIS] INF
ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
INNER JOIN [NOTAS FISCAIS] NF
ON NF.NUMERO = INF.NUMERO
INNER JOIN @DEPARTAMENTO DP
ON TP.SABOR = DP.SABOR
WHERE NF.DATA >= @dataInicial AND NF.DATA <= @dataFinal
GROUP BY DP.[DEPARTAMENTO]


exec faturamentoDepartamento '2016-01-01','2016-01-15';