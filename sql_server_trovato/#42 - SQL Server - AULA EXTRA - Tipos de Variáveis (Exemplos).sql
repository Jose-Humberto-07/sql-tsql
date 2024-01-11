--Exemplos de Tipos de Dados

CREATE TABLE dbo.TiposINT
(  
  BigIntCol   BIGINT,
  IntCol      INT,
  SmallIntCol SMALLINT,
  TinyIntCol  TINYINT
); 

select * from dbo.TiposINT;

insert into dbo.TiposINT (BigIntCol, IntCol, SmallIntCol, TinyIntCol) 
     values (9223372036854775807, 2147483647, 32767, 254);

delete from dbo.TiposINT;
drop table dbo.tiposInt;

CREATE TABLE dbo.TipoBIT(
    BitCol BIT
);

insert into dbo.TipoBIT(BitCol) values (5);
select * from dbo.tipobit;

CREATE TABLE dbo.TiposNumericos
(  
  DecimalCol DECIMAL(5,2),
  NumericCol NUMERIC(10,5)
);  

drop table dbo.TiposNumericos;

insert into dbo.TiposNumericos (DecimalCol, NumericCol)
     values (500,99.11444444);

select * from dbo.TiposNumericos;

--DATE E TIME

CREATE TABLE dbo.TiposDataHora(
   TimeCol TIME,
   DateCol DATE,
   DateTimeCol DATETIME,
   DateTimeOffSetCol DATETIMEOFFSET
);

drop table dbo.TiposDataHora;

insert into dbo.TiposDataHora (timecol, DateCol, DateTimeCol, DateTimeOffSetCol)
     values ('12:30:00', 
	         '2020-12-26', 
			 '2020-12-26T10:00:00.000', 
			 '2020-12-26 12:45:37.1234567 +10:00');

select * from dbo.tiposDataHora;

delete from dbo.TiposDataHora;
	 