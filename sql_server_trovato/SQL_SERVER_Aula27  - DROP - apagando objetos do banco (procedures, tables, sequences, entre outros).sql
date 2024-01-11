--DROP
--Aula 27

--Apaga itens do Banco de dados
-------------------------------------------------------

--Apagar Tabelas

select * from sys.tables;

select *
  into tbDELETE
  from cursos;

drop table tbdelete;

select * from tbdelete;

--Apagar Sequences

select * from sys.sequences;

DROP SEQUENCE seq_Teste02;

--Apagar Indices

CREATE INDEX indAlunosTeste ON Alunos(id_aluno);

DROP INDEX Alunos.indAlunosTeste;

--Apagar Procedures

CREATE PROCEDURE prcListaAlunosTeste
AS
     SELECT al.nome, al.data_nascimento
	   FROM alunos al
	  where al.nome like 'G%';

exec prcListaAlunosTeste;

DROP PROCEDURE prcListaAlunosTeste;

--Apagar Constraints

SELECT NAME FROM SYS.key_constraints where name like 'pk%'

select *
  into tbDelete
  from cursos;

select * from tbdelete;

USE sql_db_1;
GO
ALTER TABLE tbDelete
ADD CONSTRAINT pk_idcurso UNIQUE (id_curso);

SELECT NAME FROM SYS.key_constraints where name like 'pk%'

ALTER TABLE tbDelete
 DROP CONSTRAINT pk_idcurso;

--Apaga views
CREATE VIEW vwAlunosTurmasTeste
AS
   SELECT nome, data_nascimento, datediff(year, data_nascimento, getdate()) idade
     from alunos
	where datediff(year, data_nascimento, getdate()) < 18;

select * from vwAlunosTurmasTeste;

DROP VIEW vwAlunosTurmasTeste;

--Apaga banco de dados
CREATE DATABASE dbTesteDrop;

DROP DATABASE dbTesteDrop;