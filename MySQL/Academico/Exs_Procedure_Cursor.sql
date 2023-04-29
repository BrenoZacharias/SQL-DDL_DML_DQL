//Obter os códigos dos diferentes departamentos que tem turmas no ano-semestre 2002/1 

DROP PROCEDURE Ex1
DELIMITER //
CREATE PROCEDURE Ex1(in ano_semes varchar(5))
BEGIN
    DECLARE codigoDepto CHAR(5);
	DECLARE done INT DEFAULT FALSE;
	DECLARE c1 CURSOR FOR
		SELECT DISTINCT t.codDepto FROM turma t 
		WHERE t.anoSem = ano_semes;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    CREATE TEMPORARY TABLE temp_depto(
		codigo_depto CHAR(5)
	);
    
    OPEN C1;
		loop_cursor: LOOP 
			FETCH C1 INTO codigoDepto;
            IF done THEN
				LEAVE loop_cursor;
			END IF;
            INSERT INTO temp_depto(codigo_depto) VALUES(codigoDepto);
            SELECT codigo_depto FROM temp_depto;
		END LOOP;

    CLOSE C1;
    SELECT codigo_depto FROM temp_depto;
    DROP TABLE temp_depto;
END //

DELIMITER ;
CALL Ex1(20021);


//Obter os códigos dos professores que são do departamento de código 'INF01' e que ministraram ao 
//menos uma turma em 2002/1.  

DROP PROCEDURE Ex2
DELIMITER //
CREATE PROCEDURE Ex2(in cod_depto char(5), in ano_sem int)
BEGIN
    DECLARE codigoProfessor INT;
	DECLARE done INT DEFAULT 0;
	DECLARE c1 CURSOR FOR
		SELECT DISTINCT codProf from PROFTURMA 
		WHERE codDepto = cod_depto AND AnoSem = ano_sem;
	DECLARE CONTINUE HANDLER FOR NOT FOUND 
    BEGIN
		SET done = 1;
	END;
    
    CREATE TEMPORARY TABLE temp_prof(
		codProf int
    );
    
    OPEN c1;
    FETCH c1 INTO CodigoProfessor;
    IF (done LIKE 1) THEN
		SELECT 'Nenhum professor encontrado' Mensagem;
	ELSE
		WHILE (done != 1) DO
			INSERT INTO temp_prof VALUES (codigoProfessor);
			FETCH c1 INTO codigoProfessor;
		END WHILE;
	END IF;
    CLOSE c1;
    SELECT codProf FROM temp_prof;
    DROP TABLE temp_prof;
END //

DELIMITER ;
CALL Ex2('INF01', 20021);


//Obter os horários de aula (dia da semana,hora inicial e número de horas ministradas) do professor 
//"Antunes" em 20021.  

DROP PROCEDURE Ex3
DELIMITER //
CREATE PROCEDURE Ex3(IN nome_prof VARCHAR(40))
BEGIN 
	DECLARE dia_semana, hora_inicial, horas_ministradas INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE c1 CURSOR FOR
		SELECT DiaSem, HoraInicio, NumHoras FROM horario h
		INNER JOIN turma t
		ON h.AnoSem=t.AnoSem AND h.CodDepto=t.CodDepto AND h.NumDisc=t.NumDisc AND h.SiglaTur=t.SiglaTur
		INNER JOIN profturma pt
		ON pt.AnoSem=t.AnoSem AND pt.CodDepto=t.CodDepto AND pt.NumDisc=t.NumDisc AND pt.SiglaTur=t.SiglaTur
		INNER JOIN professor p 
		ON p.CodProf=pt.CodProf
		WHERE p.NomeProf=nome_prof;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    CREATE TEMPORARY TABLE temp_horario(
		diaSem INT,
        horaIni INT, 
        numHoras INT
    );
    
    OPEN c1;
    loop_cursor:LOOP
		FETCH c1 INTO dia_semana, hora_inicial, horas_ministradas;
        IF done THEN
			LEAVE loop_cursor;
		END IF;
		INSERT INTO temp_horario(diaSem, horaIni, numHoras) 
			VALUES (dia_semana, hora_inicial, horas_ministradas);
	END LOOP;
    CLOSE c1;
    SELECT diaSem, horaIni, numHoras FROM temp_horario;
    DROP TABLE temp_horario;
END //
DELIMITER ;

CALL Ex3('Antunes');    


#Obter os nomes dos departamentos que têm turmas que, em 2002/1, têm aulas na sala 101 do prédio 
#denominado 'Informática - aulas'.  

