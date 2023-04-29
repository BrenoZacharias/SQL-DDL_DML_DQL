CREATE DATABASE Locadora
GO
USE Locadora

CREATE TABLE Estrela (
	id			INT				NOT NULL,
	nome		VARCHAR(50)		NOT NULL
	PRIMARY KEY (id)
)

CREATE TABLE Filme (
	id				INT				NOT NULL,
	titulacao		VARCHAR(40)		NOT NULL,
	ano				INT				NULL			CHECK (ano <= 2021)
	PRIMARY KEY (id)
)

CREATE TABLE Filme_Estrela (
	Filmeid			INT				NOT NULL,
	Estrelaid		INT				NOT NULL,
	FOREIGN KEY (Filmeid) REFERENCES Filme,
	FOREIGN KEY (Estrelaid) REFERENCES Estrela,
	PRIMARY KEY (Filmeid, Estrelaid),
) 

CREATE TABLE DVD (
	num					INT				NOT NULL,
	data_fabricacao		DATE			NOT NULL		CHECK (data_fabricacao < GETDATE()),
	Filmeid				INT				NOT NULL,
	PRIMARY KEY (num),
	FOREIGN KEY (Filmeid) REFERENCES Filme
)

CREATE TABLE Cliente (
	num_cadastro			INT					NOT NULL,
	nome					VARCHAR(70)			NOT NULL,
	logradouro				VARCHAR(150)		NOT NULL,
	num						INT					NOT NULL		CHECK (num > 0),
	cep						CHAR(8)				NULL			CHECK (LEN(CEP) = 8)
	PRIMARY KEY (num_cadastro),
)

CREATE TABLE Locacao (
	DVDnum					INT					NOT NULL,
	Clientenum_cadastro		INT					NOT NULL,
	data_locacao			DATE				NOT NULL		DEFAULT(GETDATE()),
	data_devolucao			DATE				NOT NULL,
	valor					DECIMAL(7,2)		NOT NULL		CHECK (valor > 0),
	CONSTRAINT chk_dt CHECK (data_devolucao > data_locacao),
	FOREIGN KEY (DVDnum) REFERENCES DVD,
	FOREIGN KEY (Clientenum_cadastro) REFERENCES Cliente,
	PRIMARY KEY (DVDnum, Clientenum_cadastro, data_locacao)
)

