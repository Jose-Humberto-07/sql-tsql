--schema
CREATE SCHEMA Trovato;

DROP SCHEMA Trovato;

DROP TABLE Trovato.Parametros;

--Criação de uma tabela Parametros
----------------------------------
CREATE TABLE Trovato.Parametros
(
   ID					int not null,
   NOME_PARAMETRO		varchar(30) not null,
   VALOR_PARAMETRO		money not null,
   ULTIMA_ATUALIZACAO	datetime
);

select * from Trovato.Parametros;

INSERT INTO Trovato.Parametros
(ID, NOME_PARAMETRO, VALOR_PARAMETRO, ULTIMA_ATUALIZACAO)
VALUES
(1, 'Dólar Comercial', 5.71, getdate());

INSERT INTO Trovato.Parametros
(ID, NOME_PARAMETRO, VALOR_PARAMETRO, ULTIMA_ATUALIZACAO)
VALUES
(2, 'Euro', 6.99, getdate());

--VIEWS (Simplicação do processo)
-- INNER JOIN, LEFT JOIN, RIGHT JOIN

--Seleção de dados com variáveis
---------------------------------------------------------------------------
DECLARE @vDolar money;

set @vDolar = (Select valor_parametro from Trovato.Parametros where ID = 1);

--USE AdventureWorks;

select x.Name, avg(x.Total) * @vDolar as Média_Vendas_BDolar from 
    (
	select p.Name, s.OrderQty, s.UnitPrice, s.UnitPriceDiscount, 
		   s.UnitPrice * s.OrderQty total
	  from sales.SalesOrderDetail S
		   inner join Production.Product P on P.ProductID = S.ProductID 
	) x
 group by x.name
 having avg(x.Total) * @vDolar <1000

 --Select direto com o uso dos parâmetros
 ----------------------------------------

SELECT x.Name, tbDolar.dolar, tbEuro.euro,
       avg(x.Total) * tbDolar.Dolar Media_Base_Dolar, 
	   avg(x.Total) * tbEuro.euro Media_Base_Euro
  from 
    (
	select p.Name, s.OrderQty, s.UnitPrice, s.UnitPriceDiscount, 
		   s.UnitPrice * s.OrderQty total
	  from sales.SalesOrderDetail S
		   inner join Production.Product P on P.ProductID = S.ProductID 
	) x,
	(select valor_parametro dolar from Trovato.Parametros where id = 1) tbDolar,
	(select valor_parametro euro  from Trovato.Parametros where id = 2) tbEuro
GROUP BY x.Name, tbDolar.Dolar, tbEuro.euro
 
--CRIAÇÃO DE VIEWS
------------------
CREATE OR ALTER VIEW Trovato.vw_MediaMoedaEstrangeira 
as
SELECT x.Name, tbDolar.dolar, tbEuro.euro,
       avg(x.Total) * tbDolar.Dolar Media_Base_Dolar, 
	   avg(x.Total) * tbEuro.euro Media_Base_Euro
  from 
    (
	select p.Name, s.OrderQty, s.UnitPrice, s.UnitPriceDiscount, 
		   s.UnitPrice * s.OrderQty total
	  from sales.SalesOrderDetail S
		   inner join Production.Product P on P.ProductID = S.ProductID 
	) x,
	(select valor_parametro dolar from Trovato.Parametros where id = 1) tbDolar,
	(select valor_parametro euro  from Trovato.Parametros where id = 2) tbEuro
GROUP BY x.Name, tbDolar.Dolar, tbEuro.euro;

select * from Trovato.vw_MediaMoedaEstrangeira;

select name, sum(Media_base_dolar), sum(Media_base_euro)
  from Trovato.vw_MediaMoedaEstrangeira
 group by name;

 CREATE OR ALTER VIEW Trovato.vw_Param
 AS
 select * from TROVATO.Parametros;

 SELECT * FROM TROVATO.vw_Param

 DROP VIEW Trovato.vw_Param

 ----------------------------------------------
 --Explicação da complexidade de uma query
 ----------------------------------------------

 USE SQL_DB_1;

 SELECT * FROM AlunosxTurmas;
 SELECT * FROM CURSOS;
 SELECT * FROM TURMAS;

 SELECT isnull(at.id_turma,0) ID, c.nome_curso, count(at.id_aluno) Total
   FROM dbo.AlunosxTurmas at
        INNER JOIN dbo.Turmas t on t.id_turma = at.id_turma
		RIGHT JOIN dbo.Cursos c on c.id_curso = t.id_curso
  where AT.id_TURMA IS NULL
  GROUP BY at.id_turma, c.nome_curso
  ORDER BY C.NOME_CURSO;

  --Cursos Sem turmas
  
  CREATE OR ALTER VIEW Trovato.vw_CURSOS_SEM_TURMAS
  as
  SELECT isnull(at.id_turma,0) ID, c.nome_curso CURSO, count(at.id_aluno) TOTAL
   FROM dbo.AlunosxTurmas at
        INNER JOIN dbo.Turmas t on t.id_turma = at.id_turma
		RIGHT JOIN dbo.Cursos c on c.id_curso = t.id_curso
  where AT.id_TURMA IS NULL
  GROUP BY at.id_turma, c.nome_curso

  select * from Trovato.vw_CURSOS_SEM_TURMAS 
   order by Total
  
  
  --Cursos com Turmas

  CREATE OR ALTER VIEW Trovato.vw_CURSOS_COM_TURMAS
  as
  SELECT isnull(at.id_turma,0) ID, c.nome_curso CURSO, count(at.id_aluno) TOTAL
   FROM dbo.AlunosxTurmas at
        INNER JOIN dbo.Turmas t on t.id_turma = at.id_turma
		RIGHT JOIN dbo.Cursos c on c.id_curso = t.id_curso
  where AT.id_TURMA IS NOT NULL
  GROUP BY at.id_turma, c.nome_curso

  select * from Trovato.vw_CURSOS_COM_TURMAS 
   order by CURSO

   SELECT SUM(TOTAL) Total_Alunos FROM trovato.vw_CURSOS_COM_TURMAS