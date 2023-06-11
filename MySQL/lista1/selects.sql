USE Lista1;
-- Selecionar os nomes de todos clientes. 
SELECT  nomecli FROM cliente;

/* Selecionar os nomes dos clientes que moram em Petrópolis. 
Para confirmar listar também o nome da cidade. */
SELECT  nomecli, cidadecli FROM cliente
WHERE cidadecli = 'Petrópolis';

/*Selecionar os nomes dos produtos cujas quantidades são maiores 
ou iguais a 900. 
Para confirmar listar também as quantidades.*/
SELECT  nomeprod, quantprod FROM produto
WHERE quantprod >= 900;

/*Selecionar os nomes dos produtos onde o código da categoria é 
1 e a quantidade é superior a 500.*/
SELECT  nomeprod, quantprod FROM produto
WHERE quantprod > 500 AND codcat = 1;

/*Selecionar os nomes dos produtos da tabela Produto com uma 
perspectiva de aumentode 10 vezes na quantidade destes.*/
SELECT  nomeprod, quantprod * 10 FROM produto;

/*Selecionar os nomes dos produtos da tabela Produto onde o 
código da categoria é 1 ou 2 e a quantidade é superior a 500.*/
SELECT  nomeprod, codcat FROM produto
WHERE (codcat = 1 OR codcat = 2) AND quantprod > 500;

/*.... ou podemos utilizar... 
Selecionar os códigos dos produtos cuja quantidade não é maior 
que 500.*/
SELECT  codprod, quantprod FROM produto
WHERE NOT quantprod >= 500;

/*Podemos alterar o nome de uma coluna para facilitar o 
entendimento do usuário.  Neste exemplo a coluna quantprod 
tem seu nome alterado para ‘quantidade_no_estoque’(não pode 
haver espaço em branco). */
SELECT quantprod AS quantidade_no_estoque FROM produto;

/*...  Neste exemplo a coluna quantprod tem seu nome alterado 
para ‘Quantidade no estoque’.... */
SELECT quantprod AS 'Quantidade no estoque' FROM produto;

/*.Selecionar os nomes dos produtos cujas quantidades estão entre 
300 e 900 itens.*/
SELECT  nomeprod, quantprod FROM produto
WHERE quantprod >= 300 AND quantprod <= 900;

/*Selecionar os nomes das categorias de produtos cujos nomes 
começam com a letra ‘c’.*/
/*maneira 1*/
SELECT nomecat FROM categoria
WHERE nomecat LIKE 'c%';

/*maneira 2*/
SELECT nomecat FROM categoria
WHERE SUBSTR(nomecat, 1, 1) = 'c';

/*Selecionar os nomes dos clientes cujas cidades começam 
com ‘Petró’*/ 
SELECT nomecli FROM cliente
WHERE cidadecli LIKE 'Petrô%';

/*Selecionar os nomes dos clientes cujas cidades não começam 
com ‘Petró’*/ 
SELECT nomecli FROM cliente
WHERE cidadecli NOT LIKE 'Petrô%';

/*Selecionar os nomes dos produtos cujas categorias sejam 3 
ou 2.*/
SELECT  nomeprod FROM produto
WHERE codcat = 2 OR codcat = 3; 

/*Selecionar os nomes dos produtos cujas categorias não sejam 3 
ou 2.*/ 
SELECT  nomeprod, codcat FROM produto
WHERE NOT (codcat = 2 OR codcat = 3); 

/*Selecionar as categorias cujos valores sejam nulos. */
SELECT codcat, nomecat FROM categoria
WHERE nomecat IS NULL;

/*Selecionar as categorias cujos valores não sejam nulos.*/
SELECT codcat, nomecat FROM categoria
WHERE nomecat IS NOT NULL;

/*Selecionar os nomes das cidades dos fornecedores ordenadas 
alfabeticamente.*/
SELECT cidadefor FROM fornecedor
ORDER BY cidadefor;


/*Como os nomes foram repeƟdos, podemos impedir esta repetição por meio da cláusula distinct. */
SELECT DISTINCT cidadefor FROM fornecedor
ORDER BY cidadefor;

/*Selecionar os nomes das categorias ordenadas descendentemente pelo código da categoria. */
SELECT codcat, nomecat FROM categoria
ORDER BY codcat DESC;

/*Selecionar os nomes dos clientes na tabela Cliente ordenados primeiramente por estado e depois por cidade crescentemente */
SELECT nomecli, estadocli, cidadecli FROM cliente
ORDER BY estadocli ASC, cidadecli ASC;

/*Exibir os novos preços dos produtos para um aumento de 15%.*/
SELECT  nomeprod, precoprod, (precoprod * 1.15) AS novoPreco FROM produto
WHERE quantprod >= 300 AND quantprod <= 900;

/* Selecionar os códigos dos produtos da tabela Produto. */
SELECT  codprod FROM produto;

/*Selecionar o maior preço e a menor quantidade dos produtos.*/
SELECT MAX(precoprod) AS maiorPrecoProdutos, MIN(quantprod) AS menorQuantidadeProdutos from produto;

/*Selecionar a quantidade total de produtos para a categoria 1.*/
SELECT SUM(quantprod) AS 'quantidade total de produtos para a categoria 1' FROM produto
WHERE codcat = 1;

/*Calcular e exibir a média de produtos.*/ 
SELECT AVG(quantprod) AS 'Média da quantidade de produtos' FROM produto;

/*Contar quantos produtos tem o seu preço superior a R$ 500,00. */
SELECT COUNT(codprod) 'Quantidade' FROM produto
WHERE precoprod > 500;

/*Quais as categorias de produtos? */
SELECT codcat, nomecat FROM categoria;

/*Selecionar todos os dados da tabela Pessoa Física*/
SELECT codcli, cpf FROM pessoa_fisica;

/*Selecionar o nome e o código da categoria dos produtos com quantidade maior que 100.*/ 
SELECT nomecat, codcat FROM categoria 
WHERE codcat IN (SELECT codcat FROM produto WHERE quantprod > 100);

/*Selecionar o código do produto com a maior quantidade na tabela Produto cujo código da categoria seja 1. */
SELECT codprod
FROM produto
WHERE codcat = 1
ORDER BY quantprod DESC
LIMIT 1;

/*Contar quantas cidades diferentes temos na tabela de Clientes. */
SELECT COUNT(DISTINCT cidadecli) AS 'Quantidade de cidades diferentes na tabela Clientes' FROM cliente;

/*Selecionar as quantidades de produtos por categoria na tabela Produto. */
SELECT codcat, SUM(quantprod) FROM produto
GROUP BY codcat;

