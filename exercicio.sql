\c postgres;

DROP DATABASE IF EXISTS BI3034259_Ifsp;
CREATE DATABASE BI3034259_Ifsp;

\c bi3034259_ifsp;

CREATE TABLE Curso
(
    id_curso INTEGER,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INTEGER NOT NULL,
    CONSTRAINT pk_curso PRIMARY KEY(id_curso),
    CONSTRAINT ck_curso_carga_horaria CHECK(carga_horaria > 0)
);

CREATE TABLE Aluno
(
    id_aluno INTEGER,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    data_nascimento DATE,
    id_curso INTEGER NOT NULL,
    CONSTRAINT pk_aluno PRIMARY KEY (id_aluno),
    CONSTRAINT uq_aluno_matricula UNIQUE(matricula),
    CONSTRAINT fk_aluno_curso FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

CREATE TABLE Disciplina
(
    id_disciplina INTEGER,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INTEGER NOT NULL,
    id_curso INTEGER NOT NULL,
    CONSTRAINT pk_disciplina PRIMARY KEY(id_disciplina),
    CONSTRAINT ck_disciplina_carga_horaria CHECK(carga_horaria > 0),
    CONSTRAINT fk_disciplina_curso FOREIGN key (id_curso) REFERENCES Curso(id_curso)
);

ALTER TABLE Aluno ADD COLUMN email VARCHAR(120);
ALTER TABLE Aluno ADD COLUMN telefone VARCHAR(20);
ALTER TABLE Aluno ALTER COLUMN nome TYPE VARCHAR(150);
ALTER TABLE Curso ADD COLUMN modalidade VARCHAR(20) DEFAULT 'PRESENCIAL';
ALTER TABLE Curso ADD CONSTRAINT ck_curso_modalidade CHECK (modalidade IN('PRESENCIAL', 'EAD', 'HIBRIDO'));
ALTER TABLE Disciplina ADD COLUMN ementa VARCHAR(500);
ALTER TABLE Aluno RENAME COLUMN telefone TO celular;
ALTER TABLE Aluno DROP COLUMN celular;
ALTER TABLE Aluno DROP CONSTRAINT uq_aluno_matricula;
ALTER TABLE Aluno ADD CONSTRAINT uq_aluno_matricula UNIQUE (matricula);

DROP TABLE Curso;

DROP TABLE Aluno;
DROP TABLE Disciplina;
DROP TABLE Curso;

INSERT INTO chamada (prontuario, nome, o_que_eh_ddl) VALUES ('Bi3034259', 'guilherme peres medeiros barreto', 'Data Definition Language ou Linguagem de Definição de Dados');