\c postgres;
DROP DATABASE IF EXISTS cadastro;

CREATE DATABASE cadastro;

\c cadastro;

CREATE DOMAIN TIPO_ID AS CHAR(4);
CREATE DOMAIN D_NUM AS INTEGER n 
CHECK VALUE (VALUE > 0 AND VALUE < 21);

CREATE TABLE cadastro_curso
(
    idCurso INTEGER,
    nome VARCHAR(15) NOT NULL,
    cargaHoraria INTEGER,
    PRIMARY KEY(idCurso)
);

CREATE TABLE cadastro_aluno
(
    idAluno INTEGER,
    nome VARCHAR(15) NOT NULL,
    matricula INTEGER NOT NULL UNIQUE,
    dataNasci DATE,
    idCurso INTEGER,
    PRIMARY KEY(idAluno),
    FOREIGN KEY(idCurso) REFERENCES cadastro_curso(idCurso)
);

CREATE TABLE cadastro_disciplina
(
    idDisciplina INTEGER,
    nome VARCHAR(15) NOT NULL,
    cargaHoraria INTEGER,
    idCurso INTEGER,
    PRIMARY KEY(idDisciplina)
    FOREIGN KEY(idCurso) REFERENCES cadastro_curso(idCurso)
);

INSERT INTO cadastro_curso(idCurso, nome, cargaHoraria)
VALUES
(1, 'Engenharia de Comptacao', 3600),
(2, 'Analise e Desenvolvimento de Sistema', 2400),
(3, 'Redes de Computadores', 2000),
(4, 'Gestao da Tecnologia da Informacao', 2000);

INSERT INTO cadastro_aluno(idAluno, nome, matricula, dataNasci, idCurso)
VALUES
(1, 'Ana Souza',         2026001, '2005-03-15', 1),
(2, 'Buno Lima',         2026002, '2004-07-22', 1),
(3, 'Carla Mendes',      2026003, '2006-01-10', 2),
(4, 'Diego Santos',      2026004, '2003-11-05', 2),
(5, 'Elisa Rocha',       2026005, '2005-09-18', 3),
(6, 'Felipe Alves',      2026006, '2004-04-30', 3),
(7, 'Gabriela Costa',    2026007, '2006-06-12', 1),
(8, 'Henrique Martins',  2026008, NULL,         2),
(9, 'Isabela Oliveira',  2026009, '2005-12-01', 1),
(10, 'Joao Pereira',     2026010, NULL,         3);

INSERT INTO cadastro_disciplina(idDisciplina, nome, cargaHoraria, idCurso)
VALUES
(1, 'Algoritmos',                  80, 1),
(2, 'Banco de Dados I',            80, 1),
(3, 'Arquitetura de Computadores', 60, 1),
(4, 'Programacao Web',             80, 2),
(5, 'Engenharia de Software',      60, 2),
(6, 'Banco de Dados',              60, 2),
(7, 'Redes de Computadores I',     80, 3),
(8, 'Seguranca de Redes',          60, 3),
(9, 'Sistemas Operacionais',       60, 3);

INSERT INTO cadastro_aluno(idAluno, nome, matricula,dataNasci,idCurso)
VALUES
(11, 'Lucas Ferreira,' 2026001, '2005-08-20', 1);

-- ERRO:  duplicate key value violates unique constraint "aluno_matricula_key" --
-- DETALHE: Key (matricula)=(2026001) already exists. --

-- Explicacao:
-- Foi violada a restricao UNIQUE da coluna matricula. A matricula 2026001 --
-- ja pertence a aluna Ana Souza (id 1), e a matricula deve identificar --
-- cada aluno de forma única. O id 11 não é o problema --
-- por isso o SGBD rejeitou a linha inteira, sem inseri-la. --

INSERT INTO cadastro_disciplina(idDisciplina, nome, cargaHoraria, idCurso)
VALUES
(10, 'Inteligencia Artificial', 80, 99);

-- ERRO:  insert or update on table "disciplina" violates foreign key --
-- constraint "disciplina_id_curso_fkey" --
-- DETALHE: Key (id_curso)=(99) is not present in table "curso". --
 
-- Explicacao:
-- A coluna disciplina.id_curso é chave estrangeira de curso.id_curso --
-- Como nao existe curso com codigo 99, a disciplina ficaria vinculada a --
-- um curso inexistente (registro orfao). A restricao de integridade --
-- referencial impede isso, garantindo que toda disciplina pertenca a um --
-- curso cadastrado --

-- Conferencia final dos dados inseridos
SELECT COUNT(*) AS total_cursos      FROM curso;       -- esperado: 4
SELECT COUNT(*) AS total_alunos      FROM aluno;       -- esperado: 10
SELECT COUNT(*) AS total_disciplinas FROM disciplina;  -- esperado: 9