SET client_encoding TO 'UTF8';

SELECT id_vaga, codigo, setor, tipo
FROM vaga
WHERE tipo IN ('COBERTA', 'ELETRICA')
    AND ativa = TRUE
ORDER BY codigo;

SELECT id_cliente, nome , email
FROM cliente
WHERE nome ILIKE '%silva%'
    OR email IS NULL
ORDER BY nome;

SELECT id_estadia, id_veiculo, id_vaga, data_entrada, valor_total
FROM estadia
WHERE valor_total BETWEEN 20.00 AND 50.00
    AND data_entrada >= '2026-11-17 00:00:00'
ORDER BY valor_total DESC, id_estadia;

SELECT id_veiculo, placa, modelo, cor
FROM veiculo
WHERE placa LIKE 'ABC%'
    OR modelo ILIKE '%onix%'
ORDER BY placa;

SELECT id_estadia, id_veiculo, id_vaga,
    (data_saida - data_entrada) AS permanencia
FROM estadia
WHERE data_saida IS NOT NULL
ORDER BY (data_saida - data_entrada) DESC
LIMIT 5;

SELECT e.id_estadia,
    v.placa,
    v.modelo,
    c.nome AS cliente,
    vg.codigo AS vaga,
    e.data_entrada
FROM estadia e 
INNER JOIN veiculo v ON v.id_veiculo = e.id_veiculo
INNER JOIN cliente c ON c.id_cliente = e.id_cliente
INNER JOIN vaga vg ON vg.id_vaga = e.id_vaga
WHERE e.data_saida IS NULL
ORDER BY e.data_entrada;

SELECT e.id_estadia,
    e.valor_total,
    p.valor_pago,
    (p.valor_pago - e.valor_total) AS deferenca,
    p.forma_pagamento
FROM estadia e 
INNER JOIN pagamento p ON p.id_estadia = e.id_estadia
ORDER BY e.id_estadia;

SELECT e.id_estadia,
    v.placa,
    e.data_saida,
    e.valor_total,
    COALESCE(p.forma_pagamento, 'PENDENTE') AS situacao_pagamento
FROM estadia e 
INNER JOIN veiculo v ON v.id_veiculo = e.id_veiculo
LEFT JOIN pagamento p ON p.id_estadia = e.id_estadia
WHERE e.data_saida IS NOT NULL
ORDER BY e.id_estadia;

SELECT c.nome AS categoria,
    COUNT(*) AS qtd_estadias,
    SUM(e.valor_total) AS receita_total,
    ROUND(AVG(e.valor_total), 2) AS valor_medio,
    MAX(e.valor_total) AS maior_valor
FROM estadia e 
INNER JOIN veiculo v ON v.id_veiculo = e.id_veiculo
INNER JOIN categoria_veiculo c ON c.id_categoria = v.id_categoria
WHERE e.data_saida IS NOT NULL
GROUP BY c.nome
ORDER BY receita_total DESC;

SELECT vg.codigo,
    vg.tipo,
    COUNT(*) AS qtd_estadias
FROM vaga vg
INNER JOIN estadia e ON e.id_vaga = vg.id_vaga
GROUP BY vg.codigo, vg.tipo
HAVING COUNT(*) >= 2
ORDER BY qtd_estadias DESC, vg.codigo;

SELECT c.id_cliente
    c.nome,
    SUM(e.valor_total) AS consumo_total
FROM cliente c 
INNER JOIN veiculo v ON v.id_cliente = c.id_cliente
INNER JOIN stadia e ON e.id_veiculo = v.id_veiculo
WHERE e.data_saida IS NOT NULL
GROUP BY c.id_cliente, c.nome
HAVING SUM(e.valor_total) > (
    SELECT AVG(t.consumo)
    FROM (
        SELECT SUM(e2.valor_total) AS consumo
        FROM estadia e2
        INNER JOIN veiculo v2 ON v2.id_veiculo = e2.id_veiculo
        WHERE e2.data_saida IS NOT NULL
        GROUP BY v2.id_cliente
    ) AS t
)
ORDER BY consumo_total DESC;