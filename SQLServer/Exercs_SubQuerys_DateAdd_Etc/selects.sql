USE users_projects
GO
SELECT id, namee AS [name], email, username, 
CASE WHEN (passwordd != '123mudar') THEN
	'********'
ELSE
	passwordd
END AS [password]
FROM users

SELECT namee, descriptionn, datee, DATEADD(DAY, 15, datee) AS datee_fim
FROM projects
WHERE id IN
(
	SELECT projects_id 
	FROM users_has_projects
	WHERE users_id IN
	(
		SELECT id FROM users
		WHERE email = 'aparecido@empresa.com'
	)
)

SELECT namee, email 
FROM users
WHERE id IN
(
	SELECT users_id 
	FROM users_has_projects 
	WHERE projects_id IN 
	(
	SELECT id 
	FROM projects 
	WHERE namee = 'Auditoria'
	)
)

SELECT namee, descriptionn, CONVERT(CHAR(10), datee, 103) AS datee,  
'2014/09/16' AS datee_fim, 
(DATEDIFF(DAY, datee, '2014-09-16') * 79.85)AS custo_total
FROM projects WHERE namee LIKE '%Manutenção%'
