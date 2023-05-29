Insert into turma values (20191, '00001', 2, '04', 50);
insert into profturma values (20191, '00001', 2, '04', 1);

-- CRIAR PROCEDURE QUE:

-- Liste os códigos dos professores com título denominado 'Doutor' que não ministraram aulas em 2019/1.
-- Caso nao existam professores dar uma mensagem de erro usando um dos métodos para o tratamento de Exceções.
DROP PROCEDURE ExTratamentoException;
DROP TABLE temp_prof;

DELIMITER $$
CREATE PROCEDURE ExTratamentoException()
BEGIN 
	DECLARE ministrouNoAnoDeterminado INT DEFAULT TRUE;
    DECLARE codProf, anoSem INT;
    DECLARE aux INT DEFAULT 0;
    DECLARE done INT DEFAULT FALSE;
    DECLARE C1 CURSOR FOR
		SELECT p.codprof FROM professor p, titulacao t, profturma pt
		WHERE (p.codtit=t.codtit) AND (t.nometit='Doutor') AND (p.CodProf=pt.CodProf) AND (pt.anoSem!='20191');
	DECLARE CONTINUE HANDLER FOR NOT FOUND 
    BEGIN 
		SET done = TRUE;
	END;
    OPEN C1;
    FETCH C1 INTO codProf;
    IF done THEN 
		SELECT 'Nenhum Professor encontrado' Mensagem;
    ELSE
		CREATE TEMPORARY TABLE temp_prof(
			cod_prof INT
		);
		loop_cursor:LOOP
			IF done THEN 
				LEAVE loop_cursor;
			END IF;
		INSERT INTO temp_prof (cod_prof) VALUES (codProf);
		FETCH C1 INTO codProf;
		END LOOP;
    SELECT cod_prof FROM temp_prof;
	END IF;
    CLOSE C1;
END $$
DELIMITER ;

CALL ExTratamentoException();

