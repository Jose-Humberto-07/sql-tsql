--INSERT em tabelas
--Aula 25
 
--Insert com descrição dos campos
--Insert para uma nova tabela
--Insert com select

select * from alunos;
select max(id_aluno) from alunos;
select max(id_aluno) + 1 from alunos;

CREATE SEQUENCE seq_tbAlunos
       START WITH 794
	   INCREMENT BY 1;

select next value for seq_tbAlunos;

--Identificar campos em tabelas
exec sp_columns Alunos;

---------------------------------------------
--INSERT com a descrição dos campos
-- Exemplo 1

INSERT INTO dbo.Alunos
      (id_aluno, nome, data_nascimento, 
	   sexo, data_cadastro, login_cadastro)
VALUES
      (next value for dbo.seq_tbAlunos, 'Alessandro Trovato Andrade', '11/11/1972',
	   'M', getdate(), 'ALESS');

select *
  from Alunos
 where data_cadastro >= CONVERT(date,getdate());

-- Exemplo 2

EXEC SP_COLUMNS CURSOS;

SELECT * FROM CURSOS;

INSERT INTO Cursos
    (ID_CURSO, NOME_CURSO, DATA_CADASTRO, LOGIN_CADASTRO)
VALUES
    (12, 'VBA Avançado I', getdate(), 'ALESS');

-- Exemplo 3
SELECT * FROM CURSOS;

DECLARE @vID int;
SELECT @vID = max(id_curso) + 1 from dbo.Cursos;

INSERT INTO Cursos
      (id_curso, nome_curso, data_cadastro, login_cadastro)
VALUES
      (@vID, 'VBA Avançado II', getdate(), 'ALESS');

--INSERT com a criação de uma nova tabela

SELECT *
  INTO dbo.tbNova
  FROM dbo.CURSOS;

select * from dbo.tbNova;

DROP TABLE DBO.nova_Tabela;
DROP TABLE dbo.tbNova;

--INSERT COM SELECT
DELETE FROM dbo.tbNova;

exec sp_columns tbNova;

select * from dbo.tbNova;

INSERT INTO tbNova
      (id_curso, nome_curso, data_cadastro, login_cadastro)
SELECT id_curso,
       nome_curso,
	   getdate(),
	   'TROVATO'
  FROM cursos
 WHERE id_curso > 5;

 select * from dbo.tbNova;

 DELETE FROM dbo.tbNova;

 INSERT INTO tbNova (id_curso, nome_curso, data_cadastro, login_cadastro) 
 SELECT * from cursos WHERE nome_curso like '%VBA%';

 select * from dbo.tbNova;