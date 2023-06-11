USE academico;

/*1. Obter os nomes docentes cuja titulação tem código diferente de 3.*/
SELECT nomeProf FROM professor
WHERE codTit != 3;

/*2. Obter os nomes dos departamentos que têm turmas que, em 2002/1, têm aulas na
sala 101 do prédio denominado 'Informática - aulas'. Resolver usando theta-join
e junção natural.*/

-- THETA-JOIN
SELECT nomeDepto FROM  depto d, horario h, predio p
WHERE (d.coddepto=h.coddepto) AND (h.codPred=p.codPred) AND (h.anoSem = '20021') AND (h.numSala = 101) AND (p.nomePred = 'Informática - aulas');

-- NATURAL-JOIN
SELECT DISTINCT nomeDepto FROM  depto d NATURAL JOIN  horario h, predio p
WHERE (h.anoSem = '20021') AND (h.numSala = 101) AND (p.nomePred = 'Informática - aulas');

/*3.Obter o nome dos professores que possuem horários conflitantes (possuem
turmas que tenham a mesma hora inicial, no mesmo dia da semana e no mesmo
semestre).*/
SELECT DISTINCT Professor.NomeProf, ProfTurma.anoSem, horario.diaSem,
Horario.horaInicio
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

DROP PROCEDURE horarioConflitante
DROP TABLE temp
DELIMITER $$
CREATE PROCEDURE horarioConflitante()
BEGIN 
	DECLARE done INT DEFAULT FALSE;
    DECLARE ano_sem INT;
    DECLARE dia_sem INT;
    DECLARE hora_inicio INT;
    DECLARE nome_prof VARCHAR(40);
	DECLARE ano_sem_ANT INT;
    DECLARE dia_sem_ANT INT;
    DECLARE hora_inicio_ANT INT;
    DECLARE nome_prof_ANT VARCHAR(40);
    DECLARE c1 CURSOR FOR 
		SELECT h.anoSem, h.diaSem, h.horaInicio, p.nomeprof FROM horario h, profturma pt, professor p
		WHERE h.CodDepto = pt.CodDepto
		AND h.NumDisc = pt.NumDisc
		AND h.AnoSem = pt.AnoSem
		AND h.SiglaTur = pt.SiglaTur
		AND p.CodProf = pt.CodProf
		ORDER BY h.anosem, h.diasem, h.horainicio;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    CREATE TEMPORARY TABLE temp (
		anoSem INT, diaSem INT, horaInicio INT, nomeProf VARCHAR(40)
    );
	OPEN c1;
    FETCH c1 INTO ano_sem, dia_sem, hora_inicio, nome_prof;
    SET ano_sem_ANT = ano_sem;
	SET dia_sem_ANT = dia_sem;
	SET hora_inicio_ANT = hora_inicio;
	SET nome_prof_ANT = nome_prof;
    loop_cursor:LOOP
		IF done THEN
			LEAVE loop_cursor;
		END IF;
		IF (ano_sem = ano_sem_ANT) AND (dia_sem = dia_sem_ANT) AND (hora_inicio = hora_inicio_ANT) AND (nome_prof != nome_prof_ANT) THEN
			INSERT INTO temp VALUES (ano_sem, dia_sem, hora_inicio, nome_prof);
            INSERT INTO temp VALUES (ano_sem_ANT, dia_sem_ANT, hora_inicio_ANT, nome_prof_ANT);
		END IF;
		SET ano_sem_ANT = ano_sem;
		SET dia_sem_ANT = dia_sem;
		SET hora_inicio_ANT = hora_inicio;
		SET nome_prof_ANT = nome_prof;
        FETCH c1 INTO ano_sem, dia_sem, hora_inicio, nome_prof;
	END LOOP;
    CLOSE c1;
    SELECT anoSem, diaSem, horaInicio, nomeProf FROM temp;
    DROP TABLE temp;
END $$
DELIMITER ;

CALL horarioConflitante();

select * from horario h
order by h.anosem, h.diasem, h.horainicio;
/*4. Para cada disciplina que possui pré-requisito, obter o nome da disciplina seguido
do nome da disciplina que é seu pré-requisito (usar junções explícitas - quando
possível usar junção natural).
5. Para cada disciplina, mesmo para aquelas que não possuem pré-requisito, obter o
nome da disciplina seguido do nome da disciplina que é seu pré-requisito (usar
junções explícitas - quando possível usar junção natural).
6. Para cada disciplina que tem um pré-requisito que a sua vez também tem um
pré-requisito, obter o nome da disciplina seguido do nome do pré-requisito de
seu pré-requisito.
7. Obter uma tabela que contém três colunas. Na primeira coluna aparece o nome
de cada disciplina que possui pré-requisito, na segunda coluna aparece o nome
de cada um de seus pré-requisitos e a terceira contém o nível de pré-requisito.
Nível 1 significa que trata-se de um pré-requisito imediato da disciplina, nível 2
significa que trata-se de um pré-requisito de um pré-requisito da disciplina, e
3
assim por diante. Limitar a consulta para três níveis. (DICA USAR UNION
ALL)
8. Obter os códigos dos professores com código de título vazio que não
ministraram aulas em 2001/2 (resolver com junção natural).*/