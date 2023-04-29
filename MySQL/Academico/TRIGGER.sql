CREATE TABLE LOG(
	CodUsuario VARCHAR(50),
	CodProf INT,
    TipoAlteracao CHAR(6),
    DataHora DATETIME
);

DELIMITER $$
CREATE TRIGGER updateProfessor
AFTER UPDATE 
ON Professor
FOR EACH ROW
BEGIN
	DECLARE usuario VARCHAR(50);
    DECLARE dataHora DATETIME; 
    SELECT NOW() INTO dataHora;
    SELECT CURRENT_USER INTO usuario;
	INSERT INTO LOG 
    VALUES(usuario, new.CodProf, 'UPDATE', dataHora);
END $$

update professor
set nomeprof='Saro'
where codprof=4;

DELIMITER $$
CREATE TRIGGER deleteProfessor
AFTER DELETE 
ON Professor
FOR EACH ROW
BEGIN
	DECLARE usuario VARCHAR(50);
    DECLARE dataHora DATETIME; 
    SELECT NOW() INTO dataHora;
    SELECT CURRENT_USER INTO usuario;
	INSERT INTO LOG 
    VALUES(usuario, old.CodProf, 'DELETE', dataHora);
END $$

delete from professor
where codprof=4;

select * from log