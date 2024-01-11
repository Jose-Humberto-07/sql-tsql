--DELETE
--Aula 26

--Apagar TODOS os dados de uma tabela
--Apagar dados selecionados 
-------------------------------------------------------

Select *
  into dbo.tbDELETE
  FROM dbo.cursos;

DELETE FROM dbo.tbDELETE;

SELECT * FROM tbDELETE;
  DROP TABLE tbDELETE;

DELETE FROM dbo.tbDELETE 
 WHERE nome_curso like '%Avançado%';

DELETE FROM dbo.tbDELETE 
 WHERE nome_curso = 'VBA I';

--

select *
  INTO AlunosTemp
  FROM Alunos;

select * from AlunosTemp;

--Apagar os alunos que não estão em nenhum curso
--Opção 1
SELECT A.Nome, a.sexo, t.valor
  FROM AlunosTemp A
       INNER JOIN AlunosxTurmas T on T.id_aluno = A.id_aluno;

select * from alunostemp; --638 registros

DELETE FROM AlunosTemp
 WHERE id_aluno not in 
 (
	SELECT a.id_aluno
  	  FROM AlunosTemp A
           INNER JOIN AlunosxTurmas T on T.id_aluno = A.id_aluno
 );

 --Opção 2
SELECT A.Nome, A.sexo
  FROM AlunosTemp A
 WHERE A.id_aluno not in
	(
		select t.id_aluno from AlunosxTurmas t where a.id_aluno = t.id_aluno
	)

DROP TABLE alunostemp;

select *
  INTO AlunosTemp
  FROM Alunos;

--Apagar todos os registros de alunos
--que tenham mais de 30 anos

--1) identificar os registros
SELECT nome,
       datediff(year, data_nascimento, getdate()) as idade,
	   a.sexo
  FROM Alunostemp a
 WHERE datediff(year, data_nascimento, getdate()) > 30
 ORDER BY 2;

--2) Apagar os registros
DELETE FROM AlunosTemp 
 WHERE datediff(year, data_nascimento, getdate()) > 30;

--3) Query unificada

DELETE FROM AlunosTemp
 WHERE ID_ALUNO IN 
     (
		SELECT ID_ALUNO
		  FROM Alunostemp a
		 WHERE datediff(year, data_nascimento, getdate()) > 20
	 );

SELECT * FROM ALUNOSTEMP;

DROP TABLE ALUNOSTEMP;

