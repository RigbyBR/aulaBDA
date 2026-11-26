SET client_encoding TO 'UTF8';

SELECT id_estadia, id_veiculo, id_vaga, data_entrada, data_saida, valor_total
FROM estadia WHERE id_estadia = 13;

UPDATE estadia
SET data_saida = '2026-11-25 12:30:00',
    valor_total = 50.00
WHERE id_estadia = 13;

SELECT id_estadia, id_veiculo, id_vaga, data_entrada, data_saida, valor_total
FROM estadia WHERE id_estadia = 13;


SELECT id_vaga, codigo, setor, tipo, ativa
FROM vaga WHERE setor = 'C' ORDER BY id_vaga;

UPDATE vaga
SET ativa = FALSE
WHERE setor = 'C'
    AND ativa = TRUE;

SELECT id_vaga, codigo, setor, tipo, ativa
FROM vaga WHERE setor = 'C' ORDER BY id_vaga;


SELECT id_categoria, nome, valor_hora, valor_maximo_diario
FROM categoria_veiculo ORDER BY id_categoria;

UPDATE categoria_veiculo
SET valor_hora = ROUND(valor_hora * 1.10, 2),
    valor_maximo_diario = ROUND(valor_maximo_diario * 1.10, 2)
WHERE NOME <> 'MOTO';

SELECT id_categoria, nome, valor_hora, valor_maximo_diario
FROM categoria_veiculo ORDER BY id_categoria;


SELECT c.id_cliente, c.nome,
    (SELECT COUNT(*) FROM veiculo v WHERE v.id_cliente = c.id_cliente) AS qtd_veiculos
FROM cliente c WHERE c.id_cliente = 8;

DELETE FROM cliente
WHERE id_cliente = 8;

SELECT id_cliente,nome FROM cliente WHERE id_cliente = 8;


SELECT vg.id_vaga, vg.codigo, vg.ativa,
    (SELECT COUNT(*)FROM estadia e WHERE e.id_vaga = vg.id_vaga) AS qtd_estadias
FROM vaga vg WHERE vg.ativa = FALSE ORDER BY vg.id_vaga;

DELETE FROM vaga
WHERE ativa = FALSE
    AND NOT EXISTS (SELECT 1 FROM estadia e WHERE e.id_vaga = vaga.id_vaga);

SELECT vg.id_vaga, vg.codigo, vg.ativa,
    (SELECT COUNT(*) FROM stadia e WHERE e.id_vaga = vg.id_vaga) AS qtd_estadias
FROM vaga vg WHERE vg.ativa = FALSE ORDER BY vg.id_vaga;    


SELECT v.id_veiculo, v.placa, e.id_estadia, p.id_pagamento
FROM veiculo v
LEFT JOIN estadia   e ON e.id_veiculo = v.id_veiculo
LEFT JOIN pagamento p ON p.id_estadia = e.id_estadia
WHERE v.id_veiculo = 8;

BEGIN;
    DELETE FROM pagamento
    WHERE id_estadia IN (SELECT id_estadia FROM estadia WHERE id_veiculo = 8);

    DELETE FROM estadia
    WHERE id_veiculo = 8;

    DELETE FROM veiculo
    WHERE id_veiculo = 8;
COMMIT;

SELECT v.id_veiculo, v.placa, e.id_estadia, p.id_pagamento
FROM veiculo v
LEFT JOIN estadia   e ON e.id_veiculo = v.id_veiculo
LEFT JOIN pagamento p ON p.id_estadia = e.id_estadia
WHERE v.id_veiculo = 8;

SELECT 'categoria_veiculo' AS tabela, COUNT(*) AS registros FROM categoria_veiculo
UNION ALL SELECT 'cliente',   COUNT(*) FROM cliente
UNION ALL SELECT 'vaga',      COUNT(*) FROM vaga
UNION ALL SELECT 'veiculo',   COUNT(*) FROM veiculo
UNION ALL SELECT 'estadia',   COUNT(*) FROM estadia
UNION ALL SELECT 'pagamento', COUNT(*) FROM pagamento;
