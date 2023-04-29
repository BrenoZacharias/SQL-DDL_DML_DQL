USE users_projects
GO
SELECT u.id AS id_users, 
u.namee AS namee_users, 
u.email, p.id AS id_projects, 
p.namee AS namee_projects, 
p.descriptionn, p.datee 
FROM users u
INNER JOIN users_has_projects AS up
ON u.id = up.users_id
INNER JOIN projects p
ON p.id = up.projects_id
WHERE p.namee = 'Re-folha'

SELECT p.namee FROM 
projects p LEFT OUTER JOIN users_has_projects up
ON p.id = up.projects_id
WHERE up.projects_id IS NULL

select u.namee FROM 
users u LEFT OUTER JOIN users_has_projects up
ON u.id = up.users_id
WHERE up.projects_id IS NULL