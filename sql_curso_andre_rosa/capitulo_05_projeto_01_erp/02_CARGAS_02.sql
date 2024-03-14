--CARGA DE DADOS EM TABELAS DE CADASTROS

USE MINIERP
--CARGA TABLE UF
INSERT INTO  UF
SELECT DISTINCT B.UF,A.estado
	FROM CURSO.DBO.UF a
	INNER JOIN CURSO.DBO.CIDADES b
	ON a.COD_UF=b.cod_uf


--SELECT * FROM UF

--CARGA TABELA CIDADES
INSERT INTO CIDADES
SELECT cod_uf+cod_mun,UF,NOME_MUN FROM CURSO.DBO.CIDADES

--SELECT * FROM CIDADES


--CARGA TABELAS CLIENTES
--DBCC Checkident( CLIENTES, reseed, 0)
INSERT INTO CLIENTES VALUES 
	('CARLOS JACOB HOUSTON','CARLOS','RUA 1','375','SANTA HELENA','4203709','13290000','123456987','F',GETDATE(),1),
	('PEDRO LARSON OHIO','PEDRO','RUA 2','235','SANTA CLARA','4119608','13290987','123456989','F',GETDATE(),2),
	('BIKES ON LTDA','BIKES ON','RUA 14','279','MONTANHA','5300108','13293245','343456987','J',GETDATE(),3),
	('MY BIKE MY LIFE SA','BIKE LIFE','RUA 23','675','ALPES','3509502','13379245','11290340','J',GETDATE(),3)

-- EVIDENCIAR SELECT * FROM CLIENTES

--CARGA TABELAS FORNECEDORES	
INSERT INTO  FORNECEDORES VALUES
	('SO BIKES LTDA','SO BIKES','RUA 10','375','SANTA HILDA','4203709','13290000','123456987','J',GETDATE(),1),
	('ESPECIAL BIKES LTDA','ESPECIAL BIKES','RUA 2','235','SANTA GENEBRA','4119608','13290987','123456989','J',GETDATE(),2),
	('MONTA BIKES ME','MONTA BIKES','RUA 67','345','ALADO','5300108','13293245','343456987','J',GETDATE(),3)

--SELECT * FROM FORNECEDORES

--CARGA TABELA TIPO DE MATERIAL

INSERT INTO TIPO_MAT VALUES ('MATERIA PRIMA'),('PRODUDO ACABADO'),('EMBALAGEM'),('CONSUMO')

--SELECT * FROM TIPO_MAT

--CARGA MATERIAL
--COD TIPO MAT
/* 
1	MATERIA PRIMA
2	PRODUDO ACABADO
3	EMBALAGEM
4	CONSUMO
*/
--SELECT * FROM MATERIAL
--DELETE FROM MATERIAL
--DBCC Checkident( MATERIAL, reseed, 0)
INSERT INTO MATERIAL VALUES
	('BICICLETA ARO 29 PRETA MOD INFINITY','2500','2',''),
	('BICICLETA ARO 29 BRANCA MOD INFINITY','2500','2',''),
	('QUADRO ARO 29','500','1','1'),
	('KIT TRANSMISSAO','500','1','1'),--FREIO+MARCHA-PEDEVELA-TROCADORES+K-7
	('ARO 29','70','1','1'),
	('PNEU 29','100','1','2'),
	('CAMARA 29','25','1','2'),
	('SUSPENSAO DIANTEIRA','250','1','2'),
	('BANCO','80','1','3'),
	('CANOTE','35','1','3'),
    ('TINTA BRANCA','10','1','3'),
	('TINTA PRETA','10','1','3'),
	('MESA','500','1','1'),
	('GUIDON','50','1','2'),
	('LUVAS','30','1','2'),
	('CAIXA EMBALAGEM','10','3','3')

--FICHA TECNICA BIKE PRETA	
INSERT INTO FICHA_TECNICA VALUES 
      ('1','3',1),('1','4',1),('1','5',2),('1','6',2),('1','7',2),
	  ('1','8',1),('1','9',1),('1','10',1),('1','12',0.250),('1','13',1),
	  ('1','14',1),('1','15',2),('1','16',1)
--FICHA TECNICA BIKE BRANCO
INSERT INTO FICHA_TECNICA VALUES 
      ('2','3',1),('2','4',1),('2','5',2),('2','6',2),('2','7',2),
	  ('2','8',1),('2','9',1),('2','10',1),('2','11',0.250),('2','13',1),
	  ('2','14',1),('2','15',2),('2','16',1)

--SELECT * FROM FICHA_TECNICA


