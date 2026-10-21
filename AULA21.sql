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
    sexo VARCHAR(15),
    dnumero TIPO_ID NOT NULL,
    PRIMARY KEY (ident)
);

CREATE TABLE dependente
(
    fident TIPO_ID,
    nome VARCHAR(15) NOT NULL,
    dt_nasc DATE,
    sexo VARCHAR(15),
    relacionamento VARCHAR(19),
    PRIMARY KEY (fident, nome)
);

CREATE TABLE departamento
(
    numero TIPO_ID,
    nome VARCHAR(15) NOT NULL,
    gident TIPO_ID,
    dtInicio DATE,
    PRIMARY KEY (numero)
);

CREATE TABLE localizacoes
(
    dnumero TIPO_ID,
    localizacao VARCHAR(20),
    PRIMARY KEY (dnumero, localizacao)
);

CREATE TABLE projeto
(
    numero TIPO_ID,
    nome VARCHAR(15),
    localizacao VARCHAR(20),
    PRIMARY KEY (numero)
);

CREATE TABLE treabalha_em
(
    pnumero TIPO_ID,
    fident TIPO_ID,
    horas  DECIMAL(5,2),
    PRIMARY KEY (pnumero, fident)
);