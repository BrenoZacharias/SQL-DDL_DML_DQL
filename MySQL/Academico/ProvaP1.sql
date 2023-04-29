-- BRENO MARCONDES ZACHARIAS
-- PROVA PAR
-- FUNCIONOU
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

ALTER TABLE Predio ADD CONSTRAINT pkPredio PRIMARY KEY(CodPred);

ALTER TABLE Sala ADD CONSTRAINT FK_SALA_RELATION_PREDIO FOREIGN KEY(CodPred) REFERENCES Predio(CodPred);
ALTER TABLE Sala ADD CONSTRAINT pkSala PRIMARY KEY(NumSala, CodPred);

ALTER TABLE Titulacao ADD CONSTRAINT pkTitulacao PRIMARY KEY(CodTit);

ALTER TABLE Depto ADD CONSTRAINT pkCodDepto PRIMARY KEY(CodDepto);

ALTER TABLE Professor ADD CONSTRAINT pkProfessor PRIMARY KEY(CodProf);
ALTER TABLE Professor ADD CONSTRAINT FK_PROFESSOR_RELATION_DEPTO FOREIGN KEY(CodDepto) REFERENCES Depto(CodDepto);
ALTER TABLE Professor ADD CONSTRAINT FK_PROFESSOR_RELATION_TITULACAO FOREIGN KEY(CodTit) REFERENCES Titulacao(CodTit);

ALTER TABLE Disciplina ADD CONSTRAINT FK_DISCIPLI_RELATION_DEPTO FOREIGN KEY(CodDepto) REFERENCES Depto(CodDepto);
ALTER TABLE Disciplina ADD CONSTRAINT pkDisciplina PRIMARY KEY(NumDisc, CodDepto);

ALTER TABLE PreReq ADD CONSTRAINT FK_PREREQ_TEM_PRE_DISCIPLI FOREIGN KEY(NumDisc, CodDepto) REFERENCES Disciplina(NumDisc, CodDepto);
ALTER TABLE PreReq ADD CONSTRAINT FK_PREREQ_EH_PRE_DISCIPLI FOREIGN KEY(NumDiscPreReq, CodDeptoPreReq) REFERENCES Disciplina(NumDisc, CodDepto);
ALTER TABLE PreReq ADD CONSTRAINT pkPreReq PRIMARY KEY(CodDeptoPreReq, NumDiscPreReq, CodDepto, NumDisc);

ALTER TABLE Turma ADD CONSTRAINT FK_TURMA_RELATION_DISCIPLI FOREIGN KEY(NumDisc, CodDepto) REFERENCES Disciplina(NumDisc, CodDepto);
ALTER TABLE Turma ADD CONSTRAINT pkTurma PRIMARY KEY(AnoSem, CodDepto, NumDisc, SiglaTur);

ALTER TABLE ProfTurma ADD CONSTRAINT FK_PROFTURM_PROFTURMA_PROFESSOR FOREIGN KEY(CodProf) REFERENCES Professor(CodProf);
ALTER TABLE ProfTurma ADD CONSTRAINT FK_PROFTURM_PROFTURMA_TURMA FOREIGN KEY(AnoSem, CodDepto, NumDisc, SiglaTur) REFERENCES Turma(AnoSem, CodDepto, NumDisc, SiglaTur);
ALTER TABLE ProfTurma ADD CONSTRAINT pkProfTurma PRIMARY KEY(CodProf, CodDepto, NumDisc, AnoSem, SiglaTur);

ALTER TABLE Horario ADD CONSTRAINT FK_HORARIO_RELATION_TURMA FOREIGN KEY(AnoSem, CodDepto, NumDisc, SiglaTur) REFERENCES Turma(AnoSem, CodDepto, NumDisc, SiglaTur);
ALTER TABLE Horario ADD CONSTRAINT FK_HORARIO_RELATION_SALA FOREIGN KEY(CodPred, NumSala) REFERENCES Sala(CodPred, NumSala);
ALTER TABLE Horario ADD CONSTRAINT pkHorario PRIMARY KEY(AnoSem, CodDepto, NumDisc, SiglaTur, DiaSem, HoraInicio);

-- INSERTS
INSERT INTO PREDIO VALUES
(3, 'Terraço Itália'),
(43423, 'PREDIO 43423'),
(1, 'PREDIO1'),
(2, 'Informática - aulas');

INSERT INTO SALA VALUES
(3, 103, 'Sala 103', 40),
(43423, 101, 'Sala 101', 36),
(1, 1, 'Sala 1', 35),
(1, 101, 'Sala 101', 55),
(2, 101, 'Sala 101', 40);

