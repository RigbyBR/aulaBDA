INSERT INTO tabela (col1, col2, ..., coln) VALUES (val1, val2, ..., valn) 

INSERT INTO departamento (nome, numero) VALUES('Financeiro', 1); 
INSERT INTO departamento (nome, numero) VALUES('Comercial', 2); 
INSERT INTO departamento (nome, numero) VALUES('Juridico', 3); 

INSERT INTO Funcionario (ident, nome, sobrenome, endereco, dt_nasc, salario, sexo, supident, dnumero)
            VALUE (1,'Murilo', 'Vargas', 'R.Pedro de Carvalho', '1990-05-06', 85152.25, 'M', NULL,1);

INSERT INTO Funcionario (ident, nome, sobrenome, endereco, dt_nasc, salario, sexo, supident, dnumero)
            VALUE (2,'Valtemir', 'Alencar', 'R.Joao Galo', '1970-07-08', 99152.25, 'M', 1,2);

INSERT INTO Funcionario (ident, nome, sobrenome, endereco, dt_nasc, salario, sexo, supident, dnumero)
            VALUE (3,'Camila', 'Ferros', 'R.Marechal Teodoro', '2000-07-14', 75500.50, 'F', 1,3);

SELECT * FROM tabela ORDER BY coluna