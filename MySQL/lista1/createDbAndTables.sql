CREATE DATABASE Lista1;
USE Lista1;

CREATE TABLE Fornecedor(
	CodFor		INT, 
    NomeFor 	VARCHAR(100),
    EndFor		VARCHAR(255),
	CidadeFor	VARCHAR(50),
    EstadoFor	VARCHAR(50)
);
ALTER TABLE Fornecedor ADD CONSTRAINT pkFornecedor PRIMARY KEY(CodFor);

CREATE TABLE Categoria(
	CodCat		INT, 
    NomeCat 	VARCHAR(100)
    );
ALTER TABLE Categoria ADD CONSTRAINT pkCategoria PRIMARY KEY(CodCat);

CREATE TABLE Produto(
	CodProd		INT, 
    CodFor		INT, 
    CodCat		INT, 
    NomeProd 	VARCHAR(255),
    QuantProd	INT,
	PrecoProd	DECIMAL(10,2)
);
ALTER TABLE Produto ADD CONSTRAINT pkProduto PRIMARY KEY(CodProd);
ALTER TABLE Produto ADD CONSTRAINT fkProduto_Fornecedor FOREIGN KEY(CodFor) REFERENCES Fornecedor(CodFor);
ALTER TABLE Produto ADD CONSTRAINT fkProduto_Categoria FOREIGN KEY(CodCat) REFERENCES Categoria(CodCat);

CREATE TABLE Cliente(
	CodCli		INT, 
    NomeCli 	VARCHAR(100),
    EndCli		VARCHAR(255),
	CidadeCli	VARCHAR(50),
    EstadoCli	VARCHAR(50)
);
ALTER TABLE Cliente ADD CONSTRAINT pkCliente PRIMARY KEY(CodCli);

CREATE TABLE Pedido(
	NrPed		INT, 
    DataPed		DATE, 
    CodCli		INT
);
ALTER TABLE Pedido ADD CONSTRAINT pkPedido PRIMARY KEY(NrPed);
ALTER TABLE Pedido ADD CONSTRAINT fkPedido_Cliente FOREIGN KEY(CodCli) REFERENCES Cliente(CodCli);

CREATE TABLE Pessoa_Fisica(
	CodCli		INT, 
	cpf			CHAR(11)	UNIQUE		CHECK(LENGTH(cpf)=11)	
);
ALTER TABLE Pessoa_Fisica ADD CONSTRAINT fkPessoa_fisica_Cliente FOREIGN KEY(CodCli) REFERENCES Cliente(CodCli);
ALTER TABLE Pessoa_Fisica ADD CONSTRAINT pkPessoa_fisica PRIMARY KEY(CodCli);

CREATE TABLE Pessoa_Juridica(
	CodCli	INT, 
	cgc		CHAR(8)		UNIQUE		CHECK(LENGTH(cgc)=8)	
);
ALTER TABLE Pessoa_Juridica ADD CONSTRAINT fkPessoa_juridica_Cliente FOREIGN KEY(CodCli) REFERENCES Cliente(CodCli);
ALTER TABLE Pessoa_Juridica ADD CONSTRAINT pkPessoa_juridica PRIMARY KEY(CodCli);

