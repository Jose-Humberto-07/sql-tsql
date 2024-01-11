--Aula 62 - SQL Server
--SET LANGUAGE PORTUGU�S / INGL�S
--Especifica o ambiente de idioma para a sess�o. 
--O idioma da sess�o determina os formatos de datetime e as mensagens do sistema.
--Fonte: https://docs.microsoft.com/pt-br/sql/t-sql/statements/set-language-transact-sql?view=sql-server-ver16
-------------------------------------

set language 'English';
select @@LANGUAGE;

set language 'Portugu�s (Brasil)';
select @@LANGUAGE;

select datename(weekday, getdate());
select datename(month, getdate());

set language 'English';

select datename(weekday, getdate());
select datename(month, getdate());

set language 'Portugu�s (Brasil)';
select @@LANGUAGE;

insert into trovato.tb04_Pessoas (id_pessoa, nome, sobrenome, dt_nasc, cpf)
values (8, 'Teste', 'Sobrenome', '15/10/2022', '11122233344');

select * from trovato.tb04_Pessoas;

set language 'English';

insert into trovato.tb04_Pessoas (id_pessoa, nome, sobrenome, dt_nasc, cpf)
values (9, 'Teste', 'Sobrenome', '10/15/2022', '11122233344');