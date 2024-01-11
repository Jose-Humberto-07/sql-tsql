 ____   ___  _       ____  _____ ______     _______ ____  
/ ___| / _ \| |     / ___|| ____|  _ \ \   / / ____|  _ \ 
\___ \| | | | |     \___ \|  _| | |_) \ \ / /|  _| | |_) |
 ___) | |_| | |___   ___) | |___|  _ < \ V / | |___|  _ < 
|____/ \__\_\_____| |____/|_____|_| \_\ \_/  |_____|_| \_\

--Aula Extra 002

CREATE TABLE dbo.Tabela_A(
	id int not null,
	valor decimal(12,2),
	inserido_por varchar(8),
	inserido_em datetime
);

--Plano de Execução A
SELECT * FROM dbo.Tabela_A;  
DROP TABLE dbo.Tabela_A;

CREATE TABLE dbo.Tabela_B(
	id int not null primary key,
	valor decimal(12,2),
	inserido_por varchar(8),
	inserido_em datetime
);

--Plano de Execução B
SELECT * FROM dbo.Tabela_B;
DROP TABLE dbo.Tabela_B;

--Criação das tabelas
USE SQL_DB_1;

SELECT * FROM dbo.Tabela_Principal;

SELECT * INTO dbo.Tabela_C From dbo.Tabela_Principal where 1 = 0;
SELECT * FROM dbo.Tabela_C;

DROP TABLE dbo.Tabela_C;

SELECT * INTO dbo.Tabela_C From dbo.Tabela_Principal

CREATE INDEX idx_idPrincipal ON dbo.Tabela_Principal(id);

SELECT * FROM dbo.Tabela_Principal;
DROP INDEX dbo.Tabela_Principal.idx_idPrincipal;
create index idx_Valor on dbo.Tabela_Principal(valor);

--1.000.000
SELECT * FROM DBO.Tabela_A;

SELECT * INTO dbo.Tabela_A From dbo.Tabela_Principal;
SELECT * INTO dbo.Tabela_B From dbo.Tabela_Principal where id between 100000 and 200000;
SELECT * INTO dbo.Tabela_C From dbo.Tabela_Principal where id between 7777 and 17777;

DELETE FROM dbo.Tabela_A;

DROP TABLE dbo.Tabela_A;
DROP TABLE dbo.Tabela_B;
DROP TABLE dbo.Tabela_C;

SET STATISTICS TIME ON;

--Atenção à ordem dos valores
SELECT VALOR FROM DBO.Tabela_Principal;
CREATE INDEX idx1_Valor on dbo.Tabela_Principal(valor);

drop index dbo.Tabela_Principal.idx1_Valor;

--Tabela 2
--Criar tabela de dados DB2
select * from dbo.Tabela_B;

create index idx_id on dbo.Tabela_B(id);
select id  from dbo.Tabela_B;

create index idx_valor on dbo.Tabela_B(valor);
select id, valor from dbo.Tabela_B order by 1 asc;

create index idx_id_vl on dbo.Tabela_B(id, valor);
select id, valor from dbo.Tabela_B order by 1 desc;
select valor, id from dbo.Tabela_B order by 1 desc;

DROP INDEX dbo.Tabela_B.idx_id;
DROP INDEX dbo.Tabela_B.idx_valor;
DROP INDEX dbo.Tabela_B.idx_id_vl;


insert into dbo.Tabela_B (id, valor, inserido_por, inserido_em) values (1, 1*1.1, 'trovato', getdate());
delete from dbo.Tabela_B;

-------------------------------------------
/*
declare @vMaxID int;

  BEGIN
	 select @vMaxID = max(id) + 14  from dbo.tbOrdemServico;
  END

  while (@vMaxID <= 22000)
 
  BEGIN

	insert into dbo.tbOrdemServico
	(id, cliente, cidade, uf, mecanico, servico, valor_os, 
	 forma_pgto, nascimento, valor_servico, data_entrada, data_saida)
	select 
	id + @vMaxID,cliente, cidade, uf, mecanico, servico, valor_os * 1.25, 
	 forma_pgto, nascimento, valor_servico * 1.25, data_entrada, data_saida
	from dbo.tbOrdemServico;
	
	if @vMaxID = 22000
		BREAK
    set @vMaxID = @vMaxID + 1
END

select count(*) from tbOrdemServico
select max(id) from tbOrdemServico;
*/
-------------------------------------------
/*
select * into dbo.Tabela_D
from dbo.tbOrdemServico;
*/

--DICA 1 : Primary Key e o tipo de Index Criado (Clustered / NonClustered)

select id 
  from dbo.Tabela_D os 
 where cliente = 'Fernanda Frota'

select cliente 
  from dbo.Tabela_D 
 where cliente = 'FERNANDA FROTA';

CREATE INDEX idx_Cliente on dbo.Tabela_D(CLIENTE);

DROP INDEX dbo.Tabela_D.idx_Cliente;

--EXEMPLO 2

USE AdventureWorks;

select * from dbo.testeX;

--Diferenças no plano de execução com índice / Método Lookup

SELECT * FROM dbo.testeX;
SELECT distinct ProductID FROM dbo.testeX x WHERE ProductID = 774;

SET STATISTICS TIME ON;

CREATE INDEX idx_RowGuid ON dbo.testex(rowguid);

SELECT * FROM dbo.testeX x WHERE rowguid = '18B1E281-BBBE-43CD-B075-2C3DA595DCBB';

DROP INDEX dbo.testeX.idx_RowGuid;

SELECT * FROM dbo.testeX x WHERE rowguid = '18B1E281-BBBE-43CD-B075-2C3DA595DCBB';

--Ativar estatísticas de execução

SET STATISTICS TIME ON;
SET STATISTICS TIME OFF;

--1
DROP INDEX dbo.testeX.idx_RowGuide;
--2
SELECT * FROM dbo.testeX x WHERE ROWGUID = '18B1E281-BBBE-43CD-B075-2C3DA595DCBB';
--3
CREATE INDEX idx_RowGuide ON dbo.testex(RowGuid);
--4
SELECT productID FROM dbo.testeX x where ROWGUID = '18B1E281-BBBE-43CD-B075-2C3DA595DCBB';