UPDATE Cliente
SET cep = '08411150'
WHERE num_cadastro = 5503

UPDATE Cliente
SET cep = '02918190'
WHERE num_cadastro = 5504

UPDATE Locacao
SET valor = 3.25
WHERE Clientenum_cadastro = 5502 AND data_locacao = '2021-02-18'

UPDATE Locacao
SET valor = 3.10
WHERE Clientenum_cadastro = 5501 AND data_locacao = '2021-02-24'

UPDATE DVD
SET data_fabricacao = '2019-07-14'
WHERE num = 10005

UPDATE Estrela
SET [nome real] = 'Miles Alexander Teller'
WHERE id = 9903

DELETE Filme
WHERE id = 1006

SELECT titulacao FROM Filme
WHERE ano = 2014

SELECT id, ano FROM Filme
WHERE titulacao = 'Birdman'

SELECT id, ano FROM Filme
WHERE titulacao LIKE '%plash'

SELECT id, nome, [nome real] FROM Estrela
WHERE nome LIKE 'Steve%'

SELECT Filmeid, CONVERT(CHAR(10), data_fabricacao, 103) AS fab FROM DVD
WHERE data_fabricacao >= '01-01-2020'

SELECT DVDnum, data_locacao, data_devolucao, valor, (valor + 2.00) AS [valor com multa] FROM Locacao
WHERE Clientenum_cadastro = 5505

SELECT logradouro, num, cep FROM Cliente
WHERE nome = 'Matilde Luz'

SELECT [nome real] FROM Estrela
WHERE nome = 'Michael Keaton'

SELECT num_cadastro, nome, logradouro + ', ' + CAST(num AS VARCHAR(5)) + ' - CEP: ' + cep AS end_comp FROM Cliente
WHERE num_cadastro >= 5503

select * from Filme
select * from Estrela
select * from DVD
select * from Locacao
select * from Cliente