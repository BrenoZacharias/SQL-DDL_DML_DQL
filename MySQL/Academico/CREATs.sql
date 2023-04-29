CREATE DATABASE Academico;
USE Academico;

CREATE TABLE Predio(
	CodPred INT,
    NomePred VARCHAR(40)
);

CREATE TABLE Sala(
	CodPred INT, 
    NumSala INT,
    DescricaoSala VARCHAR(40),
    CapacSala INT
);

CREATE TABLE Horario(
	AnoSem INT, 
    CodDepto CHAR(5),
    NumDisc INT,
    SiglaTur CHAR(2),
    DiaSem INT,
    HoraInicio INT,
    NumSala INT,
    CodPred INT,
    NumHoras INT
);

CREATE TABLE PreReq(
	CodDeptoPreReq CHAR(5),
    NumDiscPreReq INT,
    CodDepto CHAR(5),
    NumDisc INT
);

CREATE TABLE Disciplina(
	CodDepto CHAR(5),
    NumDisc INT,
    NomeDisc VARCHAR(10),
    CreditoDisc INT
);

CREATE TABLE Turma(
	AnoSem INT,
    CodDepto CHAR(5),
    NumDisc INT,
    SiglaTur CHAR(2),
    CapacTur INT
);
    
CREATE TABLE Depto(
	CodDepto CHAR(5),
    NomeDepto VARCHAR(40)
);

CREATE TABLE Professor(
	CodProf INT,
    CodDepto CHAR(5),
    CodTit INT,
    NomeProf VARCHAR(40)
);

CREATE TABLE ProfTurma(
	AnoSem INT,
    CodDepto CHAR(5),
    NumDisc INT,
    SiglaTur CHAR(2),
    CodProf INT
);

CREATE TABLE Titulacao(
	CodTit INT, 
    NomeTit VARCHAR(40)
);