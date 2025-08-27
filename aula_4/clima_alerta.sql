-- Usuário (quem recebe alertas ou cadastra eventos)
CREATE TABLE Usuario (
    idUsuario serial PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20)
);

-- Evento climático (ex.: enchente, queimadas, tempestade)
CREATE TABLE Evento (
    idEvento serial PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    descricao TEXT,
    dataEvento DATE NOT NULL,
    localizacao VARCHAR(100)
);

-- Alerta enviado
CREATE TABLE Alerta (
    idAlerta serial PRIMARY KEY,
    idEvento INT,
    idUsuario INT,
    dataEnvio timestamp NOT NULL,
    mensagem TEXT,
    FOREIGN KEY (idEvento) REFERENCES Evento(idEvento),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

-- Sensor meteorológico (se aplicável ao modelo)
CREATE TABLE Sensor (
    idSensor serial PRIMARY KEY,
    tipo VARCHAR(50),
    localizacao VARCHAR(100),
    dataInstalacao DATE
);

-- Leituras de sensores
CREATE TABLE Leitura (
    idLeitura serial PRIMARY KEY,
    idSensor INT,
    dataLeitura timestamp NOT NULL,
    valor DECIMAL(10,2),
    FOREIGN KEY (idSensor) REFERENCES Sensor(idSensor)
);



CREATE TABLE Historico_Login (
    idHistorico serial PRIMARY KEY,
    idUsuario INT,
    dataLogin timestamp NOT NULL,
    ipAcesso VARCHAR(45),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);