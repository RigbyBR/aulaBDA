SET client_encoding TO 'UTF8';

INSERT INTO cliente (id_cliente, nome, cpf)
VALUES (1, 'TESTE CHAVE DUPLICADA', '99999999901');

INSERT INTO veiculo(placa, modelo, cor, id_cliente, id_categoria)
VALUES ('ABC1234', 'MODELO TESTE', 'PRETO', 1, 2);

INSERT INTO veiculo (placa, modelo, cor, id_cliente, id_categoria)
VALUES ('KLM1N23', 'MODELO TESTE', 'BRANCO', 999, 2);

INSERT INTO cliente (nome, cpf)
VALUES(NULL, '99999999902');

INSERT INTO categoria_veiculo(nome, valor_hora, valor_maximo_diario)
VALUES('teste', -5.00, 20.00);

INSERT INTO estadia (id_veiculo, id_vaga, data_entrada, data_saida, valor_total)
VALUES (1, 6 '2026-11-25 10:00:00', '2026-11-25 09:00:00', 8.00);

INSERT INTO cliente (nome, cpf, email)
VALUES('teste email', '99999999903', 'email-invalido');

INSERT INTO estadia (id_veiculo, id_vaga, data_entrada)
VALUES (1, 7, '2026-11-25 13:00:00');

INSERT INTO estadia(id_veiculo, id_vaga, data_entrada)
VALUES (5, 6, '2026-11-25 13:00:00');

DELETE FROM veiculo
WHERE id_veiculo = 1;