DROP PROCEDURE Ex4
DELIMITER $$
CREATE PROCEDURE Ex4 (IN ano_semestre INT, IN num_sala INT, IN nome_predio VARCHAR(40))
BEGIN
	DECLARE nome_depto VARCHAR(40);
    DECLARE done INT DEFAULT FALSE;
    DECLARE c1 CURSOR FOR 
		SELECT d.NomeDepto FROM depto d
		INNER JOIN horario h
		ON h.CodDepto=d.CodDepto
		INNER JOIN predio p
		ON h.CodPred=p.CodPred
		where h.AnoSem=ano_semestre AND h.NumSala=num_sala AND p.NomePred=nome_predio;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    CREATE TEMPORARY TABLE temp_depto(
		nomeDepto VARCHAR(40)
    );
    
    OPEN c1;
    loop_cursor:LOOP
		FETCH c1 INTO nome_depto;
        IF done THEN
			LEAVE loop_cursor;
		END IF;
        INSERT INTO temp_depto VALUES (nome_Depto);
    END LOOP;
    CLOSE c1;
    SELECT nomeDepto FROM temp_depto;
    DROP TABLE temp_depto;
END $$
DELIMITER ;

CALL Ex4(20021, 101, 'Informática - aulas');
    
    
#Obter os códigos dos professores com título denominado 'Doutor' que não ministraram aulas em 2002/1.  
DROP PROCEDURE Ex5;
DELIMITER $$
CREATE PROCEDURE Ex5(IN ano_sem INT, IN nome_titulo VARCHAR(40))
BEGIN
	DECLARE codigo_professor INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE c1 CURSOR FOR
		SELECT pf.codProf FROM PROFTURMA pf
		INNER JOIN PROFESSOR p
		ON p.codProf=pf.codProf
		INNER JOIN TITULACAO t
		ON t.codTit=p.codTit
		WHERE pf.anoSem != ano_sem AND t.nomeTit=nome_titulo;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	CREATE TEMPORARY TABLE temp_professor(
		codProf INT
    );
    OPEN c1;
    loop_cursor:LOOP
		FETCH c1 INTO codigo_professor;
        IF done THEN 
			LEAVE loop_cursor;
		END IF;
        INSERT INTO temp_professor VALUES (codigo_professor);
	END LOOP;
    CLOSE c1;
    SELECT codigo_professor FROM temp_professor;
    DROP TABLE temp_professor;
END $$
DELIMITER ;

CALL ex5(20021, 'Doutor');


#Obter os identificadores das salas (código do prédio e número da sala) que, em 2002/1:  
#nas segundas-feiras (dia da semana = 2), tiveram ao menos uma turma do departamento 'Informática', e  
#nas quartas-feiras (dia da semana = 4), tiveram ao menos uma turma ministrada pelo professor 
#denominado 'Antunes'. 
DROP PROCEDURE Ex6()
DELIMITER $$
CREATE PROCEDURE Ex6()
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE num_sala INT;
    DECLARE cod_pred INT;
    DECLARE c1 CURSOR FOR
		SELECT t2.numSala, t2.codPred FROM
			(SELECT h.numSala, h.CodPred, h.AnoSem, h.DiaSem, h.CodDepto FROM horario h 
			INNER JOIN turma t
			ON t.AnoSem=h.AnoSem AND t.CodDepto=h.CodDepto AND t.NumDisc=h.NumDisc 
				AND t.SiglaTur=h.SiglaTur
			INNER JOIN profturma pt
			ON pt.AnoSem=t.AnoSem AND pt.CodDepto=t.CodDepto AND pt.NumDisc=t.NumDisc 
				AND pt.SiglaTur=t.SiglaTur
			INNER JOIN professor p
			ON p.CodProf=pt.CodProf
			INNER JOIN depto d
			ON h.CodDepto=d.CodDepto
			WHERE h.anoSem=20021 AND h.diaSem=4 AND p.NomeProf='Antunes') t1
		INNER JOIN
			(SELECT h.numSala, h.CodPred, h.AnoSem, h.DiaSem, h.CodDepto FROM horario h 
			INNER JOIN turma t
			ON t.AnoSem=h.AnoSem AND t.CodDepto=h.CodDepto AND t.NumDisc=h.NumDisc 
				AND t.SiglaTur=h.SiglaTur
			INNER JOIN profturma pt
			ON pt.AnoSem=t.AnoSem AND pt.CodDepto=t.CodDepto AND pt.NumDisc=t.NumDisc 
				AND pt.SiglaTur=t.SiglaTur
			INNER JOIN professor p
			ON p.CodProf=pt.CodProf
			INNER JOIN depto d
			ON h.CodDepto=d.CodDepto
			WHERE h.anoSem=20021 AND h.diaSem=4 AND p.NomeProf='Antunes') t2
		ON t1.numSala=t2.numSala AND t1.codPred=t2.codPred;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    CREATE TEMPORARY TABLE temp_sala(
		numSala INT, codPred INT
    );
    OPEN c1;
    loop_cursor:LOOP
		FETCH c1 INTO num_sala, cod_pred;
        IF done THEN 
			LEAVE loop_cursor;
		END IF;
		INSERT INTO temp_sala VALUES (num_sala, cod_pred);
	END LOOP;
    CLOSE c1;
	SELECT numSala, codPred FROM temp_sala;
    DROP TABLE temp_sala;
