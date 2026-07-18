-- Insert na tabela USUÁRIO
INSERT INTO usuario (cpf, nome)
  VALUES ('11111111111', 'Ana Souza'),
         ('22222222222', 'Bruno Lima'),
         ('33333333333', 'Carla Mendes'),
         ('44444444444', 'Diego Alves'),
         ('55555555555', 'Elaine Costa');

-- Insert na tabela VENDEDOR
INSERT INTO vendedor (cpf, nome, logo)
  VALUES ('10000000000101', 'Leilões Norte Ltda', 'logo_norte.png'),
         ('10000000000102', 'Casa de Leilões Sul', 'logo_sul.png'),
         ('10000000000103', 'Antiguidades Brasil', 'logo_antiguidades.png'),
         ('10000000000104', 'Leilões Premium', 'logo_premium.png'),
         ('10000000000105', 'Bens & Cia Leilões', NULL);

-- Insert na tabela LEILOEIRO
INSERT INTO LEILOEIRO (cpf, nome) 
  VALUES ('66666666666', 'Fernando Ribeiro'),
         ('77777777777', 'Gabriela Nunes'),
         ('88888888888', 'Henrique Barros'),
         ('99999999999', 'Isabela Rocha'),
         ('10101010101', 'João Pedro Farias');

-- Insert na tabela LEILAO
INSERT INTO LEILAO (id_leilao, nome, descricao, data_hora_inicio, data_hora_fim, cnpj, cpf) 
  VALUES (1, 'Leilão de Veículos', 'Carros e motos usados', '2026-08-01 09:00:00', '2026-08-01 18:00:00', '10000000000101', '66666666666'),
         (2, 'Leilão de Antiguidades', 'Móveis e objetos raros', '2026-08-05 10:00:00', '2026-08-05 17:00:00', '10000000000103', '77777777777'),
         (3, 'Leilão de Eletrônicos', 'Notebooks e celulares', '2026-08-10 09:30:00', '2026-08-10 16:00:00', '10000000000104', '88888888888'),
         (4, 'Leilão de Imóveis', 'Terrenos e imóveis residenciais', '2026-08-15 08:00:00', '2026-08-15 20:00:00', '10000000000102', '99999999999'),
         (5, 'Leilão Rural', 'Máquinas e equipamentos agrícolas', '2026-08-20 11:00:00', '2026-08-20 19:00:00', '10000000000105', '10101010101');

-- Insert na tabela CATEGORIA
INSERT INTO CATEGORIA (id_categoria, nome, descricao) 
  VALUES (1, 'Veículos', 'Carros, motos e caminhões'),
         (2, 'Antiguidades', 'Peças raras e colecionáveis'),
         (3, 'Eletrônicos', 'Dispositivos eletrônicos em geral'),
         (4, 'Imóveis', 'Casas, apartamentos e terrenos'),
         (5, 'Máquinas Agrícolas', NULL);
        
-- Insert na tabela LOTE
INSERT INTO LOTE (id_lote, nome, descricao, arrematado, lance_minimo, data_hora_fim, id_leilao, id_categoria) 
  VALUES (1, 'Fiat Uno 2015', 'Carro popular em bom estado', FALSE, 15000.00, '2026-08-01 12:00:00', 1, 1),
         (2, 'Cômoda Antiga', 'Cômoda de madeira maciça, século XIX', FALSE, 800.00, '2026-08-05 13:00:00', 2, 2),
         (3, 'Notebook Dell', 'Notebook usado, 16GB RAM', TRUE, 2500.00, '2026-08-10 14:00:00', 3, 3),
         (4, 'Terreno Zona Sul', 'Terreno de 500m² em área residencial', FALSE, 250000.00, '2026-08-15 17:00:00', 4, 4),
         (5, 'Trator Agrícola', 'Trator usado, revisado', FALSE, 45000.00, '2026-08-20 16:30:00', 5, 5);

-- Insert na tabela OFERECE_LANCE
INSERT INTO OFERECE_LANCE (cpf, id_lote, id_lance, lance, data_hora_lance) 
  VALUES ('11111111111', 1, 1, 15500.00, '2026-08-01 10:15:00'),
         ('22222222222', 2, 1, 850.00, '2026-08-05 11:20:00'),
         ('33333333333', 3, 1, 2700.00, '2026-08-10 12:05:00'),
         ('44444444444', 4, 1, 255000.00, '2026-08-15 15:40:00'),
         ('55555555555', 5, 1, 46000.00, '2026-08-20 13:10:00');

-- Insert na tabela USUARIO_TELEFONE
INSERT INTO USUARIO_TELEFONE (telefone, cpf) 
  VALUES ('84999990001', '11111111111'),
         ('84999990002', '22222222222'),
         ('84999990003', '33333333333'),
         ('84999990004', '44444444444'),
         ('84999990005', '55555555555');

-- Insert na tabela USUARIO_ENDERECO
INSERT INTO USUARIO_ENDERECO (endereco, cpf) 
  VALUES ('Rua das Flores, 100 - Natal/RN', '11111111111'),
         ('Av. Central, 200 - Parnamirim/RN', '22222222222'),
         ('Rua do Sol, 300 - Mossoró/RN', '33333333333'),
         ('Av. Litorânea, 400 - Natal/RN', '44444444444'),
         ('Rua das Palmeiras, 500 - Parnamirim/RN', '55555555555');

-- Insert na tabela LOTE_ENDERECO
INSERT INTO LOTE_ENDERECO (endereco, id_lote)  
    VALUES ('Pátio de Veículos, Galpão 1 - Natal/RN', 1),
           ('Depósito Central, Sala 3 - Mossoró/RN', 2),
           ('Galpão de Eletrônicos, Setor B - Natal/RN', 3),
           ('Zona Sul, Quadra 12 - Natal/RN', 4),
           ('Sítio Boa Vista, Estrada Rural km 5 - RN', 5);