--SELECT * FROM FICHA_TECNICA
--SELECT * FROM CENTRO_CUSTO
--CARGA CENTRO DE CUSTOS
INSERT INTO CENTRO_CUSTO VALUES ('9001','PRESIDENCIA')
INSERT INTO CENTRO_CUSTO VALUES ('9002','ADMINISTRATIVO')
INSERT INTO CENTRO_CUSTO VALUES ('9003','PRODUCAO')
INSERT INTO CENTRO_CUSTO VALUES ('9004','SUPRIMENTOS')
INSERT INTO CENTRO_CUSTO VALUES ('9005','RH')
INSERT INTO CENTRO_CUSTO VALUES ('9006','FINANCEIRO')
INSERT INTO CENTRO_CUSTO VALUES ('9007','COMERCIAL')
INSERT INTO CENTRO_CUSTO VALUES ('9008','FISCAL')
INSERT INTO CENTRO_CUSTO VALUES ('9009','TI')

--SELECT * FROM CENTRO_CUSTO 

--CARGA DE CARGOS FUNCOES
--SELECT * FROM CARGOS
--SELECT * FROM CENTRO_CUSTO
INSERT INTO CARGOS VALUES 
	('PRESIDENTE'),('GER COMERCIAL'),('VENDEDOR'),('GER ADM'),
	 ('ASSISTENTE DE RH'),('OPERADOR PRODUCAO'),('ESTOQUISTA'),('ANALISTA DE SISTEMA'),
	 ('FATURISTA'),('ASSISTENTE FINANCEIRO')
--SELECT * FROM CARGOS

--CARGA TABELA FUNCIONARIO 
--DELETE FROM FUNCIONARIO
--DBCC Checkident( FUNCIONARIO, reseed, 0)
INSERT INTO FUNCIONARIO VALUES
 ('9001','JAMES LABRIE','1234567','123567990','RUA 1','2','SANTA CLAUS','3525904','2017-01-03','','1980-12-25','','1'),
 ('9002','JONH LARAVEL','1234568','123567889','RUA 2','3','SANTA CLAUS','3525904','2017-02-10','','1980-12-25','','4'),
 ('9003','PETER DOTNESK','3434568','123564578','RUA 3','4','SANTA CLAUS','3525904','2017-02-09','','1980-12-25','','6'),
 ('9004','LARA POTTER','4434509','123576867','RUA 4','5','SANTA CLAUS','3525904','2017-03-07','','1980-12-25','','7'),
 ('9005','JESSICA SUTER','4534576','120367887','RUA 5','6','SANTA CLAUS','3525904','2017-03-03','','1980-12-25','','5'),
 ('9006','PEDRO TESLA','4334568','123703885','RUA 6','7','SANTA CLAUS','3525904','2017-04-15','','1980-12-25','','1'),
 ('9007','TIAGO FIELDER','9834568','147034889','RUA 7','8','SANTA CLAUS','3525904','2017-04-20','','1980-12-25','','2'),
 ('9007','MALCON DEXTER','9834568','147067889','RUA 17','28','SANTA CLAUS','3525904','2017-04-20','','1980-12-25','','3'),
 ('9007','CHARLES NOIX','9894668','147067149','RUA 77','18','SANTA CLAUS','3525904','2017-04-20','','1980-12-25','','3'),
 ('9008','JOAO SPARK','7734568','643567888','RUA 8','22','SANTA CLAUS','3525904','2017-05-07','','1980-12-25','','9'),
 ('9009','DAVID MANDRAKE','6634568','345567887','RUA 8','56','SANTA CLAUS','3525904','2017-05-07','','1980-12-25','','8'),
 ('9002','SAMUEL DUPRET','8984568','159567887','RUA 23','89','SANTA CLAUS','3525904','2017-05-07','','1980-12-25','','10')

 --SELECT * FROM FUNCIONARIO

 --CARGA TABELA USUARIOS
--DELETE FROM USUARIOS
--SELECT * FROM USUARIOS
--SELECT NOME,MATRICULA FROM FUNCIONARIO
INSERT INTO USUARIOS (LOGIN,MATRICULA,SENHA,SITUACAO) VALUES
('JAMESL','1','','A'),
('JONHL','2','','A'),
('PETERD','3','','A'),
('LARAP','4','','A'),
('JESSICAS','5','','A'),
('PEDROT','6','','A'),
('TIAGOF','7','','A'),
('MALCOND','8','','A'),
('CHARLESN','9','','A'),
('JOAOS','10','','A'),
('DAVIDM','11','','A'),
('SAMUELD','12','','A')

-- SELECT * FROM USUARIOS

---GRAVANDO E CRIPTOGRAFANDO SENHA COM MD5 COM SENHA INICIAL = MATRICULA
UPDATE USUARIOS 
SET SENHA=CONVERT(VARCHAR(32), HashBytes('MD5', CONVERT(varchar,matricula)), 2)