END $$
DELIMITER ;

CALL Ex6();

#Obter o dia da semana, a hora de início e o número de horas de cada horário de cada turma ministrada 
#por um professor de nome `Antunes', em 2002/1, na sala número 101 do prédio de código 43423.  
DROP PROCEDURE Ex7
DELIMITER $$
CREATE PROCEDURE Ex7(IN nome_prof VARCHAR(40), IN ano_sem INT, IN num_sala INT, IN cod_pred INT) 
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE dia_sem INT;
    DECLARE hora_inicio INT;
    DECLARE num_horas INT;
    DECLARE c1 CURSOR FOR 
		SELECT h.diaSem, h.horaInicio, h.numHoras FROM horario h
		INNER JOIN profTurma pt
		ON pt.anoSem=h.anoSem AND pt.codDepto=h.codDepto AND pt.numDisc=h.numDisc 
			AND pt.siglaTur=h.siglaTur
		INNER JOIN professor p
		ON p.codProf=pt.codProf
		WHERE p.nomeProf=nome_prof AND h.anoSem=ano_sem AND h.numSala=num_sala AND h.codPred=cod_pred;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    CREATE TEMPORARY TABLE temp_horario(
		diaSem INT, horaInicio INT, numHoras INT
    );
    OPEN c1;
    loop_cursor:LOOP
		FETCH c1 INTO dia_sem, hora_inicio, num_horas;
        IF done THEN
			LEAVE loop_cursor;
		END IF;
        INSERT INTO temp_horario VALUES (dia_sem, hora_inicio, num_horas);
	END LOOP;
    CLOSE c1;
    SELECT dia_sem, hora_inicio, num_horas FROM temp_horario;
    DROP TABLE temp_horario;
END $$
DELIMITER ;

CALL Ex7('Antunes', 20021, 101, 43423);


#Um professor pode ministrar turmas de disciplinas pertencentes a outros departamentos. 
#Para cada professor que já ministrou aulas em disciplinas de outros departamentos, 
#obter o código do professor, seu nome, o nome de seu departamento e o nome do departamento no 
#qual ministrou disciplina.  
DROP PROCEDURE Ex8
DELIMITER $$
CREATE PROCEDURE Ex8()
BEGIN 
	DECLARE done INT DEFAULT FALSE;
    DECLARE cod_depto CHAR(5);
    DECLARE nome_prof VARCHAR(40);
    DECLARE nome_depto_prof VARCHAR(40);
    DECLARE nome_depto_disc VARCHAR(40);
    DECLARE c1 CURSOR FOR 
		SELECT p.codprof, p.nomeprof, dProfessor.nomedepto, dProfTurma.nomeDepto from professor p
		inner join profturma pt
		on pt.codprof=p.codProf 
		inner join depto dProfessor
		on p.codDepto=dProfessor.coddepto 
        inner join depto dProfTurma
		on pt.codDepto=dProfTurma.coddepto
		WHERE p.coddepto!=pt.coddepto;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    CREATE TEMPORARY TABLE temp (
		codDepto CHAR(5), nomeProf VARCHAR(40), nomeDeptoProf VARCHAR(40), nomeDeptoDisc VARCHAR(40)
    );
     OPEN c1;
    loop_cursor:LOOP
		FETCH c1 INTO cod_depto, nome_prof, nome_depto_prof, nome_depto_disc;
        IF done THEN
			LEAVE loop_cursor;
		END IF;
        INSERT INTO temp VALUES (cod_depto, nome_prof, nome_depto_prof, nome_depto_disc);
	END LOOP;
    CLOSE c1;
    SELECT codDepto, nomeProf, nomeDeptoProf, nomeDeptoDisc FROM temp;
    DROP TABLE temp;
END $$
DELIMITER ;

CALL Ex8();


/*Obter o nome dos professores que possuem horários conflitantes 
(possuem turmas que tenham a mesma hora inicial, no mesmo dia 
da semana e no mesmo semestre). 
Além dos nomes, mostrar as chaves primárias das turmas em 
conflito. */

SELECT DISTINCT Professor.NomeProf, ProfTurma.anoSem, ProfTurma.codDepto,
ProfTurma.numDisc, ProfTurma.siglaTur
FROM Horario,
Horario AS Horario2,
ProfTurma AS ProfTurma,
ProfTurma AS ProfTurma2,
Professor
WHERE Horario.AnoSem = Horario2.AnoSem
AND Horario.DiaSem = Horario2.DiaSem
AND Horario.HoraInicIO = Horario2.HoraInicIO

