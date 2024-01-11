/*ALTERANDO TABELAS*/

CREATE TABLE TABELA(
	COLUNA1 VARCHAR(30),
	COLUNA2 VARCHAR(30),
	COLUNA3 VARCHAR(30)
);


CREATE TABLE TABELA(
	COLUNA1 PRIMARY KEY AUTO_INCREMENT
);

/*ADICIONANDO UMA CHAVE PRIMARIA(P)*/
ALTER TABLE TABELA
ADD PRIMARY KEY (COLUNA1);

/*ADICIONANDO COLUNA SEM POSIÇÃO. ULTIMA POSICAO*/
ALTER TABLE TABELA
ADD COLUNA VARCHAR(30);

/*ADICIONANDO UMA COLUNA COM POSICAO*/
ALTER TABLE TABLE
ADD COLUMN COLUNA4 VARCHAR(30) NOT NULL UNIQUE
AFTER COLUNA3;

/*MODIFICANDO O TIPO DE UM CAMPO*/
ALTER TABLE TABELA MODIFY COLUNA2 DATA NOT NULL;

--RENOMEANDO O NOME DA TABELA
ALTER TABLE TABELA;
RENAME PESSOA;

CREATE TABELA TIME(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	TIME VARCHAR(30),
	ID_PESSOA VARCHAR(30)
);

--ADICIONANDO CHAVE ESTRANGEIRA (FOREIGN)
ALTER TABLE TIME
ADD FOREIGN KEY(ID_PESSOA)
REFERENCES PESSOA( COLUNA1 );

/*VERIFICAR CHAVES*/
SHOW CREATE TABLE TIME;

/*ORGANIZAÇÃO DE CHAVES - CONSTRAINT (REGRA) E AÇOES DE CONSTRAINTS*/

CREATE TABLE JOGADOR(
	IDJOGADOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30)
);

CREATE TABLE TIMES(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	NOMETIME VARCHAR(30),
	ID_JOGADOR INT,
	FOREIGN KEY(ID_JOGADOR)
	REFERENCES JOGADOR (ID)
);

CREATE TABLE CLIENTE(
	IDCLIENTE INT,
	NOME VARCHAR(30) NOT NULL
);

CREATE TABLE TELEFONE (
	IDTELEFONE INT,
	TIPO CHAR(3) NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT
);


ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY(IDCLIENTE);

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEMFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);

/*VERIFICAR CHAVES*/
SHOW CREATE TABLE TELEFONE;




/*DICIONARIO DE DADOS*/

SHOW DATABASES;

USE INFORMATION_SCHEMA;

STATUS

SHOW TABLES;

DESC TABLE_CONSTRAINTS;

SELECT CONSTRAINT_SCHEMA AS "BANCO",
	   TABLE_NAME AS "TABELA",
	   CONSTRAINT_TYPE AS "TIPO",
	   FROM TABLE_CONSTRAINTS;