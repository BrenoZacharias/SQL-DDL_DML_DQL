SELECT NOME_PROFESSOR
FROM TB_PROFESSOR A
INNER JOIN TB_DISCIPLINA B
ON A.ID_PROFESSOR=B.ID_PROFESSOR_DISCIPLINA
INNER JOIN TB_ALUNO_DISCIPLINA C
ON B.ID_DISCIPLINA=C.ID_DISCIPLINA
INNER JOIN TB_ALUNO D
ON D.COD_ALUNO=C.COD_ALUNO
WHERE D.SIGLA_ESTADO='PI'
AND NOME_PROFESSOR IN (
			SELECT NOME_PROFESSOR
			FROM TB_PROFESSOR A
			INNER JOIN TB_DISCIPLINA B
			ON A.ID_PROFESSOR=B.ID_PROFESSOR_DISCIPLINA
			INNER JOIN TB_ALUNO_DISCIPLINA C
			ON B.ID_DISCIPLINA=C.ID_DISCIPLINA
			INNER JOIN TB_ALUNO D
			ON D.COD_ALUNO=C.COD_ALUNO
			INNER JOIN TB_CLASSE E
			ON E.ID_CLASSE=D.ID_CLASSE
			WHERE E.ID_ANDAR=3
);


SELECT NOME_PROFESSOR
FROM TB_PROFESSOR A
INNER JOIN TB_DISCIPLINA B
ON A.ID_PROFESSOR=B.ID_PROFESSOR_DISCIPLINA
INNER JOIN TB_ALUNO_DISCIPLINA C
ON B.ID_DISCIPLINA=C.ID_DISCIPLINA
INNER JOIN TB_ALUNO D
ON D.COD_ALUNO=C.COD_ALUNO
INNER JOIN TB_CLASSE E
ON E.ID_CLASSE=D.ID_CLASSE
WHERE D.SIGLA_ESTADO='PI'
AND E.ID_ANDAR=3