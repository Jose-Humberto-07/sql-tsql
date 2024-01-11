--SQL SERVER 
--Aula 14 - Operações de agregação no Select

--Inscreva-se, curta e compartilhe os vídeos!

--Ganho com turmas
--1º Quanto paga cada aluno

select c.nome_curso, t.id_turma, at.valor Valor_bruto,
       at.valor * at.valor_desconto Valor_desconto,
	   at.valor - (at.valor * at.valor_desconto) Valor_Liquido
  from Turmas t
       inner join AlunosxTurmas at on at.id_turma = t.id_turma
	   inner join Cursos c on c.id_curso = t.id_curso

--2º Somatória
select c.nome_curso, sum(at.valor) Valor_bruto,
       sum(at.valor * at.valor_desconto) Valor_desconto,
	   sum(at.valor - (at.valor * at.valor_desconto)) Valor_Liquido
  from Turmas t
       inner join AlunosxTurmas at on at.id_turma = t.id_turma
	   inner join Cursos c on c.id_curso = t.id_curso
 group by c.nome_curso

 --3º Somatório por curso x turma
select c.nome_curso, at.id_turma, sum(at.valor) Valor_bruto,
       sum(at.valor * at.valor_desconto) Valor_desconto,
	   sum(at.valor - (at.valor * at.valor_desconto)) Valor_Liquido
  from Turmas t
       inner join AlunosxTurmas at on at.id_turma = t.id_turma
	   inner join Cursos c on c.id_curso = t.id_curso
 group by c.nome_curso,  at.id_turma

  --4º Arredondamento dos valores
select c.nome_curso, at.id_turma, sum(at.valor) Valor_bruto,
       round(sum(at.valor * at.valor_desconto),0) Valor_desconto,
	   round(sum(at.valor - (at.valor * at.valor_desconto)),0) Valor_Liquido
  from Turmas t
       inner join AlunosxTurmas at on at.id_turma = t.id_turma
	   inner join Cursos c on c.id_curso = t.id_curso
 group by c.nome_curso,  at.id_turma

  --5º Ganhos por ano
select year(t.data_inicio) ano,
       sum(at.valor) Valor_bruto,
       round(sum(at.valor * at.valor_desconto),2) Valor_desconto,
	   round(sum(at.valor - (at.valor * at.valor_desconto)),2) Valor_Liquido
  from Turmas t
       inner join AlunosxTurmas at on at.id_turma = t.id_turma
	   inner join Cursos c on c.id_curso = t.id_curso
 group by year(t.data_inicio)

 -- Próxima: funções de data
 
	   select * from dbo.turmas
	   select * from dbo.AlunosxTurmas