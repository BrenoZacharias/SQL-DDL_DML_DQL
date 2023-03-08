--Como fazer as listas de chamadas, com RA e nome por disciplina ?								
USE escola 
GO
SELECT a.ra, a.nome, d.nome 
FROM Aluno a
INNER JOIN Aluno_Disciplina ad
ON ad.Alunora = a.ra
INNER JOIN Disciplina d
ON d.codigo = ad.Disciplinacodigo
ORDER BY d.nome, a.nome 

--Fazer uma pesquisa que liste o nome das 
--disciplinas e o nome dos professores que as ministram		
SELECT d.nome, p.nome
FROM Disciplina d
INNER JOIN Disciplina_Professor dp
ON d.codigo=dp.Disciplinacodigo
INNER JOIN Professor p
ON p.registro = dp.Professorregistro

--Fazer uma pesquisa que , dado o nome de uma disciplina
--, retorne o nome do curso			
SELECT c.nome 
FROM Curso c
INNER JOIN Curso_Disciplina cd
ON c.codigo = cd.Cursocodigo
INNER JOIN Disciplina d
ON d.codigo = cd.Disciplinacodigo
WHERE d.nome = 'Laboratório de Banco de Dados'

--Fazer uma pesquisa que , dado o nome de uma disciplina
--, retorne sua área		
SELECT c.area
FROM Curso c
INNER JOIN Curso_Disciplina cd
ON c.codigo = cd.Cursocodigo
INNER JOIN Disciplina d
ON d.codigo = cd.Disciplinacodigo
WHERE d.nome = 'Laboratório de Banco de Dados'

--Fazer uma pesquisa que , dado o nome de uma disciplina
--, retorne o título do professor que a ministra		
SELECT t.titulo
FROM Disciplina d
INNER JOIN Disciplina_Professor dp
ON d.codigo = dp.Disciplinacodigo
INNER JOIN Professor p
ON dp.Professorregistro = p.registro
INNER JOIN Titulacao t
ON t.codigo = p.titulacao
WHERE d.nome = 'Laboratório de Banco de Dados'

--Fazer uma pesquisa que retorne o nome da disciplina 
--e quantos alunos estão matriculados em cada uma delas		
SELECT d.nome, count(ad.Disciplinacodigo) as [qtd de alunos matriculados]
FROM Disciplina d
INNER JOIN Aluno_Disciplina ad
ON d.codigo = ad.Disciplinacodigo
GROUP BY ad.Disciplinacodigo, d.nome

--Fazer uma pesquisa que, dado o nome de uma disciplina, retorne o nome do professor. 
--Só deve retornar de disciplinas que tenham, no mínimo, 5 alunos matriculados													
SELECT CASE 
			WHEN (SELECT count(d.nome)
					FROM Disciplina d
					INNER JOIN Aluno_Disciplina ad
					ON d.codigo = ad.Disciplinacodigo
					WHERE d.nome = 'Segurança da Informação'
					GROUP BY ad.Disciplinacodigo) >= 5
			THEN 
					p.nome
			END AS [nome professor]
FROM Disciplina d
INNER JOIN Disciplina_Professor dp
ON d.codigo=dp.Disciplinacodigo
INNER JOIN Professor p
ON p.registro = dp.Professorregistro
WHERE d.nome = 'Segurança da Informação'

--Fazer uma pesquisa que retorne o nome do curso e a quatidade de professores cadastrados que 
--ministram aula nele. A coluna de ve se chamar quantidade		
SELECT c.nome, count(p.registro) as quantidade
FROM Curso c 
INNER JOIN Curso_Disciplina cd
ON c.codigo = cd.Cursocodigo
INNER JOIN Disciplina d
ON d.codigo = cd.Disciplinacodigo
INNER JOIN Disciplina_Professor dp 
ON dp.Disciplinacodigo = d.codigo
INNER JOIN Professor p
ON dp.Professorregistro = p.registro
GROUP BY c.codigo, c.nome