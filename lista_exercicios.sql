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