--Tipos de dados nas tabelas do SQL Server
--Aula Extra
--Site microsoft: 
--https://docs.microsoft.com/pt-br/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver15
------------------------------------------

Tipos Números exatos

BIT : 0, 1 ou NULL

TINYINT : 0 a 255
INT :  -2^31 (-2.147.483.648) a 2^31-1 (2.147.483.647)
BIGINT : -2^63 (-9.223.372.036.854.775.808) a 2^63-1 (9.223.372.036.854.775.807)

NUMERIC : - 10^38 +1 a 10^38 - 1
SMALLINT : -2^15 (-32.768) a 2^15-1 (32.767)
DECIMAL : - 10^38 +1 a 10^38 - 1
SMALLMONEY : -214.748,3648 a 214.748,3647
MONEY : -922.337.203.685.477,5808 a 922.337.203.685.477,5807


Números Aproximados

FLOAT
REAL

Data e Hora

DATE : 0001-01-01 a 9999-12-31
DATETIMEOFFSET : YYYY-MM-DD hh:mm:ss[.nnnnnnn] [{+|-}hh:mm] / Intervalo de horas 00:00:00 a 23:59:59.9999999
DATETIME2 : 00:00:00 a 23:59:59.9999999
SMALLDATETIME : 01.01.00 a 06.06.79 (2079) e 00:00:00 a 23:59:59
DATETIME : Janeiro 1, 1753, a dezembro 31, 9999 : 00:00:00 a 23:59:59.997
TIME : 00:00:00.0000000 a 23:59:59.9999999

Cadeia de Caracteres 

CHAR : 1 a 8000 (em)
VARCHAR : 
TEXT

|Caso use char ou varchar, recomendamos que:
|Use char quando os tamanhos das entradas de dados de coluna forem consistentes.
|Use varchar quando os tamanhos das entradas de dados de coluna variarem consideravelmente.
|Use varchar(max) quando os tamanhos das entradas de dados de coluna variarem consideravelmente e o tamanho da cadeia de caracteres puder exceder 8.000 bytes.

Cadeia de Caracteres Unicode

NCHAR
NVARCHAR
NTEXT

|Use nchar quando os tamanhos das entradas de dados de coluna forem consistentes.
|Use nvarchar quando os tamanhos das entradas de dados de coluna variarem consideravelmente.
|Use nvarchar(max) quando os tamanhos das entradas de dados de coluna variarem consideravelmente e o tamanho da cadeia de caracteres puder exceder 4.000 pares-bytes.

Cadeia de caracterer binária

BINARY
VARBINARY
IMAGEM

Outros tipos de dados

CURSOR
ROWVERSION
HIERARCHYID
UNIQUEIDENTIFIER
SQL_VARIANT
XML
TABLE

TIPOS DE GEOMETRIA ESPACIAL
TIPOS DE GEOGRAFIA ESPACIAL