AND Horario.CodDepto = ProfTurma.CodDepto
AND Horario.NumDisc = ProfTurma.NumDisc
AND Horario.AnoSem = ProfTurma.AnoSem
AND Horario.SiglaTur = ProfTurma.SiglaTur

AND Horario2.CodDepto = ProfTurma2.CodDepto
AND Horario2.NumDisc = ProfTurma2.NumDisc
AND Horario2.AnoSem = ProfTurma2.AnoSem
AND Horario2.SiglaTur = ProfTurma2.SiglaTur

AND ProfTurma.CodDepto = ProfTurma2.CodDepto
AND Professor.CodProf = ProfTurma2.CodDepto;


#Para cada disciplina que possui pré-requisito, obter o nome da disciplina seguido do nome da disciplina 
#que é seu pré-requisito.  
DROP PROCEDURE Ex10
DELIMITER $$
CREATE PROCEDURE Ex10()
BEGIN 
	DECLARE done INT DEFAULT FALSE;
    DECLARE nome_disc VARCHAR(10);
    DECLARE nome_disc_preReq VARCHAR(10);
    DECLARE c1 CURSOR FOR 
		SELECT d.nomeDisc AS 'nome da disciplina', d2.nomeDisc 'PreRequisito'  FROM disciplina d
		INNER JOIN preReq p
		ON d.numDisc=p.numDisc AND d.codDepto=p.codDepto
		INNER JOIN disciplina d2
		ON d2.codDepto=p.codDeptoPreReq AND d2.numDisc=p.numDiscPreReq;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    CREATE TEMPORARY TABLE temp (
		nomeDisc VARCHAR(10), nomeDisCPreReq VARCHAR(10)
    );
    OPEN c1;
    loop_cursor:LOOP
		FETCH c1 INTO nome_disc, nome_disc_preReq;
        IF done THEN 
			LEAVE loop_cursor;
		END IF;
        INSERT INTO temp VALUES (nome_disc, nome_disc_preReq);
	END LOOP;
    CLOSE c1;
    SELECT nomeDisc  AS 'nome da disciplina', nomeDiscPreReq 'PreRequisito' FROM temp;
    DROP TABLE temp;
END $$
DELIMITER ;

CALL Ex10();


#Obter os nomes das disciplinas que não têm pré-requisito. 
DROP PROCEDURE Ex11
DELIMITER $$
CREATE PROCEDURE Ex11() 
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE nome_disc VARCHAR(10);
    DECLARE c1 CURSOR FOR 
		SELECT d.nomeDisc AS 'nome da disciplina' FROM disciplina d
		LEFT JOIN preReq p
		ON d.numDisc=p.numDisc AND d.codDepto=p.codDepto
		WHERE p.numDisc IS NULL AND p.codDepto IS NULL AND p.codDeptoPreReq IS NULL 
			AND p.numDiscPreReq IS NULL;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    CREATE TEMPORARY TABLE temp_disciplina (
		nomeDisc VARCHAR(10)
    );
    OPEN c1;
    loop_cursor:LOOP
		FETCH c1 INTO nome_disc;
        IF done THEN
			LEAVE loop_cursor;
		END IF;
        INSERT INTO temp_disciplina VALUES (nome_disc);
	END LOOP;
    CLOSE c1;
    SELECT nomeDisc FROM temp_disciplina;
    DROP TABLE temp_disciplina;
END $$
DELIMITER ;

CALL Ex11();


#Obter o nome de cada disciplina que possui ao menos dois pré-requisitos.
DROP PROCEDURE Ex12
DELIMITER $$
CREATE PROCEDURE Ex12()
BEGIN 
	DECLARE done INT DEFAULT FALSE;
    DECLARE nome_disc VARCHAR(10);
    DECLARE qtd_preReq VARCHAR(10);
    DECLARE c1 CURSOR FOR
		SELECT d.nomeDisc AS 'nome da disciplina', Count(p.numDiscPreReq) AS qtdPreReq 
        FROM disciplina d
		INNER JOIN preReq p
		ON d.numDisc=p.numDisc AND d.codDepto=p.codDepto
		GROUP BY d.nomeDisc
		HAVING qtdPreReq >= 2;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	CREATE TEMPORARY TABLE temp_disciplina(
		nomeDisc VARCHAR(10)
	);
    OPEN c1;
    loop_cursor:LOOP
		FETCH c1 INTO nome_disc, qtd_preReq;
        IF done THEN
			LEAVE loop_cursor;
		END IF;
		INSERT INTO temp_disciplina VALUES (nome_disc);
	END LOOP;
    CLOSE c1;
    SELECT nomeDisc FROM temp_disciplina;
    DROP TABLE temp_disciplina;
END $$
DELIMITER ;

CALL Ex12()
        