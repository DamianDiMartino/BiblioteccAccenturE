﻿CREATE DATABASE BiblioteccAccenturE;
GO

USE BiblioteccAccenture;
GO

CREATE TABLE Genero
(
Id_Genero INT PRIMARY KEY IDENTITY (1,1),	
NombreGenero varchar(30),
CONSTRAINT UQ_NOMBRE_GENERO UNIQUE(NombreGenero)
);
GO

CREATE TABLE Editorial
(	
Id_Editorial INT PRIMARY KEY IDENTITY (1,1),	
NombreEditorial varchar(30),
CONSTRAINT UQ_NOMBRE_EDITORIAL UNIQUE(NombreEditorial)
);
GO

CREATE TABLE Libro
(	
Id_Libro INT PRIMARY KEY IDENTITY (1,1),		
Titulo varchar(50) NOT NULL,
ISBN varchar(15) UNIQUE,
Id_Genero INT NOT NULL,	
Id_Editorial INT NOT NULL,	
CONSTRAINT FK_LIBRO_GENERO FOREIGN KEY (Id_Genero) REFERENCES Genero(Id_Genero) ON DELETE CASCADE,	
CONSTRAINT FK_LIBRO_EDITORIAL FOREIGN KEY (Id_Editorial) REFERENCES Editorial(Id_Editorial)	ON DELETE CASCADE,
CONSTRAINT UQ_ISBN_LIBRO UNIQUE(ISBN,Titulo)
);
GO

CREATE TABLE Autor
(	
Id_Autor INT PRIMARY KEY IDENTITY (1,1),	
NombreYApellido varchar(60),		
CONSTRAINT UQ_AUTOR_NOMBRE_APELLIDO UNIQUE (NombreYApellido)
);
GO

CREATE TABLE EscritoPor
( 
Id_Libro INT not null, 
Id_Autor INT not null, 
CONSTRAINT FK_LIBRO FOREIGN KEY (Id_Libro) REFERENCES Libro(Id_Libro),
CONSTRAINT FK_AUTOR FOREIGN KEY (Id_Autor) REFERENCES Autor(Id_Autor),
CONSTRAINT PK_ESCRITO_POR PRIMARY KEY(Id_Autor, Id_Libro)
);