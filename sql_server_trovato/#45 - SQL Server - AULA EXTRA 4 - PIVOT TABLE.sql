/* ____   ___  _       ____  _____ ______     _______ ____  
  / ___| / _ \| |     / ___|| ____|  _ \ \   / / ____|  _ \ 
  \___ \| | | | |     \___ \|  _| | |_) \ \ / /|  _| | |_) |
   ___) | |_| | |___   ___) | |___|  _ < \ V / | |___|  _ < 
  |____/ \__\_\_____| |____/|_____|_| \_\ \_/  |_____|_| \_\ */ 

--Aula Extra 004 | Pivot Table

USE sql_db_1;

select * from dbo.tbOrdemServico OS;

select DATEPART(year, data_entrada) ano,
       valor_os
  from dbo.tbOrdemServico;

select datepart(month, data_entrada) mes,
       datepart(year, data_entrada) ano,
	   sum(valor_os) total
  from dbo.tbOrdemServico
 group by datepart(month, data_entrada), datepart(year, data_entrada)
 order by 2, 1;

 --PIVOT

 SELECT DISTINCT DATEPART(YEAR, DATA_ENTRADA) FROM dbo.tbOrdemServico;

 SELECT MES, [2018], [2019], [2020] 
   FROM
     (
	 select DATEPART(MONTH, DATA_ENTRADA) MES, DATEPART(YEAR, DATA_ENTRADA) ANO, VALOR_OS VALOR
	   from dbo.tbOrdemServico
	  ) as ORIGEM
  PIVOT 
  (
    SUM(VALOR)
	FOR ANO IN ([2018], [2019], [2020])
  )
  AS TAB_DINAMICA
  ORDER BY 1;