--SELECT MATRICULA, SENHA=CONVERT(VARCHAR(32), HashBytes('MD5', CONVERT(varchar,matricula)), 2)
--FROM  USUARIOS
--SELECT * FROM  USUARIOS

--CARGA TABELA CONDICAO DE PAGAMENTO
INSERT INTO COND_PAGTO VALUES
	('A VISTA'),('3 X 30/60/90 DD'),('30 DD')

--CARGA DETALHE DE PAGAMENTO PARCELAS
INSERT INTO COND_PAGTO_DET VALUES
	('1','1',0,100)

INSERT INTO COND_PAGTO_DET VALUES
	('2','1',30,33.34),
	('2','2',60,33.33),
	('2','3',90,33.33)

INSERT INTO COND_PAGTO_DET VALUES
	('3','1',30,100)

--CARGA VENDEDORES
--SELECT * FROM VENDEDORES
INSERT INTO VENDEDORES
SELECT MATRICULA FROM FUNCIONARIO
WHERE COD_CARGO IN (SELECT COD_CARGO FROM CARGOS WHERE NOME_CARGO='VENDEDOR')
AND MATRICULA NOT IN (SELECT MATRICULA FROM VENDEDORES)

--CARGA TABELA GERENTES
INSERT INTO GERENTES
SELECT MATRICULA FROM FUNCIONARIO
WHERE COD_CARGO IN (SELECT COD_CARGO FROM CARGOS WHERE NOME_CARGO='GER COMERCIAL')
AND MATRICULA NOT IN (SELECT MATRICULA FROM GERENTES)

--CARGA CANAL VENDAS GERENTE X VENDEDOR

INSERT INTO CANAL_VENDAS_G_V VALUES 
	(1,1),(1,2)

--CARGA CANAL VENDAS VENDEDOR X CLIENTE
INSERT CANAL_VENDAS_V_C VALUES
	(1,1),(1,2),
	(2,3),(2,4)

--CARGA DE META DE VENDAS
--SELECT * FROM META_VENDAS
 INSERT INTO META_VENDAS VALUES
  (1,'2017','01',83.33), (1,'2017','02',83.33),(1,'2017','03',83.33), (1,'2017','04',83.33),
  (1,'2017','05',83.33), (1,'2017','06',83.33),(1,'2017','07',83.33), (1,'2017','08',83.33),
  (1,'2017','09',83.33), (1,'2017','10',83.33),(1,'2017','11',83.33), (1,'2017','12',83.33)

  INSERT INTO META_VENDAS VALUES
  (2,'2017','01',83.33), (2,'2017','02',83.33),(2,'2017','03',83.33), (2,'2017','04',83.33),
  (2,'2017','05',83.33), (2,'2017','06',83.33),(2,'2017','07',83.33), (2,'2017','08',83.33),
  (2,'2017','09',83.33), (2,'2017','10',83.33),(2,'2017','11',83.33), (2,'2017','12',83.33)


 --CARGA CFOP CODIGO DE OPERACAOS FISCAIS
--  DELETE FROM CFOP
  INSERT INTO CFOP VALUES
	('5.101','VENDAS DE MERC'),('1.101','COMPRAS DE MERC')


--CARGA DE ORDENS DE PRODUCAO PARA PLANEJAMENTO

--DELETE  FROM ORDEM_PROD
/*
INSERT INTO ORDEM_PROD VALUES 
		(1,50,'2017-01-01','2017-01-31'),(2,50,'2017-01-01','2017-01-31'),
		(1,50,'2017-02-01','2017-02-28'),(2,50,'2017-01-02','2017-02-28'),
		(1,50,'2017-03-01','2017-03-31'),(2,50,'2017-01-03','2017-03-31'),
		(1,50,'2017-04-01','2017-04-30'),(2,50,'2017-01-04','2017-04-30'),
		(1,50,'2017-05-01','2017-05-31'),(2,50,'2017-01-05','2017-05-31'),
		(1,50,'2017-06-01','2017-06-30'),(2,50,'2017-01-06','2017-06-30'),
		(1,50,'2017-07-01','2017-07-31'),(2,50,'2017-01-07','2017-07-31'),
		(1,50,'2017-08-01','2017-08-31'),(2,50,'2017-01-08','2017-08-31'),
		(1,50,'2017-09-01','2017-09-30'),(2,50,'2017-01-09','2017-09-30'),
		(1,50,'2017-10-01','2017-10-31'),(2,50,'2017-01-10','2017-10-31'),
		(1,50,'2017-11-01','2017-11-30'),(2,50,'2017-01-11','2017-11-30'),
		(1,50,'2017-12-01','2017-12-31'),(2,50,'2017-01-12','2017-12-31')
*/	
--CARGA PEDIDO DE COMPRAS POR DEMANDA DE PRODUCAO
--SELECT
/*
SELECT A.COD_MAT_PROD,A.QTD_PROD,B.COD_MAT_NECES,B.QTD_NECES,A.QTD_PROD*B.QTD_NECES  NECESSIDADE,
	   C.ID_FOR
  FROM ORDEM_PROD A
	INNER JOIN FICHA_TECNICA B
	ON A.COD_MAT_PROD=B.COD_MAT_PROD
	INNER JOIN MATERIAL C
	ON B.COD_MAT_NECES=C.COD_MAT
		WHERE MONTH(DATA_FIM)=01 
		AND YEAR(DATA_FIM)=2017 

*/

