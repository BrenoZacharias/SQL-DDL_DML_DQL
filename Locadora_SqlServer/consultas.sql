USE Locadora

SELECT id, ano, 
CASE WHEN (LEN(titulacao) > 10) THEN
	SUBSTRING(titulacao, 1,10) + '...'
ELSE
	titulacao
END AS Nome
FROM Filme
WHERE id IN 
(
	SELECT Filmeid 
	FROM dvd
	WHERE data_fabricacao > '01-01-2020'
)



SELECT num, data_fabricacao, 
DATEDIFF(MONTH, data_fabricacao, GETDATE()) AS qtd_meses_desde_fabricacao
FROM dvd
WHERE filmeId IN (
	Select Id
	from filme 
	where titulacao='Interestelar'
)

SELECT DVDnum, data_locacao, data_devolucao, valor, 
DATEDIFF(DAY, data_locacao, data_devolucao) AS dias_alugado
FROM Locacao
WHERE Clientenum_cadastro IN (
	SELECT num_cadastro FROM Cliente
	WHERE nome LIKE '%Rosa%'
)


