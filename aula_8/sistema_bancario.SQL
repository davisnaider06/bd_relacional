CREATE TABLE clientes (
id_cliente SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cpf VARCHAR(11) UNIQUE NOT NULL,
endereco TEXT,
telefone VARCHAR(15)
);

INSERT INTO clientes (nome, cpf, endereco, telefone) VALUES
('João Silva', '12345678900', 'Rua A, 123', '11999990000'),
('Maria Oliveira', '98765432100', 'Rua B, 456', '11988887777');



CREATE TABLE contas (
id_conta SERIAL PRIMARY KEY,
numero_conta VARCHAR(10) UNIQUE NOT NULL,
saldo DECIMAL(10,2) DEFAULT 0,
id_cliente INT REFERENCES clientes(id_cliente) ON DELETE CASCADE
);

INSERT INTO contas (numero_conta, saldo, id_cliente) VALUES
('000123', 1500.00, 1),
('000456', 2300.00, 2);



CREATE TABLE transacoes (
id_transacao SERIAL PRIMARY KEY,
id_conta INT REFERENCES contas(id_conta) ON DELETE CASCADE,
tipo VARCHAR(15) CHECK (tipo IN ('Depósito', 'Saque', 'Transferência')),
valor DECIMAL(10,2) NOT NULL CHECK (valor > 0),
data_transacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
destino_transferencia INT REFERENCES contas(id_conta)
);

INSERT INTO transacoes (id_conta, tipo, valor) VALUES
(1, 'Depósito', 500.00),
(2, 'Saque', 200.00),
(1, 'Transferência', 300.00); 

SELECT * FROM clientes;

SELECT contas.numero_conta, clientes.nome, contas.saldo
FROM contas 
INNER JOIN clientes ON contas.id_cliente = clientes.id_cliente;

SELECT transacoes.tipo, transacoes.valor, transacoes.data_transacao, 
contas.numero_conta AS origem, 
c2.numero_conta AS destino
FROM transacoes
INNER JOIN contas ON transacoes.id_conta = contas.id_conta
LEFT JOIN contas c2 ON transacoes.destino_transferencia = c2.id_conta;


UPDATE contas
SET saldo = saldo + 500.00 
WHERE id_conta = 1;

DELETE FROM clientes WHERE id_cliente = 2;


-- 1. Inserir um novo cliente no sistema
INSERT INTO clientes (nome, cpf) VALUES ('João P. Leite', '11122233344');

-- 2. Criar uma conta para esse novo cliente
-- O id_cliente será o último inserido, que é o 'João P. Leite'.
INSERT INTO contas (numero_conta, saldo, id_cliente) VALUES ('000789', 500.00, (SELECT id_cliente FROM clientes WHERE cpf = '11122233344'));

-- 3. Realizar uma transferência de R$ 100,00 da conta 000123 para a conta 000789
-- Inicia uma transação para garantir que ambas as operações sejam bem-sucedidas ou falhem juntas.
BEGIN;

-- 3a. Subtrair 100 da conta de origem (000123)
UPDATE contas
SET saldo = saldo - 100.00
WHERE numero_conta = '000123';

-- 3b. Adicionar 100 na conta de destino (000789)
UPDATE contas
SET saldo = saldo + 100.00
WHERE numero_conta = '000789';

-- 3c. Registrar a transação
-- Note que o id_conta e o destino_transferencia são obtidos pelas subconsultas
INSERT INTO transacoes (id_conta, tipo, valor, destino_transferencia)
VALUES (
    (SELECT id_conta FROM contas WHERE numero_conta = '000123'),
    'Transferência',
    100.00,
    (SELECT id_conta FROM contas WHERE numero_conta = '000789')
);

-- Confirma a transação
COMMIT;

-- 4. Listar todas as contas do banco, mostrando os saldos atualizados
SELECT
    c.numero_conta,
    cl.nome AS nome_cliente,
    c.saldo
FROM
    contas AS c
INNER JOIN
    clientes AS cl ON c.id_cliente = cl.id_cliente
ORDER BY c.numero_conta;

