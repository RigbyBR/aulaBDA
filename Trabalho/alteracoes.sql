SET client_encoding TO 'UTF8';

ALTER TABLE cliente
    ADD COLUMN data_cadastro DATE NOT NULL DEFAULT CURRENT_DATE;

ALTER TABLE veiculo
    ADD COLUMN modelo TYPE VARCHAR(60);

ALTER TABLE cliente
    ADD CONSTRAINT ck_cliente_email CHECK (email like '%@%.%');        