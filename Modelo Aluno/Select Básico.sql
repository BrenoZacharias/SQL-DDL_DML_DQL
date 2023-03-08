SELECT NOME_ALUNO, COD_ALUNO, 
END_ALUNO, SIGLA_ESTADO, ID_CLASSE FROM TB_ALUNO;

SELECT NOME_DISCIPLINA FROM TB_DISCIPLINA 
WHERE NOTA_MINIMA_DISCIPLINA > 5;

SELECT NOME_DISCIPLINA, ID_DISCIPLINA,
ID_PROFESSOR_DISCIPLINA,
NOTA_MINIMA_DISCIPLINA
FROM TB_DISCIPLINA
WHERE NOTA_MINIMA_DISCIPLINA BETWEEN 3 AND 5; 

SELECT NOME_DISCIPLINA, ID_DISCIPLINA,
ID_PROFESSOR_DISCIPLINA,
NOTA_MINIMA_DISCIPLINA
FROM TB_DISCIPLINA
WHERE NOTA_MINIMA_DISCIPLINA >= 3 
AND NOTA_MINIMA_DISCIPLINA <= 5;

