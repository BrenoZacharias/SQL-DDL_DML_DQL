CREATE DATABASE escola
GO
USE escola
GO
CREATE TABLE Aluno (
	ra		INT				PRIMARY KEY,
	nome	VARCHAR(100),
	idade	INT										CHECK(idade > 0)
)
GO
CREATE TABLE Disciplina (
	codigo			INT				PRIMARY KEY,
	nome			VARCHAR(80),
	carga_horaria	INT								CHECK(carga_horaria >= 32)
)
GO
CREATE TABLE Aluno_Disciplina (
	Alunora				INT,
	Disciplinacodigo	INT,
	FOREIGN KEY (Alunora)			REFERENCES Aluno,
	FOREIGN KEY (Disciplinacodigo)	REFERENCES Disciplina,
	PRIMARY KEY (Alunora, Disciplinacodigo)
)
GO
CREATE TABLE Curso (
	codigo	INT			PRIMARY KEY,
	nome	VARCHAR(50),
	area	VARCHAR(100)
)
GO
CREATE TABLE Curso_Disciplina (
	Cursocodigo			INT,
	Disciplinacodigo	INT,
	FOREIGN KEY (Cursocodigo)		REFERENCES Curso,
	FOREIGN KEY (Disciplinacodigo)	REFERENCES Disciplina,
	PRIMARY KEY (Cursocodigo, Disciplinacodigo)
)
GO
CREATE TABLE Titulacao (
	codigo INT			PRIMARY KEY,
	titulo	VARCHAR(40)	
)
GO
CREATE TABLE Professor (
	registro	INT				PRIMARY KEY,
	nome		VARCHAR(100),
	titulacao	INT,
	FOREIGN KEY (titulacao) REFERENCES Titulacao
)
GO
CREATE TABLE Disciplina_Professor (
	Disciplinacodigo	INT,
	Professorregistro	INT,
	FOREIGN KEY (Disciplinacodigo) REFERENCES Disciplina,
	FOREIGN KEY (Professorregistro) REFERENCES Professor, 
	PRIMARY KEY (Disciplinacodigo, Professorregistro)
)