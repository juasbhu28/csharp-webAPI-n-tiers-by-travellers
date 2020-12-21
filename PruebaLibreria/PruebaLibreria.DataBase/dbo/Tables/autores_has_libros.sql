CREATE TABLE [dbo].[autores_has_libros] (
    [autores_id]  INT NOT NULL,
    [libros_ISBN] INT NOT NULL,
    FOREIGN KEY ([autores_id]) REFERENCES [dbo].[autores] ([id]),
    FOREIGN KEY ([libros_ISBN]) REFERENCES [dbo].[libros] ([ISBN])
);

