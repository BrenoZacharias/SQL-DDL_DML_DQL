USE users_projects
GO
INSERT INTO users (namee, username, passwordd, email)
VALUES
	('Maria', 'Rh_maria', DEFAULT, 'maria@empresa.com')
	,('Paulo', 'Ti_paulo', '123@456', 'paulo@empresa.com')
	,('Ana', 'Rh_ana', DEFAULT, 'ana@empresa.com')
	,('Clara', 'Ti_clara', DEFAULT, 'clara@empresa.com')
	,('Aparecido', 'Rh_apareci', '55@!cido', 'aparecido@empresa.com')

GO

INSERT INTO projects (namee, descriptionn, datee)
VALUES
	('Re-folha', 'Refatoração das Folhas', '2014-09-05')
	,('Manutenção PC"s', 'Manutenção PC"s', '2014-09-06')
	,('Auditoria', NULL, '2014-09-07')

GO

INSERT INTO users_has_projects (users_id, projects_id)
VALUES
(1, 10001)
,(5, 10001)
,(3, 10003)
,(4, 10002)
,(2, 10002)

