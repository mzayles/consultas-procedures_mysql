-- Ex. 01
SELECT titulo FROM livros;

-- Ex. 02
SELECT nome
FROM autores 
WHERE nascimento < '1900-01-01';

-- Ex. 03
SELECT l.titulo, a.nome
FROM livros l
INNER JOIN autores a ON l.autor_id = a.id
WHERE nome = 'J.K. Rowling';

-- Ex. 04
SELECT a.nome, m.curso
FROM alunos a
INNER JOIN matriculas m ON a.id = m.aluno_id
WHERE curso = 'Engenharia de Software';

-- Ex. 05
SELECT produto, SUM(receita) AS total_receita
FROM vendas
GROUP BY produto;

-- Ex. 06
SELECT a.nome, COUNT(autor_id) AS total_livros
FROM autores a 
INNER JOIN livros l ON a.id = l.autor_id
GROUP BY a.nome;

-- Ex. 07
SELECT m.curso, count(a.id) AS quantidade_alunos
FROM matriculas m
INNER JOIN alunos a ON m.aluno_id = a.id
GROUP BY m.curso;

-- Ex. 08
SELECT produto, AVG(receita) AS media_receita
FROM vendas
GROUP BY produto;

-- Ex. 09
SELECT produto, SUM(receita) AS total_receita
FROM vendas
GROUP BY produto
HAVING total_receita > 10000.00;

-- Ex. 10
SELECT a.nome, count(autor._id) AS quantidade_livros
FROM autores a
JOIN livros l ON a.id = l.autor_id
GROUP BY a.nome
HAVING quantidade_livros > 2;

-- Ex. 11
SELECT a.nome, l.titulo
FROM autores a
INNER JOIN livros l ON a.id = l.autor_id;

-- Ex. 12
SELECT a.nome, m.curso
FROM alunos a
INNER JOIN matriculas m ON a.id = m.aluno_id;

-- Ex. 13
SELECT a.nome, l.titulo
FROM autores a
LEFT JOIN livros l ON a.id = l.autor_id;

-- Ex.14
SELECT a.nome, m.curso
FROM alunos a
RIGHT JOIN matriculas m ON a.id = m.aluno_id;

-- Ex. 15
SELECT a.nome, m.curso
FROM alunos a
INNER JOIN matriculas m ON a.id = m.aluno_id;

-- Ex. 16
SELECT nome
FROM autores
WHERE id = (
    SELECT autor_id
    FROM livros
    GROUP BY autor_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- Ex. 17
SELECT produto, SUM(receita) AS total_vendas
FROM vendas
GROUP BY produto
ORDER BY total_vendas
LIMIT 1;