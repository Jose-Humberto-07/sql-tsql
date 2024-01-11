--Aula 03
--Function - Consulta do total (R$) de um pedido
------------------------------------------------
--https://www.alessandrotrovato.com.br
------------------------------------------------
use AdventureWorksDW2019;
go

select sum(SalesAmount) as total 
  from dbo.FactInternetSales fis 
 where fis.SalesOrdernumber = 'SO51179';

--Criação da Função
-------------------
CREATE FUNCTION trovato.fn_03_Total_Pedido(@pID as nchar(7))
returns numeric(10,2)
as
BEGIN
	
	if @pID is null return 'Pedido não foi informado!';

	--Declaração das variáveis
	--------------------------
	declare @TotalPedido numeric(10,2);

	--Inicializar a variável
	select @TotalPedido = sum(fis.SalesAmount)
	  from dbo.FactInternetSales fis
	 where fis.SalesOrderNumber = @pID;

	return @TotalPedido;
	
END;

select trovato.fn_03_total_pedido('SO51179') as total_pedido;

drop function trovato.fn_03_total_pedido;

--O uso da função em um select
------------------------------
select top(100)
       fis.SalesOrderNumber,
	   trovato.fn_03_total_pedido(fis.SalesOrderNumber) as total_pedido
  from dbo.FactInternetSales fis
 where trovato.fn_03_total_pedido(fis.SalesOrderNumber) > 3200
   and fis.SalesOrderNumber = 'SO43699'
 order by 1;

