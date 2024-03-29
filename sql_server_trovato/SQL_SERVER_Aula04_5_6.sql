CREATE TABLE ALUNOS
(
	ID_ALUNO INT PRIMARY KEY NOT NULL,
	NOME VARCHAR(200) NOT NULL,
	DATA_NASCIMENTO DATE NOT NULL,
	SEXO VARCHAR(1), --M PARA MASCULINO OU f PARA FEMININO
	DATA_CADASTRO DATETIME NOT NULL,
	LOGIN_CADASTRO VARCHAR(15) NOT NULL
);


--DROP TABLE ALUNOS;

CREATE TABLE SITUACAO
(
	ID_SITUACAO INT PRIMARY KEY NOT NULL,
	SITUACAO VARCHAR(25) NOT NULL,
	DATA_CADASTRO DATETIME,
	LOGI_CADASTRO VARCHAR(15)
);


CREATE TABLE CURSOS 
(
	ID_CURSO INT PRIMARY KEY NOT NULL,
	NOME_CURSO VARCHAR(200) NOT NULL,
	DATA_CADASTRO DATETIME NOT NULL,
	LOGIN_CADASTRO VARCHAR(15) NOT NULL
);

CREATE TABLE TURMAS
(
	ID_TURMA INT PRIMARY KEY NOT NULL,
	ID_ALUNO INT NOT NULL,
	ID_CURSO INT NOT NULL,
	VALOR_TURMA NUMERIC(15,2) NOT NULL,
	DESCONTO NUMERIC(3,2) NOT NULL,
	DATA_INICIO DATE NOT NULL,
	DATA_TERMINO DATE,
	DATA_CADASTRO DATETIME NOT NULL,
	LOGIN_CADASTRO VARCHAR(15)
);

CREATE TABLE REGISTRO_PRESENCA
(
	ID_TURMA INT NOT NULL,
	ID_ALUNO INT NOT NULL,
	ID_SITUACAO INT NOT NULL,
	DATA_PRESENCA DATE NOT NULL,
	DATA_CADASTRO DATE NOT NULL,
	LOGIN_CADASTRO VARCHAR(15) NOT NULL
);

/*
DROP TABLE ALUNOS;
DROP TABLE CURSOS;
DROP TABLE REGISTRO_PRESENCA;
DROP TABLE SITUACAO;
DROP TABLE TURMAS;
*/

