USE academico;

DROP PROCEDURE trataChaveDuplicada

DELIMITER $$
CREATE PROCEDURE trataChaveDuplicada()
BEGIN
	DECLARE EXIT HANDLER FOR 1062
    BEGIN
		SELECT 'CHAVE DUPLICADA' MENSAGEM;
	END;
	INSERT INTO predio(codpred, nomepred) VALUES(1, 'teste');
END $$
DELIMITER ;

CALL trataChaveDuplicada()