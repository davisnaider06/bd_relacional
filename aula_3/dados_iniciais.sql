-- Inserir estados
INSERT INTO estado (nome, regiao) VALUES
('São Paulo', 'Sudeste'),
('Paraná', 'Sul'),
('Bahia', 'Nordeste');

-- Inserir cidades
INSERT INTO cidade (nome, estado_id) VALUES
('Santos', 1),
('Curitiba', 2),
('Salvador', 3);

-- Inserir usuários
INSERT INTO "user" (nome, email, senha, cidade_id) VALUES
('João Silva', 'joao@email.com', '12345', 1),
('Maria Souza', 'maria@email.com', 'abcde', 2),
('Pedro Lima', 'pedro@email.com', 'senha123', 3);

-- Inserir eventos
INSERT INTO eventos (data, nivel, estado_id) VALUES
('2025-08-01 14:00:00', 2, 1),
('2025-08-05 10:30:00', 3, 2),
('2025-08-08 08:00:00', 1, 3);

-- Inserir alertas
INSERT INTO alerts (nome, cidade_id, user_id, evento_id) VALUES
('Alerta de enchente', 1, 1, 1),
('Alerta de tempestade', 2, 2, 2),
('Alerta de calor extremo', 3, 3, 3);


--CONSULTAS SIMPLES

-- Listar todos os usuários
SELECT * FROM "user";

-- Listar todos os eventos
SELECT * FROM eventos;


--CONSULTA FILTRADA

-- Usuários que moram em Curitiba
SELECT u.nome, u.email, c.nome AS cidade
FROM "user" u
JOIN cidade c ON u.cidade_id = c.id
WHERE c.nome = 'Curitiba';

-- Eventos com nível maior ou igual a 2
SELECT e.id, e.data, e.nivel, es.nome AS estado
FROM eventos e
JOIN estado es ON e.estado_id = es.id
WHERE e.nivel >= 2;




