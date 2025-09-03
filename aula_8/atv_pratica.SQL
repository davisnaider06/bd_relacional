-- Tabela para armazenar os cursos
CREATE TABLE cursos (
    id_curso SERIAL PRIMARY KEY,
    nome_curso VARCHAR(255) NOT NULL
);

-- Tabela para armazenar os alunos
CREATE TABLE alunos (
    id_aluno SERIAL PRIMARY KEY,
    nome_aluno VARCHAR(255) NOT NULL
);

-- Tabela de junção para relacionar alunos e cursos
-- Essa tabela é necessária para a relação muitos-para-muitos
CREATE TABLE alunos_cursos (
    id_aluno_curso SERIAL PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);


-- Inserindo os cursos
INSERT INTO cursos (nome_curso) VALUES
('Engenharia'),
('Computação');

-- Inserindo os alunos
INSERT INTO alunos (nome_aluno) VALUES
('Carlos Almeida'),
('Fernanda Costa'),
('Roberto');

-- Relacionando os alunos aos seus cursos
-- Note que não há uma entrada para Roberto, pois ele não tem um curso
INSERT INTO alunos_cursos (id_aluno, id_curso) VALUES
(1, 1), -- Carlos Almeida - Engenharia
(2, 2);  -- Fernanda Costa - Computação


SELECT
    a.nome_aluno AS nome,
    c.nome_curso AS curso
FROM
    alunos_cursos AS ac
INNER JOIN
    alunos AS a ON ac.id_aluno = a.id_aluno
INNER JOIN
    cursos AS c ON ac.id_curso = c.id_curso;


	SELECT
    a.nome_aluno AS nome,
    c.nome_curso AS curso
FROM
    alunos AS a
LEFT JOIN
    alunos_cursos AS ac ON a.id_aluno = ac.id_aluno
LEFT JOIN
    cursos AS c ON ac.id_curso = c.id_curso;