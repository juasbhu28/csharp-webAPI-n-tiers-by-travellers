CREATE VIEW [dbo].[AutoresByEditorialView] AS
SELECT  CONCAT(dbo.autores.nombre, ' ', dbo.autores.apellidos) AS Author, dbo.editoriales.id AS Id_Editorial ,dbo.editoriales.nombre AS Editorial
FROM            
	dbo.autores 
INNER JOIN
	dbo.autores_has_libros 
		ON dbo.autores.id = dbo.autores_has_libros.autores_id 
INNER JOIN
    dbo.libros 
		ON dbo.autores_has_libros.libros_ISBN = dbo.libros.ISBN 
INNER JOIN
	dbo.editoriales 
		ON dbo.libros.editoriales_id = dbo.editoriales.id 