INSERT INTO TITULACAO VALUES
(1, 'Doutor'),
(2, 'Mestre');

INSERT INTO Depto VALUES
('INF01', 'Informártica'),
('00001', 'Administrativo'),
('00002', 'Financeiro'),
('00003', 'Pessoal'),
('00004', 'Comercial'),
('00005', 'Marketing'),
('00006', 'Produção'),
('00007', 'Jurídico');

INSERT INTO PROFESSOR VALUES 
(1, 'INF01', 1, 'Anderson'),
(2, 'INF01', 1, 'Antunes'),
(3, '00002', 1, 'Felix');

INSERT INTO Disciplina VALUES
('INF01', 1, 'Redes', 3),
('00001', 1, 'Administra', 2),
('00001', 2, 'Gestão', 2),
('00001', 3, 'Supervisão', 2),
('00002', 1, 'Economia', 2);

INSERT INTO PreReq VALUES
('00001', 2, '00001', 1),
('INF01', 1, '00001', 1);

INSERT INTO TURMA VALUES
(20021, '00001', 1, '04', 60),
(20021, '00001', 1, '03', 54),
(20021, 'INF01', 1, '04', 54),
(20021, 'INF01', 1, '03', 50),
(20051, '00002', 1, '01', 36),
(20021, 'INF01', 1, '02', 30),
(20021, 'INF01', 1, '01', 35),
(20021, '00001', 1, '01', 40),
(20021, '00002', 1, '01', 45),
(20021, '00002', 1, '02', 40);

INSERT INTO PROFTURMA VALUES
(20021, '00001', 1, '04', 1),
(20021, '00001', 1, '03', 1),
(20021, 'INF01', 1, '04', 2),
(20021, 'INF01', 1, '03', 2),
(20021, '00002', 1, '02', 1),
(20021, 'INF01', 1, '02', 1),
(20021, 'INF01', 1, '01', 1),
(20021, '00001', 1, '01', 2),
(20021, '00002', 1, '01', 2),
(20051, '00002', 1, '01', 3);

INSERT INTO HORARIO VALUES
(20021, '00001', 1, '04', 2, 10, 103, 3, 40),
(20021, 'INF01', 1, '04', 5, 18, 101, 43423, 50),
(20021, 'INF01', 1, '03', 2, 15, 101, 1, 50),
(20021, 'INF01', 1, '03', 4, 15, 101, 1, 47),
(20021, 'INF01', 1, '02', 4, 15, 101, 1, 50),
(20021, '00002', 1, '02', 4, 8, 101, 2, 38),
(20021, '00002', 1, '01', 3, 13, 1, 1, 40),
(20021, '00001', 1, '01', 2, 10, 1, 1, 40),
(20021, 'INF01', 1, '01', 3, 13, 101, 2, 45);

-- CRIAR PROCEDURE COM CURSOR PARA SELECIONAR O NOME DOS PROFESSORES E O NOME DA Sala,
-- em que lesionam turmas do predio de nome 'terraço itália'

DROP PROCEDURE PROVA
DELIMITER $$
CREATE PROCEDURE PROVA()
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE nome_professor VARCHAR(40);
	DECLARE nome_sala VARCHAR(40);
    DECLARE c1 CURSOR FOR 
		SELECT p.nomeProf, s.descricaoSala FROM sala s
        INNER JOIN horario h
        ON h.numSala=s.numSala AND h.codPred=s.codPred
        INNER JOIN profturma pt
        ON pt.anoSem=h.anoSem AND pt.codDepto=h.codDepto AND pt.numDisc=h.numDisc 
			AND pt.siglaTur=h.siglaTur
		INNER JOIN professor p
        ON p.codProf=pt.codProf
        INNER JOIN predio pred
        ON pred.codPred=s.codPred
		WHERE pred.nomePred = 'Terraço Itália';
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    CREATE TEMPORARY TABLE temp(
		nomeProfessor VARCHAR(40), nomeSala VARCHAR(40)
	);
    OPEN C1;
		loop_cursor: LOOP 
			FETCH C1 INTO nome_professor, nome_sala;
            IF done THEN
				LEAVE loop_cursor;
			END IF;
            INSERT INTO temp VALUES(nome_professor, nome_sala);
		END LOOP;
    CLOSE C1;
    SELECT nomeProfessor, nomeSala FROM temp;
    DROP TABLE temp;
END $$
DELIMITER ;

CALL PROVA();