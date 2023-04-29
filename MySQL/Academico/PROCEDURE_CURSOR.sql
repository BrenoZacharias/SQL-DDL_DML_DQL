DROP PROCEDURE selectQtdDiscDepto
DELIMITER //
CREATE PROCEDURE selectQtdDiscDepto()
BEGIN
	DECLARE QtdDiscDepto INT;
    DECLARE CodigoDepto CHAR(5);
    
	DECLARE done INT DEFAULT 0;
	DECLARE C1 CURSOR FOR
		SELECT count(d.CodDepto) AS 'QtdDiscDepto', d.CodDepto FROM disciplina d
		GROUP BY d.CodDepto;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    OPEN C1;
    WHILE (done != 1) DO
		FETCH C1 INTO QtdDiscDepto, CodigoDepto;
        SELECT QtdDiscDepto, CodigoDepto;
	END WHILE;
    CLOSE C1;
END //

DELIMITER ;

CALL selectQtdDiscDepto();