--INSERT PED_VENDAS CABE�ALHO
--SELECT * FROM PED_VENDAS
--DELETE FROM PED_VENDAS
--DBCC Checkident( PED_VENDAS, reseed, 0)
INSERT INTO PED_VENDAS (ID_CLIENTE,COD_PAGTO,DATA_PEDIDO,DATA_ENTREGA,SITUACAO) VALUES
 (1,1,'2017-01-13','2017-01-29','A'),
 (2,3,'2017-02-13','2017-02-28','A'),
 (3,2,'2017-03-13','2017-03-29','A'),
 (2,2,'2017-04-13','2017-04-29','A'),
 (2,3,'2017-05-13','2017-05-29','A'),
 (1,3,'2017-06-13','2017-06-29','A'),
 (2,1,'2017-07-13','2017-07-29','A'),
 (3,3,'2017-08-13','2017-08-29','A'),
 (3,2,'2017-09-13','2017-09-29','A'),
 (2,1,'2017-10-13','2017-10-29','A'),
 (1,2,'2017-11-13','2017-11-29','A'),
 (3,2,'2017-12-13','2017-12-29','A')


 --CARGA DETALHES DE PEDIDOS
--PED_VENDAS
--SELECT * FROM PED_VENDAS_ITENS
--
 INSERT INTO PED_VENDAS_ITENS VALUES
	(1,1,1,35,2500),(1,2,2,40,2500),
	(2,1,1,50,2500),(2,2,2,35,2500),
	(3,1,1,50,2500),(3,2,2,35,2500),
	(4,1,1,50,2500),(4,2,2,35,2500),
	(5,1,1,50,2500),(5,2,2,35,2500),
	(6,1,1,50,2500),(6,2,2,35,2500),
	(7,1,1,50,2500),(7,2,2,35,2500),
	(8,1,1,70,2500),(8,2,2,70,2500),
	(9,1,1,50,2500),(9,2,2,35,2500),
	(10,1,1,50,2500),(10,2,2,35,2500),
	(11,1,1,100,2500),(11,2,2,100,2500),
	(12,1,1,50,2500),(12,2,2,35,2500)

--CARGA FUNCIONARIO SALARIOS

INSERT INTO SALARIO VALUES (1,7650),(2,2650),(3,2550),(4,1550),
                           (5,4550),(6,2850),(7,1850),(8,1560),
						   (9,3899),(10,2345),(11,3100),(12,4500)

--CARGA PARAMETROS INSS
 INSERT INTO PARAM_INSS VALUES 
   ('2017-01-01','2017-12-31',0,1659.38,8),
   ('2017-01-01','2017-12-31',1659.39,2765.66,9),
   ('2017-01-01','2017-12-31',2765.67,5531.31,11),
   ('2017-01-01','2017-12-31',5531.32,999999,0)

--CARGA PARAMETROS IRPF

--DELETE FROM PARAM_IRRF
 INSERT INTO PARAM_IRRF VALUES 
 ('2017-01-01','2017-12-31',0,1903.98,0,0),
 ('2017-01-01','2017-12-31',1903.99,2826.65,7.5,142.80),
 ('2017-01-01','2017-12-31',2826.66,3751.05,15,354.80),
 ('2017-01-01','2017-12-31',3751.06,4664.68,22.5,636.13),
 ('2017-01-01','2017-12-31',4664.68,999999,27.5,869.36)

 
 --ATUALIZANDO TOTAL PEDIDO VENDAS COM BASE NA TAB VENDA ITENS USANDO TABELA VIRTUAL COM O COMANDO WITH

   WITH PED_ITENS(NUM_PEDIDO,TOTAL) AS
   (
	   SELECT A.NUM_PEDIDO,SUM(A.QTD*A.VAL_UNIT) TOTAL
	   FROM PED_VENDAS_ITENS A
	   GROUP BY A.NUM_PEDIDO
   )
   UPDATE PED_VENDAS SET TOTAL_PED=B.TOTAL 
   FROM PED_VENDAS A
   INNER JOIN PED_ITENS B
   ON A.NUM_PEDIDO=B.NUM_PEDIDO