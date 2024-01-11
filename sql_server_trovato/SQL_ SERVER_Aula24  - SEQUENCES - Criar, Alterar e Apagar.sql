--SEQUENCES
--Aula 24
  
--O que são sequences
--Como cria-las
--Alterar sequences
--Apagar sequences
--Restartar o contador das sequences

select * from Alunos;

select max(id_aluno) + 1 from Alunos;

---------------

CREATE SEQUENCE seq_Teste01;

SELECT NEXT VALUE FOR seq_Teste01;

--TIPOS DE INSCREMENTO
/*
tinyint – intervalo de 0 a 255
smallint – intervalo de -32.768 a 32.767
int – intervalo de -2.147.483.648 a 2.147.483.647
bigint – intervalo -9.223.372.036.854.775.808 a 9.223.372.036.854.775.807 ** PADRÃO
decimal e numeric com uma escala de 0.
*/

CREATE SEQUENCE seq_Teste02
     AS NUMERIC
	 START WITH 1
	 INCREMENT BY 1;

SELECT NEXT VALUE FOR seq_Teste02;

CREATE SEQUENCE seq_Teste03
     START WITH 100
	 INCREMENT BY -1;

DROP SEQUENCE seq_Teste03;

SELECT NEXT VALUE FOR seq_Teste03;


--VALORES MÍNIMOS E MÁXIMOS

CREATE SEQUENCE seq_Teste04
	 START WITH 1
	 INCREMENT BY 1
	 MINVALUE 1
	 MAXVALUE 1000
	 CYCLE
	 CACHE 3;





--ALTERAR UMA SEQUENCE

ALTER SEQUENCE seq_Teste04
    RESTART WITH 100
	MAXVALUE 10000
	NO CACHE;

SELECT NEXT VALUE FOR seq_Teste04;

--CONSULTAR SEQUENCE
select last_used_value from sys.sequences where name = 'seq_Teste04';
select * from sys.sequences

--APAGAR SEQUENCE

DROP SEQUENCE seq_Teste04;


--REINICiAR A SEQUENCE
ALTER SEQUENCE seq_Teste04 RESTART WITH 100;

SELECT NEXT VALUE FOR seq_Teste04;


--Teste para alunos

DECLARE @vIDAluno int;
    SET @vIDAluno = next value for seq_teste04;

	insert ... 
	@vIDAluno;