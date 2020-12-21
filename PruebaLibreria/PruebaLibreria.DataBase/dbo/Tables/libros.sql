CREATE TABLE [dbo].[libros] (
    [ISBN]           INT          NOT NULL,
    [editoriales_id] INT          NULL,
    [titulo]         VARCHAR (45) NULL,
    [sinopsis]       TEXT         NULL,
    [n_paginas]      VARCHAR (45) NULL,
    PRIMARY KEY CLUSTERED ([ISBN] ASC),
    CONSTRAINT [FK_libros_ToEditoriales] FOREIGN KEY ([editoriales_id]) REFERENCES [dbo].[editoriales] ([id])
);

