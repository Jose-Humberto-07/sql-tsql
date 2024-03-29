/*ESTRUTURA DE UMA TRIGGER*/


CREATE TRIGGER NOME
BEFORE/BEFORE INSERT/DELETE/UPDATE ON TABELA
FOR EACH ROW (PARA CADA LINHA)

BEGIN -> INICIO

		QUALQUER COISA

END -> FIM


CREATE TABLE USUARIO(
	IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30),
	SENHA VARCHAR(100)
);

CREATE TABLE BKP_USUARIO(
	IDBACHUP INT PRIMARY KEY AUTO_INCREMENT,
	IDUSUARIO INT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30),
);

/*CRIANDO A TRIGGER*/

/*tem que mudar o delimitador que nem nas procedures*/
DELIMITER $
/*new | old*/

CREATE TRIGGER BACKUP_USER
BEFORE TRIGGER BACKUP_USER
BEFORE DELETE ON USUARIO
FOR EACH ROW (PARA CADA LINHA)

BEGIN 

		INSERT INTO BKP_USUARIO VALUES
		(NULL, OLD.IDUSUARIO, OLD.NOME, OLD.LOGIN);

END 
$


/*quando terminar a trigger mudar o delimitador novamente para o ";"*/

INSERT INTO USUARIO VALUES(NULL, 'ANDRADE', 'ANDRADE2009', 'HEXACAMPEAO');

SELECT * FROM USUARIO;

DELETE FROM
 USUARIO WHERE IDUSUARIO = 1;



/*COMUNICACAO ENTRE BANCOS*/



CREATE DATABASE LOJA;

USE LOJA;

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

STATUS

CREATE DATABASE BACKUP;

USE BACKUP;

