CREATE TABLE Autor (
    idAutor serial PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50)
);

-- Tabela Livro
CREATE TABLE Livro (
    idLivro serial PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    anoPublicacao INT,
    isbn VARCHAR(20)
);

-- Tabela Cliente (Leitor)
CREATE TABLE Cliente (
    idCliente serial PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20)
);

-- Tabela Emprestimo
CREATE TABLE Emprestimo (
    idEmprestimo serial PRIMARY KEY,
    dataEmprestimo DATE NOT NULL,
    dataDevolucao DATE,
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabela associativa LivroAutor (N:M)
CREATE TABLE LivroAutor (
    idLivro INT,
    idAutor INT,
    PRIMARY KEY (idLivro, idAutor),
    FOREIGN KEY (idLivro) REFERENCES Livro(idLivro),
    FOREIGN KEY (idAutor) REFERENCES Autor(idAutor)
);

-- Tabela associativa EmprestimoLivro (N:M)
CREATE TABLE EmprestimoLivro (
    idEmprestimo INT,
    idLivro INT,
    PRIMARY KEY (idEmprestimo, idLivro),
    FOREIGN KEY (idEmprestimo) REFERENCES Emprestimo(idEmprestimo),
    FOREIGN KEY (idLivro) REFERENCES Livro(idLivro)
);