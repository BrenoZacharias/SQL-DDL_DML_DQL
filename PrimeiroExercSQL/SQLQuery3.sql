CREATE DATABASE	Clinica

USE Clinica

CREATE TABLE Paciente(
num_beneficiario	int				not null,
nome				varchar(100)	not null,
logradouro			varchar(200)	not null,
numero				int				not null,
cep					char(8)			not null,
complemento			varchar(255),
telefone			varchar(11)		not null, 
PRIMARY KEY(num_beneficiario)
)

CREATE TABLE Medico(
codigo				int				not null,
nome				varchar(100)	not null,
logradouro			varchar(200)	not null,
numero				int				not null,
cep					char(8)			not null,
complemento			varchar(255),
contato				varchar(11)		not null,
PRIMARY KEY (codigo)
)

CREATE TABLE Especialidade(
id					int				not null,
especialidade		varchar(100)	not null
PRIMARY KEY (id)
)

ALTER TABLE Medico
ADD id_especialidade int not null

ALTER TABLE Medico
ADD FOREIGN KEY (id_especialidade) REFERENCES Especialidade (id)

CREATE TABLE Consulta(
num_beneficiario_Paciente	int,
codigo_Medico				int,
data_hora					datetime		not null,
observacao					varchar(255)	not null,
PRIMARY KEY (num_beneficiario_Paciente, codigo_Medico, data_hora),
FOREIGN KEY	(num_beneficiario_Paciente) REFERENCES Paciente (num_beneficiario),
FOREIGN KEY	(codigo_Medico) REFERENCES Medico (codigo)
)

INSERT INTO Paciente
VALUES
(99901, 'Washington Silva', 'R. Anhaia', 150, '02345000', 'Casa', '922229999'),
(99902, 'Luis Ricardo', 'R. Voluntários da Pátria', 2251, '03254010', 'Bloco B. Apto 25', '923450987'),
(99903, 'Maria Elisa', 'Av. Aguia de Haia', 1188, '06987020', 'Apto 1208', '912348765'),
(99904, 'José Araujo', 'R. XV de Novembro', 18, '03678000', 'Casa', '945674312'),
(99905, 'Joana Paula', 'R. 7 de Abril', 97, '01214000', 'Conjunto 3 - Apto 801', '912095674')

INSERT INTO Especialidade
VALUES
(1, 'Otorrinolaringologista'),
(2, 'Urologista'),
(3, 'Geriatra'),
(4, 'Pediatra')

INSERT INTO Medico
VALUES
(100001, 'Ana Paula', 'R. 7 de Setembor', 256, '03698000', 'Casa', '915689456', 1),
(100002, 'Maria Aparecida', 'Av. Brasil', 32, '02145070', 'Casa', '923235454', 1),
(100003, 'Lucas Borges', 'Av. do Estado', 3210, '05241000', 'Apto 205', '963698585', 2),
(100004, 'Gabriel Oliveira', 'Av. Dom Helder Camara', 350, '03145000', 'Apto 602', '932458745', 3)

INSERT INTO Consulta
VALUES
(99901, 100002, '2021-09-04 13:20', 'Infecção Urina'),
(99902, 100003, '2021-09-04 13:15', 'Gripe'),
(99901, 100001, '2021-09-04 12:30', 'Infecção Garganta')

ALTER TABLE Medico
ADD dia_atendimento varchar(8) 

UPDATE Medico
SET dia_atendimento = '2ª Feira'
WHERE codigo = 100001 

UPDATE Medico
SET dia_atendimento = '4ª Feira'
WHERE codigo = 100002

UPDATE Medico
SET dia_atendimento = '2ª Feira'
WHERE codigo = 100003

UPDATE Medico
SET dia_atendimento = '5ª Feira'
WHERE codigo = 100004

ALTER TABLE Medico
ALTER COLUMN dia_atendimento varchar(8) NOT NULL

DELETE Especialidade
where id = 4

EXEC sp_rename 'dbo.Medico.dia_atendimento', 'dia_semana_atendimento', 'COLUMN'

UPDATE Medico
SET logradouro = 'Av. Bras Leme', numero = 876, complemento = 'apto 504', cep = '02122000'
WHERE codigo = 100003

ALTER TABLE Consulta
ALTER COLUMN observacao varchar(200) not null

SELECT * FROM Medico

