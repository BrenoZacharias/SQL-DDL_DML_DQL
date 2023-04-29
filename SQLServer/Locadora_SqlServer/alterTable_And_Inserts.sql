ALTER TABLE Estrela
ADD [nome real] VARCHAR (50)	NULL

ALTER TABLE Filme
ALTER COLUMN titulacao VARCHAR (80)	NOT NULL

INSERT INTO Filme (id, titulacao, ano)
VALUES
(1001, 'Whiplash', 2015)
,(1002, 'Birdman', 2015)
,(1003, 'Interestelar', 2014)
,(1004, 'A Culpa é das estrelas', 2014)
,(1005, 'Alexandre e o Dia Terrível, Horrível, Espantoso e Horroroso', 2014)
,(1006, 'Sing', 2016)

INSERT INTO Estrela (id, nome, [nome real])
VALUES
(9901, 'Michael Keaton', 'Michael John Douglas')
,(9902, 'Emma Stone', 'Emily Jean Stone')
,(9903, 'Miles Teller', NULL)
,(9904, 'Steve Carell', 'Steven John Carell')
,(9905, 'Jennifer Garner', 'Jennifer Anne Garner')

INSERT INTO Filme_Estrela (Filmeid, Estrelaid)
VALUES
(1002, 9901)
,(1002, 9902)
,(1001, 9903)
,(1005, 9904)
,(1005, 9905)

INSERT INTO DVD (num, data_fabricacao, Filmeid)
VALUES
(10001, '2020-12-02', 1001)
,(10002, '2019-10-18', 1002)
,(10003, '2020-04-03', 1003)
,(10004, '2020-12-02', 1001)
,(10005, '2019-10-18', 1004)
,(10006, '2020-04-03', 1002)
,(10007, '2020-12-02', 1005)
,(10008, '2019-10-18', 1002)
,(10009, '2020-04-03', 1003)

INSERT INTO Cliente (num_cadastro, nome, logradouro, num, cep)
VALUES
(5501, 'Matilde Luz', 'Rua Síria', 150, '03086040')
,(5502, 'Carlos Carreiro', 'Rua Bartolomeu Aires', 1250, '04419110')
,(5503, 'Daniel Ramalho', 'Rua Itajutiba', 169, NULL)
,(5504, 'Roberta Bento', 'Rua Jayme Von Rosenburg', 36, NULL)
,(5505, 'Rosa Cerqueira', 'Rua Arnaldo Simões Pinto', 235, '02917110')

INSERT INTO Locacao (DVDnum, Clientenum_cadastro, Data_Locacao, Data_Devolucao, Valor)
VALUES
(10001, 5502, '2021-02-18', '2021-02-21', 3.50)
,(10009, 5502, '2021-02-18', '2021-02-21', 3.50)
,(10002, 5503, '2021-02-18', '2021-02-19', 3.50)
,(10002, 5505, '2021-02-20', '2021-02-23', 3.00)
,(10004, 5505, '2021-02-20', '2021-02-23', 3.00)
,(10005, 5505, '2021-02-20', '2021-02-23', 3.00)
,(10001, 5501, '2021-02-24', '2021-02-26', 3.50)
,(10008, 5501, '2021-02-24', '2021-02-26', 3.50)

