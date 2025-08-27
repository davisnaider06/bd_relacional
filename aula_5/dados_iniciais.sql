-- Usuários
INSERT INTO Usuario (nome, email, telefone) VALUES
('Ana Silva', 'ana@email.com', '11987654321'),
('Carlos Souza', 'carlos@email.com', '21912345678'),
('Mariana Costa', 'mariana@email.com', '31998765432');

-- Eventos climáticos
INSERT INTO Evento (tipo, descricao, dataEvento, localizacao) VALUES
('Chuva Forte', 'Chuva intensa na região sul da cidade', '2025-02-20', 'São Paulo - SP'),
('Enchente', 'Alagamento próximo ao rio Tietê', '2025-02-21', 'Guarulhos - SP'),
('Queimada', 'Foco de incêndio em área rural', '2025-02-22', 'Cuiabá - MT');

-- Sensores
INSERT INTO Sensor (tipo, localizacao, dataInstalacao) VALUES
('Pluviômetro', 'Zona Leste - SP', '2024-01-15'),
('Sensor de Fumaça', 'Chapada dos Guimarães - MT', '2024-03-10'),
('Higrômetro', 'Centro - SP', '2024-06-05');

-- Leituras
INSERT INTO Leitura (idSensor, dataLeitura, valor) VALUES
(1, '2025-02-20 10:00:00', 35.5),
(2, '2025-02-22 14:30:00', 80.2),
(3, '2025-02-21 09:15:00', 60.0);

-- Alertas
INSERT INTO Alerta (idEvento, idUsuario, dataEnvio, mensagem) VALUES
(1, 1, '2025-02-20 11:00:00', 'Aviso de chuva forte em São Paulo'),
(2, 2, '2025-02-21 08:00:00', 'Risco de enchente em Guarulhos'),
(3, 3, '2025-02-22 15:00:00', 'Queimada registrada em Cuiabá');

-- Histórico de login (tabela auxiliar)
INSERT INTO Historico_Login (idUsuario, dataLogin, ipAcesso) VALUES
(1, '2025-02-20 09:00:00', '192.168.0.10'),
(2, '2025-02-21 08:15:00', '192.168.0.20'),
(3, '2025-02-22 13:45:00', '192.168.0.30');

-- ==============================
-- CONSULTAS SIMPLES
-- ==============================

-- 1. Listar todos os usuários cadastrados
SELECT * FROM Usuario;

-- 2. Mostrar todos os eventos climáticos
SELECT * FROM Evento;

-- ==============================
-- CONSULTAS FILTRADAS
-- ==============================

-- 1. Mostrar eventos que ocorreram em São Paulo
SELECT * FROM Evento
WHERE localizacao LIKE '%SP%';

-- 2. Listar alertas enviados para o usuário 'Carlos Souza'
SELECT A.mensagem, A.dataEnvio
FROM Alerta A
JOIN Usuario U ON A.idUsuario = U.idUsuario
WHERE U.nome = 'Carlos Souza';