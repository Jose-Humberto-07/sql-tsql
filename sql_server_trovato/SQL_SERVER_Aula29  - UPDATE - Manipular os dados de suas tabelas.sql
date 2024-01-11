--UPDATE
--Aula 29

--Alteração dos dados armazenado em uma tabela
----------------------------------------------

select *
  into tbTemp 
  from alunos;

select * from tbtemp;

update tbTemp
   set sexo = 'M';

drop table tbtemp

select *
  into tbTemp 
  from alunos;

select * from tbTemp where sexo is null;

update tbTemp
   set sexo = 'F'
 where id_aluno between 210 and 215;

update tbTemp  
   set sexo = 'M'
 where id_aluno in (391, 392, 393)
   and sexo is null;

update tbTemp 
   set sexo = null
 where id_aluno = 391;

 UPDATE tbTemp  
    SET SEXO = LOWER(SEXO),
	    NOME = UPPER(NOME)
 WHERE ID_ALUNO BETWEEN 200 AND 290;

 SELECT * FROM TBTEMP 
  WHERE ID_ALUNO BETWEEN 190 AND 300;

UPDATE TBTEMP SET SEXO = UPPER(SEXO), NOME = UPPER(NOME);

DROP TABLE TBTEMP;


