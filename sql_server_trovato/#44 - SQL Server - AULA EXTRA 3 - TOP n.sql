/* ____   ___  _       ____  _____ ______     _______ ____  
  / ___| / _ \| |     / ___|| ____|  _ \ \   / / ____|  _ \ 
  \___ \| | | | |     \___ \|  _| | |_) \ \ / /|  _| | |_) |
   ___) | |_| | |___   ___) | |___|  _ < \ V / | |___|  _ < 
  |____/ \__\_\_____| |____/|_____|_| \_\ \_/  |_____|_| \_\ */ 

--Aula Extra 003 | TOP N

USE AdventureWorks;

SELECT * FROM Sales.SalesOrderDetail;

SELECT TOP (10) S.productID, P.Name
  FROM Sales.SalesOrderDetail S
       INNER JOIN Production.Product P on (P.ProductID = S.ProductID);

SELECT DISTINCT TOP (10) S.productID, P.Name
  FROM Sales.SalesOrderDetail S
       INNER JOIN Production.Product P on (P.ProductID = S.ProductID);

SELECT DISTINCT TOP (10) S.productID, P.Name
  FROM Sales.SalesOrderDetail S
       INNER JOIN Production.Product P on (P.ProductID = S.ProductID)
 ORDER BY P.NAME;

 SELECT * FROM Sales.SalesOrderDetail;

 SELECT PRODUCTID, SUM(LINETOTAL) TOTAL
   FROM Sales.SalesOrderDetail
  GROUP BY ProductID
  ORDER BY 2;

SELECT TOP (3) S.PRODUCTID, SUM(LINETOTAL) TOTAL
   FROM Sales.SalesOrderDetail S
        INNER JOIN Production.Product P on (P.ProductID = S.ProductID)
  GROUP BY S.ProductID
  ORDER BY 2 DESC;

-- MAIOR VENDA
  SELECT TOP (1) MAX(S.LINETOTAL) TOTAL, P.NAME, SC.NAME
    FROM Sales.SalesOrderDetail S
	     INNER JOIN Production.Product P on (P.ProductID = S.ProductID)
		 INNER JOIN Production.ProductSubcategory SC on (SC.ProductSubcategoryID = P.ProductSubcategoryID)
   WHERE P.ProductSubcategoryID = 2
   GROUP BY P.NAME, SC.NAME

   UNION

   SELECT TOP (1) MAX(S.LINETOTAL) TOTAL, P.NAME, SC.NAME
    FROM Sales.SalesOrderDetail S
	     INNER JOIN Production.Product P on (P.ProductID = S.ProductID)
		 INNER JOIN Production.ProductSubcategory SC on (SC.ProductSubcategoryID = P.ProductSubcategoryID)
   WHERE P.ProductSubcategoryID = 1
   GROUP BY P.NAME, SC.NAME

-- MAIOR TOTALIZADOR DE VENDAS POR SUBCATEGORIA

  SELECT TOP (1) SUM(S.LINETOTAL) TOTAL, P.NAME, SC.NAME
    FROM Sales.SalesOrderDetail S
	     INNER JOIN Production.Product P on (P.ProductID = S.ProductID)
		 INNER JOIN Production.ProductSubcategory SC on (SC.ProductSubcategoryID = P.ProductSubcategoryID)
   WHERE P.ProductSubcategoryID = 2
   GROUP BY P.NAME, SC.NAME

   UNION

   SELECT TOP (1) SUM(S.LINETOTAL) TOTAL, P.NAME, SC.NAME
    FROM Sales.SalesOrderDetail S
	     INNER JOIN Production.Product P on (P.ProductID = S.ProductID)
		 INNER JOIN Production.ProductSubcategory SC on (SC.ProductSubcategoryID = P.ProductSubcategoryID)
   WHERE P.ProductSubcategoryID = 1
   GROUP BY P.NAME, SC.NAME
   

-- MENOR VENDAS POR SUBCATEGORIA

  SELECT TOP (1) MIN(S.LINETOTAL) TOTAL, P.NAME, SC.NAME
    FROM Sales.SalesOrderDetail S
	     INNER JOIN Production.Product P on (P.ProductID = S.ProductID)
		 INNER JOIN Production.ProductSubcategory SC on (SC.ProductSubcategoryID = P.ProductSubcategoryID)
   WHERE P.ProductSubcategoryID = 2
   GROUP BY P.NAME, SC.NAME

   UNION

   SELECT TOP (1) MIN(S.LINETOTAL) TOTAL, P.NAME, SC.NAME
    FROM Sales.SalesOrderDetail S
	     INNER JOIN Production.Product P on (P.ProductID = S.ProductID)
		 INNER JOIN Production.ProductSubcategory SC on (SC.ProductSubcategoryID = P.ProductSubcategoryID)
   WHERE P.ProductSubcategoryID = 1
   GROUP BY P.NAME, SC.NAME