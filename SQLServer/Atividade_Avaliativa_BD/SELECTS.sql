USE controlecomputdores

--1) idDepto e depto do Depto que não tem usuários alocados 
SELECT * FROM depto
LEFT OUTER JOIN usuario
ON depto.idDepto = usuario.depto
WHERE usuario.depto IS NULL

--2) Nomes distintos dos softwares usados pelos desenvolvedores (Usar o termo desenvolvimento para a filtragemm da busca)
SELECT DISTINCT software.nome FROM software
INNER JOIN softwareMaquina 
ON software.idSoftware = softwareMaquina.idSoftware
INNER JOIN maquina
ON softwareMaquina.idMaquina = maquina.idMaquina
INNER JOIN usuarioMaquina
ON usuarioMaquina.idMaquina = maquina.idMaquina
INNER JOIN usuario
ON usuarioMaquina.idUsuario = usuario.idUsuario
INNER JOIN depto
ON usuario.depto = depto.idDepto
WHERE depto.depto = 'Desenvolvimento'

SELECT COUNT(usuario.idUsuario) AS qtdUsuarios, depto.depto FROM usuario
INNER JOIN depto
ON usuario.depto = depto.idDepto
GROUP BY depto.idDepto, depto.depto
ORDER BY qtdUsuarios ASC

SELECT CASE
				WHEN	LEN(nome) > 10 THEN
					SUBSTRING(nome, 1,10) + '.'
				ELSE
					nome
				END AS nome
, ramal FROM usuario 
INNER JOIN usuarioMaquina
ON usuario.idUsuario = usuarioMaquina.idUsuario
INNER JOIN horario
ON horario.idHorario = usuarioMaquina.horario
WHERE horario.horario = 'manhã'

SELECT * FROM softwareMaquina

SELECT * FROM USUARIO

SELECT * FROM DEPTO