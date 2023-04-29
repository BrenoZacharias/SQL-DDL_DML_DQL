-- Retire as FKs entre Disciplina e PreReq. 
-- Agora crie uma trigger que ao inserir um PreReq ela garanta 
-- que a  Disciplina exista

ALTER TABLE PreReq DROP CONSTRAINT FK_PREREQ_TEM_PRE_DISCIPLI;
ALTER TABLE PreReq DROP CONSTRAINT FK_PREREQ_EH_PRE_DISCIPLI;
DROP TRIGGER insertPreReq_inserindoDisciplina
DELIMITER $$
CREATE TRIGGER insertPreReq_inserindoDisciplina
BEFORE INSERT
ON PreReq
FOR EACH ROW
BEGIN
	IF(SELECT count(NumDisc) FROM disciplina WHERE NumDisc=new.NumDisc AND CodDepto=NEW.CodDepto) = 0 THEN
		INSERT INTO Disciplina (CodDepto, NumDisc) VALUES (new.CodDepto, new.NumDisc);
	END IF;
    IF(SELECT count(NumDisc) FROM disciplina WHERE NumDisc=new.NumDiscPreReq AND CodDepto=NEW.CodDeptoPreReq) = 0 THEN
		INSERT INTO Disciplina (CodDepto, NumDisc) VALUES (new.CodDeptoPreReq, new.NumDiscPreReq);
	END IF;
END $$

DROP TRIGGER insertPreReq_ImpedindoInsert
DELIMITER $$
CREATE TRIGGER insertPreReq_ImpedindoInsert
BEFORE INSERT
ON PreReq
FOR EACH ROW
BEGIN
	DECLARE msg VARCHAR(255);
	IF(SELECT count(NumDisc) FROM disciplina WHERE NumDisc=new.NumDisc AND CodDepto=NEW.CodDepto) = 0 THEN
		SET msg = "Disciplina não existe";
        SIGNAL SQLSTATE '45003' SET MESSAGE_TEXT = msg;
	END IF;
    IF(SELECT count(NumDisc) FROM disciplina WHERE NumDisc=new.NumDiscPreReq AND CodDepto=NEW.CodDeptoPreReq) = 0 THEN
		SET msg = "Disciplina não existe";
        SIGNAL SQLSTATE '45003' SET MESSAGE_TEXT = msg;
	END IF;
END $$

select * from prereq;

select * from disciplina
INSERT INTO PreReq VALUES
('INF01', 5, 'INF01', 1);

delete from disciplina
where numdisc=2 AND coddepto='INF01'

delete from disciplina
where numdisc=3 AND coddepto='00001'

-- Tambem caso a Disciplina seja excluida ela valide se existem PreReq. Caso exista PreReq nao permitir a exclusao.
DROP TRIGGER deleteDisciplina
DELIMITER $$
CREATE TRIGGER deleteDisciplina
BEFORE DELETE
ON Disciplina
FOR EACH ROW
BEGIN
	DECLARE msg VARCHAR(255);
	IF(SELECT count(NumDisc) FROM PreReq WHERE NumDisc=old.NumDisc AND CodDepto=old.CodDepto) > 0 THEN
		SET msg = "Disciplina está no PreReq";
        SIGNAL SQLSTATE '45003' SET MESSAGE_TEXT = msg;
	END IF;
    IF(SELECT count(NumDisc) FROM PreReq WHERE NumDiscPreReq=old.NumDisc AND CodDeptoPreReq=old.CodDepto) > 0 THEN
		set msg = "Disciplina está no PreReq";
        SIGNAL SQLSTATE '45003' SET MESSAGE_TEXT = msg;
	END IF;
END $$






