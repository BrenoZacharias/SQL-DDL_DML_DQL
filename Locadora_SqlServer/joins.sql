USE Locadora
GO
SELECT * FROM cliente

SELECT num_cadastro, nome, 
CONVERT(CHAR(10), data_locacao, 103) AS data_locacao, 
DATEDIFF(DAY, data_locacao, data_devolucao) AS Qtd_dias_alugado,
titulacao, ano AS ano_filme
FROM  Cliente cli 
INNER JOIN Locacao loc 
ON loc.Clientenum_cadastro = cli.num_cadastro
INNER JOIN dvd 
ON loc.DVDnum = dvd.num
INNER JOIN filme 
ON dvd.Filmeid = filme.id
WHERE  nome LIKE 'Matilde%'

SELECT nome, [nome real],titulacao FROM estrela e
INNER JOIN Filme_Estrela fe
ON fe.Estrelaid = e.id
INNER JOIN Filme f
ON f.id = fe.Filmeid
WHERE f.ano = '2015'

SELECT titulacao, CONVERT(CHAR(10), data_fabricacao, 103) AS data_fabricacao, 
ano, CASE 
			WHEN (YEAR(GETDATE()) - ano) > 6 THEN
				CAST(YEAR(GETDATE()) - ano AS VARCHAR(4)) + ' anos'
			ELSE
				CAST(YEAR(GETDATE()) - ano AS VARCHAR(4))
	 END AS diferenca_anoLancamento_anoAtual
FROM dvd INNER JOIN filme f ON dvd.Filmeid = f.id
