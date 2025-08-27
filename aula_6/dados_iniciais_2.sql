-- Inserindo 2 novos alertas que dependem de Usuario (FK) e Evento (FK)
INSERT INTO Alerta (idEvento, idUsuario, dataEnvio, mensagem) VALUES
(1, 2, '2025-02-20 12:30:00', 'Chuva forte continua em São Paulo'),
(3, 1, '2025-02-22 16:30:00', 'Novo foco de queimada em Cuiabá detectado');

-- ============================================
-- CONSULTAS ORDENADAS
-- ============================================

-- 1. Listar todos os eventos em ordem cronológica (mais antigos primeiro)
SELECT * FROM Evento
ORDER BY dataEvento ASC;

-- 2. Listar todos os alertas em ordem decrescente de envio (mais recentes primeiro)
SELECT * FROM Alerta
ORDER BY dataEnvio DESC;

-- ============================================
-- CONSULTAS COM ORDER BY + LIMIT
-- ============================================

-- 1. Mostrar os 3 eventos mais recentes
SELECT * FROM Evento
ORDER BY dataEvento DESC
LIMIT 3;

-- 2. Mostrar os 2 alertas mais recentes
SELECT * FROM Alerta
ORDER BY dataEnvio DESC
LIMIT 2;