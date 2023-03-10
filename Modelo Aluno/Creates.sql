CREATE DATABASE Curso;

USE Curso;

CREATE TABLE TB_ESTADO(
SIGLA_ESTADO CHAR(2) NOT NULL,
NOME_ESTADO VARCHAR(40)
);

CREATE TABLE TB_CLASSE(
ID_CLASSE SMALLINT NOT NULL,
ID_ANDAR SMALLINT
);

CREATE TABLE TB_ALUNO(
COD_ALUNO SMALLINT NOT NULL,
NOME_ALUNO VARCHAR(45),
END_ALUNO VARCHAR(100),
SIGLA_ESTADO CHAR(2),
ID_CLASSE SMALLINT
);

CREATE TABLE TB_PROFESSOR (
ID_PROFESSOR CHAR(3) NOT NULL,
NOME_PROFESSOR VARCHAR(25)
);

CREATE TABLE TB_DISCIPLINA(
ID_DISCIPLINA CHAR(3) NOT NULL,
NOME_DISCIPLINA VARCHAR(15),
ID_PROFESSOR_DISCIPLINA CHAR(3),
NOTA_MINIMA_DISCIPLINA SMALLINT
);

CREATE TABLE TB_ALUNO_DISCIPLINA (
COD_ALUNO SMALLINT NOT NULL,
ID_DISCIPLINA CHAR(3) NOT NULL,
NOTA_ALUNO SMALLINT
);
