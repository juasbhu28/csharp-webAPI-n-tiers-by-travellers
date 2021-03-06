USE [libreria]
GO
ALTER TABLE [dbo].[libros] DROP CONSTRAINT [FK_libros_ToEditoriales]
GO
ALTER TABLE [dbo].[autores_has_libros] DROP CONSTRAINT [FK__autores_h__libro__5441852A]
GO
ALTER TABLE [dbo].[autores_has_libros] DROP CONSTRAINT [FK__autores_h__autor__534D60F1]
GO
/****** Object:  View [dbo].[AutoresByEditorialView]    Script Date: 2020-12-21 05:30:09 ******/
DROP VIEW [dbo].[AutoresByEditorialView]
GO
/****** Object:  Table [dbo].[autores_has_libros]    Script Date: 2020-12-21 05:30:09 ******/
DROP TABLE [dbo].[autores_has_libros]
GO
/****** Object:  Table [dbo].[libros]    Script Date: 2020-12-21 05:30:09 ******/
DROP TABLE [dbo].[libros]
GO
/****** Object:  Table [dbo].[editoriales]    Script Date: 2020-12-21 05:30:09 ******/
DROP TABLE [dbo].[editoriales]
GO
/****** Object:  View [dbo].[AutoresView]    Script Date: 2020-12-21 05:30:09 ******/
DROP VIEW [dbo].[AutoresView]
GO
/****** Object:  Table [dbo].[autores]    Script Date: 2020-12-21 05:30:09 ******/
DROP TABLE [dbo].[autores]
GO
USE [master]
GO
/****** Object:  Database [libreria]    Script Date: 2020-12-21 05:30:09 ******/
DROP DATABASE [libreria]
GO
/****** Object:  Database [libreria]    Script Date: 2020-12-21 05:30:09 ******/
CREATE DATABASE [libreria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'libreria', FILENAME = N'/var/opt/mssql/data/libreria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'libreria_log', FILENAME = N'/var/opt/mssql/data/libreria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [libreria] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [libreria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [libreria] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [libreria] SET ANSI_NULLS ON 
GO
ALTER DATABASE [libreria] SET ANSI_PADDING ON 
GO
ALTER DATABASE [libreria] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [libreria] SET ARITHABORT ON 
GO
ALTER DATABASE [libreria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [libreria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [libreria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [libreria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [libreria] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [libreria] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [libreria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [libreria] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [libreria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [libreria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [libreria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [libreria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [libreria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [libreria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [libreria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [libreria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [libreria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [libreria] SET RECOVERY FULL 
GO
ALTER DATABASE [libreria] SET  MULTI_USER 
GO
ALTER DATABASE [libreria] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [libreria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [libreria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [libreria] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [libreria] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'libreria', N'ON'
GO
ALTER DATABASE [libreria] SET QUERY_STORE = OFF
GO
USE [libreria]
GO
/****** Object:  Table [dbo].[autores]    Script Date: 2020-12-21 05:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[autores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](45) NOT NULL,
	[apellidos] [varchar](45) NOT NULL,
 CONSTRAINT [PK_autores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AutoresView]    Script Date: 2020-12-21 05:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AutoresView] AS
SELECT
	[id],
	[nombre],
	[apellidos]
FROM 
	[dbo].[autores]
GO
/****** Object:  Table [dbo].[editoriales]    Script Date: 2020-12-21 05:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[editoriales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](45) NOT NULL,
	[sede] [varchar](45) NOT NULL,
 CONSTRAINT [PK_editoriales] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[libros]    Script Date: 2020-12-21 05:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[libros](
	[ISBN] [int] NOT NULL,
	[editoriales_id] [int] NULL,
	[titulo] [varchar](45) NULL,
	[sinopsis] [text] NULL,
	[n_paginas] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[autores_has_libros]    Script Date: 2020-12-21 05:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[autores_has_libros](
	[autores_id] [int] NOT NULL,
	[libros_ISBN] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AutoresByEditorialView]    Script Date: 2020-12-21 05:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET IDENTITY_INSERT [dbo].[autores] ON 

INSERT [dbo].[autores] ([id], [nombre], [apellidos]) VALUES (1, N'Gabriel', N'Garcia Marquez')
INSERT [dbo].[autores] ([id], [nombre], [apellidos]) VALUES (2, N'Jorgue Luis', N'Borges')
INSERT [dbo].[autores] ([id], [nombre], [apellidos]) VALUES (3, N'Franz', N'Kafka')
INSERT [dbo].[autores] ([id], [nombre], [apellidos]) VALUES (4, N'Miguel', N'de Cervantes')
SET IDENTITY_INSERT [dbo].[autores] OFF
INSERT [dbo].[autores_has_libros] ([autores_id], [libros_ISBN]) VALUES (1, 978148151)
INSERT [dbo].[autores_has_libros] ([autores_id], [libros_ISBN]) VALUES (1, 978148293)
INSERT [dbo].[autores_has_libros] ([autores_id], [libros_ISBN]) VALUES (2, 978024552)
INSERT [dbo].[autores_has_libros] ([autores_id], [libros_ISBN]) VALUES (3, 978109401)
SET IDENTITY_INSERT [dbo].[editoriales] ON 

INSERT [dbo].[editoriales] ([id], [nombre], [sede]) VALUES (1, N'Sudamericana', N'Argentina')
INSERT [dbo].[editoriales] ([id], [nombre], [sede]) VALUES (2, N'Penguin Random House', N'Alemania')
INSERT [dbo].[editoriales] ([id], [nombre], [sede]) VALUES (3, N'Emecé Editores', N'España')
INSERT [dbo].[editoriales] ([id], [nombre], [sede]) VALUES (4, N'Alianza Editorial', N'España')
INSERT [dbo].[editoriales] ([id], [nombre], [sede]) VALUES (5, N'Nueva Editorial', N'Colombia')
INSERT [dbo].[editoriales] ([id], [nombre], [sede]) VALUES (6, N'Editorial La Gran Colombia', N'Colombia')
SET IDENTITY_INSERT [dbo].[editoriales] OFF
INSERT [dbo].[libros] ([ISBN], [editoriales_id], [titulo], [sinopsis], [n_paginas]) VALUES (978024552, 2, N'Ficciones', N'Diecisiete relatos breves que abren un mundo de reflexiones sobre las convenciones de lectura y el modo de entender la realidad.', N'221')
INSERT [dbo].[libros] ([ISBN], [editoriales_id], [titulo], [sinopsis], [n_paginas]) VALUES (978109401, 4, N'La metamorfosis', N'La historia trata sobre Gregorio Samsa, cuya repentina transformación en un enorme insecto dificulta cada vez más la comunicación de su entorno social con él, hasta que es considerado intolerable por su familia y finalmente perece.', N'152')
INSERT [dbo].[libros] ([ISBN], [editoriales_id], [titulo], [sinopsis], [n_paginas]) VALUES (978148151, 1, N'Cien años de Soledad', N'Cien años de soledad es una novela del escritor colombiano Gabriel García Márquez, ganador del Premio Nobel de Literatura en 1982.', N'471')
INSERT [dbo].[libros] ([ISBN], [editoriales_id], [titulo], [sinopsis], [n_paginas]) VALUES (978148293, 2, N'El amor en los tiempos del cólera
', N' Es una novela dedicada al verdadero amor que perdura y supera las adversidades toda una vida, es un homenaje al amor, las aventuras, el tiempo, la vejez y la muerte.', N'416')
ALTER TABLE [dbo].[autores_has_libros]  WITH CHECK ADD FOREIGN KEY([autores_id])
REFERENCES [dbo].[autores] ([id])
GO
ALTER TABLE [dbo].[autores_has_libros]  WITH CHECK ADD FOREIGN KEY([libros_ISBN])
REFERENCES [dbo].[libros] ([ISBN])
GO
ALTER TABLE [dbo].[libros]  WITH CHECK ADD  CONSTRAINT [FK_libros_ToEditoriales] FOREIGN KEY([editoriales_id])
REFERENCES [dbo].[editoriales] ([id])
GO
ALTER TABLE [dbo].[libros] CHECK CONSTRAINT [FK_libros_ToEditoriales]
GO
USE [master]
GO
ALTER DATABASE [libreria] SET  READ_WRITE 
GO
