CREATE TABLE [dbo].[autores] (
    [id]        INT          IDENTITY (1, 1) NOT NULL,
    [nombre]    VARCHAR (45) NOT NULL,
    [apellidos] VARCHAR (45) NOT NULL,
    CONSTRAINT [PK_autores] PRIMARY KEY CLUSTERED ([id] ASC)
);

