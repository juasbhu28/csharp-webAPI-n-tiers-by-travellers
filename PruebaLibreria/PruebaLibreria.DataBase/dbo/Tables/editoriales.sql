CREATE TABLE [dbo].[editoriales] (
    [id]     INT          IDENTITY (1, 1) NOT NULL,
    [nombre] VARCHAR (45) NOT NULL,
    [sede]   VARCHAR (45) NOT NULL,
    CONSTRAINT [PK_editoriales] PRIMARY KEY CLUSTERED ([id] ASC)
);

