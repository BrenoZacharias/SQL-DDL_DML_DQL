USE Lista1;

INSERT INTO cliente 
(codcli, nomecli, endcli, cidadecli, estadocli)
VALUES (1, 'joao', 'endereco', 'Petrópolis', 'KW');

INSERT INTO cliente 
(codcli, nomecli, endcli, cidadecli, estadocli)
VALUES (2, 'kai', 'Rua nove', 'sla', 'rt');

INSERT INTO cliente 
(codcli, nomecli, endcli, cidadecli, estadocli)
VALUES (3, 'bimpo', 'Rua nove', 'abe', 'rt');

INSERT INTO cliente 
(codcli, nomecli, endcli, cidadecli, estadocli)
VALUES (4, 'momo', 'logradouro teste', 'abe', 'rt');

INSERT INTO fornecedor 
(codfor, nomefor, endfor, cidadefor, estadofor)
VALUES (1, 'maicon', 'avendida 16', 'jamandt', 'Sancro');

INSERT INTO fornecedor 
(codfor, nomefor, endfor, cidadefor, estadofor)
VALUES (2, 'Willian', 'rua olaia', 'afroen', 'RJ');

INSERT INTO fornecedor 
(codfor, nomefor, endfor, cidadefor, estadofor)
VALUES (3, 'Douglas', 'rua olaia', 'afroen', 'RJ');

INSERT INTO categoria 
(codcat, nomecat)
VALUES (1, 'eletrônico');

INSERT INTO categoria 
(codcat, nomecat)
VALUES (2, 'cama');

INSERT INTO categoria 
(codcat, nomecat)
VALUES (3, 'cozinha');

INSERT INTO categoria 
(codcat, nomecat)
VALUES (4, NULL);

INSERT INTO categoria 
(codcat, nomecat)
VALUES (5, 'jonasd');

INSERT INTO produto 
(codprod, codfor, codcat, nomeprod, quantprod, precoprod)
VALUES (1, 1, 1, 'máquina', 900, 5.10);

INSERT INTO produto 
(codprod, codfor, codcat, nomeprod, quantprod, precoprod)
VALUES (2, 1, 1, 'pc', 400, 500.10);

INSERT INTO produto 
(codprod, codfor, codcat, nomeprod, quantprod, precoprod)
VALUES (3, 1, 1, 'notebook', 1500, 2010.10);

INSERT INTO produto 
(codprod, codfor, codcat, nomeprod, quantprod, precoprod)
VALUES (4, 1, 2, 'edredom', 1000, 500.11);

INSERT INTO produto 
(codprod, codfor, codcat, nomeprod, quantprod, precoprod)
VALUES (5, 1, 3, 'colher', 600, 2.99);

INSERT INTO produto 
(codprod, codfor, codcat, nomeprod, quantprod, precoprod)
VALUES (6, 1, 3, 'prato', 500, 9.99);

INSERT INTO produto 
(codprod, codfor, codcat, nomeprod, quantprod, precoprod)
VALUES (7, 1, 3, 'garfo', 299, 19.99);

INSERT INTO produto 
(codprod, codfor, codcat, nomeprod, quantprod, precoprod)
VALUES (8, 2, 2, 'lençol', 1000, 500.00);

INSERT INTO produto 
(codprod, codfor, codcat, nomeprod, quantprod, precoprod)
VALUES (9, 3, 3, 'faca', 50, 14.00);

INSERT INTO pessoa_fisica 
(codcli, cpf)
VALUES (1, '15764015458');

INSERT INTO pessoa_fisica 
(codcli, cpf)
VALUES (2, '46897512035');