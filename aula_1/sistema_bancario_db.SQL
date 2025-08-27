

-- Tabela cliente
CREATE TABLE cliente (
    id_cliente serial PRIMARY KEY,
    nome_cliente VARCHAR(100),
    cidade_cliente VARCHAR(100),
    endereco_cliente VARCHAR(200)
);

-- Tabela agencia
CREATE TABLE agencia (
    nome_agencia VARCHAR(100) PRIMARY KEY,
    cidade_agencia VARCHAR(100),
    depositos DECIMAL(12,2)
);

-- Tabela conta
CREATE TABLE conta (
    numero_conta INT PRIMARY KEY,
    nome_agencia VARCHAR(100),
    saldo DECIMAL(12,2),
    FOREIGN KEY (nome_agencia) REFERENCES agencia(nome_agencia)
);

-- Tabela emprestimo
CREATE TABLE emprestimo (
    numero_emprestimo INT PRIMARY KEY,
    nome_agencia VARCHAR(100),
    valor DECIMAL(12,2),
    FOREIGN KEY (nome_agencia) REFERENCES agencia(nome_agencia)
);

-- Relação cliente-conta (N:N)
CREATE TABLE cliente_conta (
    id_cliente INT,
    numero_conta INT,
    PRIMARY KEY (id_cliente, numero_conta),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (numero_conta) REFERENCES conta(numero_conta)
);
