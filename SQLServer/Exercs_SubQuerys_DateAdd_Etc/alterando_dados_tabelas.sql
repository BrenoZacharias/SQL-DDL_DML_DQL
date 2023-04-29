USE users_projects
GO 
UPDATE projects
SET datee = '2014-09-12'
WHERE id = 10002
GO
UPDATE users
SET username = 'Rh_cido'
WHERE namee='Aparecido'
GO
UPDATE users
SET passwordd='888@*'										
WHERE username='Rh_maria' AND passwordd='123mudar'
GO
DELETE users_has_projects										
WHERE users_id=2 AND projects_id=10002