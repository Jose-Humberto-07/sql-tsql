--Aula 02
--SQL Functions 
--Consultar estoque de produtos
--------------------------------------------
use sql_db_1;
go

CREATE TABLE trovato.tb02_Estoque_Produtos(
	ID_PRODUTO numeric(6) NOT NULL,
	SALDO      numeric(6) NOT NULL DEFAULT 0
);

CREATE TABLE trovato.tb03_Produtos(
	ID_PRODUTO    numeric(6) PRIMARY KEY NOT NULL,
	NOME_PRODUTO  nvarchar(50) NOT NULL,
	SALDO         numeric(6) NOT NULL DEFAULT 0
);

ALTER TABLE trovato.tb02_Estoque_Produtos
	ADD CONSTRAINT fk_produto FOREIGN KEY (id_produto) REFERENCES trovato.tb03_Produtos(id_produto);

INSERT INTO trovato.tb03_Produtos (id_produto, nome_produto) values (1, 'Caneta Vermelha');
INSERT INTO trovato.tb03_Produtos (id_produto, nome_produto) values (2, 'Caneta Azul');
INSERT INTO trovato.tb03_Produtos (id_produto, nome_produto) values (3, 'Lápis');

INSERT INTO trovato.tb02_Estoque_Produtos (id_produto, saldo) values (1, 5);
INSERT INTO trovato.tb02_Estoque_Produtos (id_produto, saldo) values (2, 7);
INSERT INTO trovato.tb02_Estoque_Produtos (id_produto, saldo) values (3, 100);

select * from trovato.tb03_Produtos;
select * from trovato.tb02_Estoque_Produtos;

--Select completo
select e.ID_PRODUTO, 
       p.NOME_PRODUTO,
	   e.SALDO
  from trovato.tb02_Estoque_Produtos e
       inner join trovato.tb03_Produtos p on p.id_produto = e.id_produto;

---------------------------------
CREATE FUNCTION trovato.fn_02_Consulta_Saldo(@pID as numeric(6))
returns nvarchar(100)
as 
BEGIN

	if @pID is null return 'Produto (ID) não foi informado..';

	--Declaração das variáveis
	declare @SaldoAtual   numeric(6);
	declare @NomeProduto  nvarchar(50);
	declare @msgFinal     nvarchar(100);

	--Inicializar variáveis
	select @SaldoAtual  = saldo from trovato.tb02_Estoque_Produtos where id_produto = @pID;
	select @NomeProduto = nome_produto from trovato.tb03_Produtos  where id_produto = @pID;

	--Retorna o saldo 
	set @msgFinal = concat('O saldo do produto ', @NomeProduto, ' é ', @SaldoAtual, ' unidades.');

	return @msgFinal;

END;

drop function trovato.fn_02_Consulta_Saldo;

select trovato.fn_02_Consulta_Saldo(1);

select trovato.fn_02_Consulta_Saldo(prod.id_produto) as Situacao
  from trovato.tb03_Produtos prod;
