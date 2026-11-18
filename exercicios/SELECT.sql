\encoding UTF8
\c cadastro


-- 6. Todos os dados da tabela curso
SELECT * FROM cadastro_curso;

-- 7. Nome e matrícula de todos os alunos
SELECT nome, matricula FROM cadastro_aluno;

-- 8. Alunos em ordem alfabética pelo nome
SELECT * FROM cadastro_aluno ORDER BY nome ASC;

-- 9. Disciplinas por carga horária decrescente (empate: nome crescente)
SELECT * FROM cadastro_disciplina ORDER BY cargaHoraria DESC, nome ASC;

-- 10. Alunos do curso de código 1
SELECT * FROM cadastro_aluno WHERE idCurso = 1;

-- 11. Disciplinas com carga horária maior ou igual a 80
SELECT * FROM cadastro_disciplina WHERE cargaHoraria >= 80;

-- 12. Alunos nascidos antes de 2005-01-01
SELECT * FROM cadastro_aluno WHERE dataNasci < '2005-01-01';

-- 13. Alunos cujo nome começa com A (LIKE)
SELECT * FROM cadastro_aluno WHERE nome LIKE 'A%';

-- 14. Alunos sem data de nascimento (IS NULL, nunca "= NULL")
SELECT * FROM cadastro_aluno WHERE dataNasci IS NULL;

-- 15. Alunos dos cursos 1 e 3 (IN)
SELECT * FROM cadastro_aluno WHERE idCurso IN (1, 3);

-- 16. Disciplinas com carga horária entre 60 e 80, inclusive (BETWEEN)
SELECT * FROM cadastro_disciplina WHERE cargaHoraria BETWEEN 60 AND 80;

-- 17. Nome de cada aluno e o nome do seu curso
SELECT a.nome AS cadastro_aluno, c.nome AS cadastro_curso
FROM cadastro_aluno a
INNER JOIN cadastro_curso c ON c.id_curso = a.id_curso;

-- 18. Nome da disciplina, carga horária e nome do curso
SELECT d.nome AS cadastro_disciplina, d.cargaHoraria, c.nome AS cadastro_curso
FROM cadastro_disciplina d
INNER JOIN cadastro_curso c ON c.id_curso = d.id_curso;

-- 19. Nome e matrícula dos alunos de "Engenharia de Computação"
SELECT a.nome, a.matricula
FROM cadastro_aluno a
INNER JOIN cadastro_curso c ON c.id_curso = a.id_curso
WHERE c.nome = 'Engenharia de Computação';

-- 20. Quantidade total de alunos
SELECT COUNT(*) AS total_alunos FROM aluno;

-- 21. Maior e menor carga horária entre as disciplinas
SELECT MAX(cargaHoraria) AS maior_carga,
       MIN(cargaHoraria) AS menor_carga
FROM cadastro_disciplina;

-- 22. Média das cargas horárias das disciplinas
SELECT AVG(cargaHoraria) AS media_cargahoraria FROM cadastro_disciplina;

-- 23. Cada curso e sua quantidade de alunos (inclui cursos sem alunos = 0)
--     LEFT JOIN preserva o curso 4; COUNT(a.id_aluno) ignora NULL.
SELECT c.nome, COUNT(a.id_aluno) AS qtd_alunos
FROM cadastro_curso c
LEFT JOIN aluno a ON a.id_curso = c.id_curso
GROUP BY c.id_curso, c.nome
ORDER BY c.id_curso;

-- 24. Cada curso e a soma das cargas horárias das disciplinas (sem disciplinas = 0)
--     COALESCE troca o NULL da soma por 0.
SELECT c.nome, COALESCE(SUM(d.cargaHoraria), 0) AS soma_cargaHoraria
FROM cadastro_curso c
LEFT JOIN cadastro_disciplina d ON d.id_curso = c.id_curso
GROUP BY c.id_curso, c.nome
ORDER BY c.id_curso;

-- 25. Cursos com pelo menos três alunos (GROUP BY + HAVING)
SELECT c.nome, COUNT(a.id_aluno) AS qtd_alunos
FROM cadastro_curso c
INNER JOIN aluno a ON a.id_curso = c.id_curso
GROUP BY c.id_curso, c.nome
HAVING COUNT(a.id_aluno) >= 3
ORDER BY c.id_curso;