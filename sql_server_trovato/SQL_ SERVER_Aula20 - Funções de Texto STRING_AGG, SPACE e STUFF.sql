--FUNÇÕES DE TEXTO NO SQL SERVER - Parte 04
--Aula 20

-- Funções: SPACE, STRING_AGG e STUFF

--SPACE

select 'Alessandro' + space(25);
select 'Alessandro' + space(25) + 'x';

declare @vNome varchar(50);
    set @vNome = 'Alessandro Trovato';
 select @vnome + space(50 - len(@vnome));

select A.nome + space(60 - len(A.nome)) + A.sexo
  from Alunos A;

select A.nome + space(60 - len(A.nome)) + A.sexo, len(nome + space(60 - len(A.NOME)) + a.sexo)
  from Alunos A;

--Porque o resultado da query acima tem o tamanho de 61 caracteres?

--STRING_AGG

--Concatena os valores das expressões de cadeia  de caracteres e coloca os valores do separador
--entre eles. 
--O separador não é adicionado ao final da cadeia de caracteres.
--OBS: Os valores Nulls não são exibidos.

select string_agg(convert(nvarchar(max),sexo), ',') as registro
  from alunos;

select string_agg(convert(nvarchar(max), isnull(sexo,'N')), '-') as registro
  from alunos;

select datepart(year, data_nascimento) as ano, 
       string_agg(convert(nvarchar(max), isnull(sexo,'0')),'-') as registro
  from Alunos
 group by datepart(year, data_nascimento)
 order by 1;

 --within
 select datepart(year, data_nascimento) as ano, 
        string_agg(convert(nvarchar(max), isnull(sexo, '0')),'-') 
		    within group (order by datepart(year, data_nascimento) asc) as registro
   from Alunos
  group by datepart(year, data_nascimento);

  --STUFF

  select stuff('abcdefghi',3,5,'12345');

  declare @vProcura varchar(50);
  declare @vSubstit varchar(30);
      set @vProcura = 'Eu, xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, autorizo ... ';
	  set @vSubstit = 'Alessandro Trovato';

  select stuff(@vProcura,5,30,@vsubstit + space(30 - len(@vSubstit)));
  select stuff(@vProcura,5,30,trim(@vsubstit + space(30 - len(@vSubstit)))) as termo;

	  