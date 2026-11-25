SET client_encoding TO 'UTF8';

INSERT INTO categoria_veiculo (nome, valor_hora, valor_maximo_diario,) VALUES
('moto', 4.00, 20.00),
('CARRO', 8.00, 40.00),
('CAMINHONETE', 10.00, 50.00),
('VAM', 12.00, 60.00),
('ELETRICO', 10.00, 50.00);

INSERT INTO cliente (nome, cpf, telefone, email, data_cadastro) VALUES
('Ana Clara', '11111111101', '(18) 90000-0001', 'ana.clara@exemplo.com', '2020-01-12'),
('João Pedro', '11111111102', '(18) 90000-0002', 'joao.pedro@exemplo.com', '2022-02-08'),
('Lucas Oliveira', '11111111103', '(18) 90000-0003', 'lucas.oliveira@exempo.com', '2023-08-23'),
('Miguel Carvalho', '11111111104', '(18) 90000-0004', 'miguel.caravalho@exemplo.com', '2024-03-10'),
('Luisa da Silva', '11111111105', '(18) 90000-0005', 'luisa.silva@exemplo.com', '2020-11-16'),
('Daniel Costa', '11111111106', '(18) 90000-0006', 'daniel.costa@exemplo.com', '2021-07-04'),
('Laura Nogueira', '11111111107', '(18) 90000-0007', 'laura.nogueira@exemplo.com', '2022-10-15'),
('Osmar Pinheiro', '11111111108', '(18) 90000-0008', 'osmar.pinheiro@exemplo.com', '2020-05-22');

INSERT INTO veiculo (placa, modelo, id_cliente, id_categoria) VALUES
('ABC1D23', 'Fiat Argo', 'Branco', 1, 2),   
('BRA2E19', 'Honda CG 160', 'Preta', 2, 1),   
('CAR3F45', 'Toyota Hilux', 'Prata', 3, 3),   
('DEF4G56', 'Renault Master', 'Branca', 4, 4),   
('EFG5H67', 'BYD Dolphin', 'Azul', 5, 5),   
('FGH6I78', 'Chevrolet Onix', 'Vermelho', 1, 2),   
('GHI7J89', 'Yamaha Fazer 250', 'Azul', 6, 1),   
('HIJ8K90', 'Volkswagen Polo', 'Cinza', 2, 2),   
('IJK9L01', 'Hyundai HB20', 'Prata', 3, 2),   
('JKL0M12', 'Fiat Strada', 'Branca', 6, 3);


INSERT INTO estadia (id_veiculo, id_vaga, data_entrada, data_saida, valor_total) VALUES
(1, 1, '2026-11-16 08:00', '2026-11-16 10:30', 24.00), -- 2h30 -> 3h x 8   = 24
(2, 8, '2026-11-16 09:15', '2026-11-16 11:00', 8.00), -- 1h45 -> 2h x 4   = 8
(3, 4, '2026-11-17 13:00', '2026-11-17 18:20', 50.00), -- 5h20 -> 6h x 10  = 60 -> teto 50
(5, 7, '2026-11-17 14:00', '2026-11-17 16:00', 20.00), -- 2h   -> 2h x 10  = 20
(4, 5, '2026-11-18 07:30', '2026-11-18 12:10', 60.00), -- 4h40 -> 5h x 12  = 60
(6, 2, '2026-11-18 18:00', '2026-11-18 19:00', 8.00), -- 1h   -> 1h x 8   = 8
(7, 9, '2026-11-19 08:30', '2026-11-19 17:45', 20.00), -- 9h15 -> 10h x 4  = 40 -> teto 20
(1, 1, '2026-11-20 09:00', '2026-11-20 12:00', 24.00), -- 3h   -> 3h x 8   = 24
(8, 2, '2026-11-20 14:00', '2026-11-20 15:30', 16.00), -- 1h30 -> 2h x 8   = 16
(9, 5, '2026-11-21 10:00', '2026-11-21 14:05', 40.00), -- 4h05 -> 5h x 8   = 40
(2, 8, '2026-11-23 08:00', '2026-11-23 08:50', 4.00), -- 50min-> 1h x 4   = 4
(6, 1, '2026-11-24 16:00', '2026-11-24 19:40', 32.00), --  3h40 -> 4h x 8   = 32
(3, 4, '2026-11-25 08:10', NULL, NULL), -- em andamento
(5, 7, '2026-11-25 09:00', NULL, NULL); -- em andamento

INSERT INTO pagamento (id_estadia, forma_pagamento, valor_pago, data_pagamento) VALUES
(1, 'PIX', 24.00, '2026-11-16 10:32'),
(2, 'DINHEIRO', 8.00, '2026-11-16 11:02'),
(3, 'CARTAO_CREDITO', 50.00, '2026-11-17 18:22'),
(4, 'CARTAO_DEBITO', 20.00, '2026-11-17 16:03'),
(5, 'PIX', 60.00, '2026-11-18 12:12'),
(6, 'DINHEIRO', 8.00, '2026-11-18 19:02'),
(7, 'PIX', 20.00, '2026-11-19 17:47'),
(8, 'CARTAO_DEBITO', 24.00, '2026-11-20 12:01'),
(9, 'PIX', 16.00, '2026-11-20 15:33'),
(10, 'CARTAO_CREDITO', 40.00, '2026-11-21 14:06');

SELECT 'categoria_veiculo' AS tabela, COUNT(*) AS registros FROM categoria_veiculo
UNION ALL SELECT 'cliente', COUNT(*) FROM cliente
UNION ALL SELECT 'vaga', COUNT(*) FROM vaga
UNION ALL SELECT 'veiculo', COUNT(*) FROM veiculo
UNION ALL SELECT 'estadia', COUNT(*) FROM estadia
UNION ALL SELECT 'pagamento', COUNT(*) FROM pagamento;