CREATE DATABASE empresa;

CREATE DOMAIN TIPO_ID AS CHAR(4);
CREATE DOMAIN D_NUM AS INTEGER
CHECK (VALUE > 0 AND VALUE < 21);

CREATE TABLE funcionario
(
    indebt TIPO_ID,
    nome VARCHAR(15) NOT NULL,
    sobrenome VARCHAR(20) NOT NULL,
    endereço VARCHAR(30) NOT NULL,
    dtnasc DATE,
    salario DECIMAL(10,2),
    sexo BOOLEAN,
    dnumero TIPO_ID NOT NULL,
    PRIMARY KEY (ident)
);

CREATE TABLE dependente
(
    
)