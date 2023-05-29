CREATE TABLE Cliente(
    Codcli INT,
    Nomecli VARCHAR(70),
    Endcli VARCHAR(255),
    Cidadecli VARCHAR(50),
    Estadocli VARCHAR(50)
);

CREATE TABLE Pedido(
    NrPed INT,
    DataPed DATE,
    Codcli INT
);

CREATE TABLE PessoaFisica(
    Codcli INT,
    CPF CHAR(11)
);

CREATE 