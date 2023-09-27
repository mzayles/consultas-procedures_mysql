-- Ex. 01
DELIMITER //
CREATE PROCEDURE sp_ListarAutores()
BEGIN
	SELECT Nome, Sobrenome
  FROM Autor;
END;
//
DELIMITER ;

CALL sp_ListarAutores();

-- Ex. 02
DELIMITER //
CREATE PROCEDURE sp_LivrosPorCategoria(IN nm_categoria VARCHAR(50))
BEGIN
	SELECT l.Titulo, c.Nome AS Categoria
    FROM Livro l
    INNER JOIN Categoria c ON l.Categoria_ID = c.Categoria_ID
    WHERE c.Nome = nm_categoria;
END;
//
DELIMITER ;

CALL sp_LivrosPorCategoria('Romance');

-- Ex. 03
DELIMITER //
CREATE PROCEDURE sp_ContarLivrosPorCategoria(IN nm_categoria VARCHAR(50))
BEGIN
	SELECT c.Nome, COUNT(l.Titulo) AS qtd_livros
    FROM Livro l
    INNER JOIN Categoria c ON l.Categoria_ID = c.Categoria_ID
    WHERE c.Nome = nm_categoria
    GROUP BY c.Nome;
END;
//
DELIMITER ;

CALL sp_ContarLivrosPorCategoria('Autoajuda');

-- Ex. 04
DELIMITER //
CREATE PROCEDURE sp_VerificarLivrosCategoria(IN nm_categoria VARCHAR(50), OUT ex_livros ENUM('sim', 'não'))
BEGIN
    DECLARE qtd_livros INT;

	SELECT COUNT(l.Categoria_ID) AS qtd_livros
    INTO qtd_livros
    FROM Categoria c
    INNER JOIN Livro l ON c.Categoria_ID = l.Categoria_ID
    WHERE c.Nome = nm_categoria
    GROUP BY c.Nome;
   
    IF qtd_livros > 0 THEN
		SET ex_livros = 'sim';
	ELSE
		SET ex_livros = 'não';
	END IF;
END;
//
DELIMITER ;

CALL sp_VerificarLivrosCategoria('Romance', @ex_livros);
SELECT @ex_livros;

-- Ex. 05
DELIMITER //
CREATE PROCEDURE sp_LivrosAteAno(IN ano_publicado INT)
BEGIN
	SELECT l.Titulo, l.Ano_Publicacao
	FROM Livro l
	WHERE l.Ano_Publicacao < ano_publicado
    ORDER BY l.Ano_Publicacao;
END;
//
DELIMITER ;

CALL sp_LivrosAteAno(2005);

-- Ex. 06
DELIMITER //
CREATE PROCEDURE sp_TitulosPorCategoria(IN nm_categoria VARCHAR(50))
BEGIN
	SELECT l.Titulo
    FROM Livro l
    INNER JOIN Categoria c ON l.Categoria_ID = c.Categoria_ID
    WHERE c.Nome = nm_categoria;
END;
//
DELIMITER ;

CALL sp_TitulosPorCategoria('Romance');
