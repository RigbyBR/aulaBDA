\c postgres;
DROP DATABASE IF EXISTS empresa;

CREATE DATABASE empresa;

\c empresa;

CREATE DOMAIN TIPO_ID AS CHAR(4);
CREATE DOMAIN D_NUM AS INTEGER n
CHECK (VALUE > 0 AND VALUE < 21);

CREATE TABLE departamento
(
    numero TIPO_ID,
    nome VARCHAR(15) NOT NULL,
    gident TIPO_ID,
    dtInicio DATE,
    PRIMARY KEY (numero)
);
   
CREATE TABLE funcionario
(
    ident TIPO_ID,
    nome VARCHAR(15) NOT NULL,
    sobrenome VARCHAR(20) NOT NULL,
    endereco VARCHAR(30) NOT NULL,
    dtnasc DATE,
    salario DECIMAL(10,2),
    sexo VARCHAR(15),
    supident TIPO_ID,
    dnumero TIPO_ID NOT NULL,
    PRIMARY KEY (ident),
    FOREIGN KEY (supident) REFERENCES funcionario(ident),
    FOREIGN KEY (dnumero) REFERENCES departamento(numero)
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

CREATE TABLE chamada
(
    prontuario VARCHAR(15),
    nome VARCHAR(50),
    time_coracao VARCHAR(50),
    PRIMARY KEY(prontuario)
);

ALTER TABLE funcionario
ADD CONSTRAINT fk_funcionario_superior
                FOREIGN KEY (supident)
                REFERENCES funcionario (ident);

ALTER TABLE funcionario
ADD CONSTRAINT fk_funcionario_departamento
                FOREIGN KEY (dnumero)
                REFERENCES departamento (numero);

ALTER TABLE funcionario
ALTER supident SET DEFAULT 5;

ALTER TABLE funcionario
ALTER sexo TYPE VARCHAR(1);

ALTER TABLE funcionario -- DEVERIA DAR ERRO POR CONTA DA FK
DROP numero RESTRICT; -- NAO DEIXA DELETAR SE TIVER ALGUM OUTRO OBJETO RELACIONADO

ALTER TABLE funcionario
Drop numero CASCADE; -- DELETA OBJETOS E TODOS SEUS RELACIONAMENTOS
