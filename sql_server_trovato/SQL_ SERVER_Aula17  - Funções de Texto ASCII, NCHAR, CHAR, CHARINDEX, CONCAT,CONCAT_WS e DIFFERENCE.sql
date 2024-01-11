--FUNÇÕES DE TEXTO NO SQL SERVER - Parte 01
--Aula 17

--Funções: ASCII, NCHAR, CHAR, CHARINDEX, CONCAT, CONCAT_WS, DIFFERENCE

--ASCII
select ascii('a');
select ascii('A');
select ascii('9');
select ascii('Alessandro');

--NCHAR (Converte um códicgo Ascii do tipo int em um valor de caracter)
select nchar(65);
select nchar(97);
select nchar(57);

--CHAR (Converte um códicgo Ascii do tipo int em um valor de caracter)
select char(65);
select char(97);

--CHARINDEX (pesquisa  um caractere em uma sequência de até 8.000 caracteres)
select charindex('a','trovato');
select charindex('a','trovato',6);
select charindex('candido', 'alessandro trovato candido', 1);

select * from alunos;

select a.nome, charindex('Prado', a.nome, 1)
  from alunos a;

select a.nome, charindex('Prado', a.nome, 1)
  from alunos a
 where convert(int, charindex('Prado', a.nome, 1)) > 0;

select a.nome, charindex('Prado', a.nome, 1)
  from alunos a
 where charindex('Prado', a.nome, 1) <> '0';


--CONCAT
select concat('Alessandro',' ', 'Trovato');
select concat('Alessandro', ' || ', 'Trovato');

select 'Alessandro' + ' ' + 'Trovato';

select concat(a.nome, ' - ', c.nome_curso) "Nome do aluno - Curso"
  from alunos a
       inner join AlunosxTurmas at on at.id_aluno = a.id_aluno
	   inner join Turmas t on t.id_turma = at.id_turma
	   inner join Cursos c on c.id_curso = t.id_curso;

--CONCAT_WS
select concat_ws(' - ','Alessandro', 'Trovato', 'Candido');

select concat_ws(' - ', a.nome, c.nome_curso,
                 'Início : ' + convert(char, t.data_inicio),
				 'Término : ' + convert(char, t.data_termino))
  from alunos a
       inner join AlunosxTurmas at on at.id_aluno = a.id_aluno
	   inner join Turmas t on t.id_turma = at.id_turma
	   inner join Cursos c on c.id_curso = t.id_curso;


select concat_ws(' - ', a.nome, c.nome_curso,
                 'Início : ' + trim(convert(char, t.data_inicio)),
				 'Término : ' + trim(convert(char, t.data_termino)))
  from alunos a
       inner join AlunosxTurmas at on at.id_aluno = a.id_aluno
	   inner join Turmas t on t.id_turma = at.id_turma
	   inner join Cursos c on c.id_curso = t.id_curso;

--DIFFERENCE (escala de 0 a 4)
select DIFFERENCE('Alessandro', 'Alexsandro');
select DIFFERENCE('Alessandro', 'Alex');
select DIFFERENCE('Alessandro', 'Sandro');
select DIFFERENCE('Alessandro', 'Excel');
select DIFFERENCE('Alessandro', 'Youtube');

