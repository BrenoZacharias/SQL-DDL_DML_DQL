CREATE DATABASE users_projects
GO
USE users_projects
GO 
CREATE TABLE users (
	id				INT				IDENTITY(1,1)				NOT NULL,
	namee			VARCHAR(45)									NOT NULL,
	username		VARCHAR(45)		UNIQUE						NOT NULL,
	passwordd		VARCHAR(45)		DEFAULT('123mudar')			NOT NULL,
	email			varchar(45),
	PRIMARY KEY (id)
)
GO
CREATE TABLE projects(
	id					INT				IDENTITY(10001, 1)				NOT NULL,
	namee				VARCHAR(45)										NOT NULL,
	descriptionn		VARCHAR(45),	
	datee				DATE			CHECK(datee > '2014-09-01')		NOT NULL,
	PRIMARY KEY (id)
)
GO
CREATE TABLE users_has_projects(
	users_id		INT,
	projects_id		INT
	PRIMARY KEY(users_id, projects_id)
	FOREIGN KEY(users_id) REFERENCES users (id),
	FOREIGN KEY(projects_id) REFERENCES projects (id)
)