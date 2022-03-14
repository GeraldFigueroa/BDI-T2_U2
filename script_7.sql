CREATE DATABASE Libreria_db;

USE Libreria_db;

CREATE TABLE Autor (
    cod_autor INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Editorial (
    cod_editorial SMALLINT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL
):

CREATE TABLE Libro (
    cod_libro INT PRIMARY KEY IDENTITY(1,1),
    titulo VARCHAR(150) NOT NULL,
    no_paginas SMALLINT NOT NULL,
    isbn CHAR(13) NOT NULL,
    cod_editorial SMALLINT FOREIGN KEY REFERENCES Editorial(cod_editorial), 
);

CREATE TABLE Autor_Libro(
    cod_autor INT NOT NULL,
    cod_libro INT NOT NULL,
    PRIMARY KEY (cod_autor cod_libro)
);

CREATE TABLE Ejemplar (
    cod_ejemplar INT PRIMARY KEY IDENTITY(1,1),
    localizacion VARCHAR(100) NOT NULL,
    cod_libro INT FOREIGN KEY REFERENCES Libro(cod_libro)
);

CREATE TABLE Usuario (
    cod_usuario INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    direccion TEXT,
    telefono VARCHAR(13) NOT NULL
);

CREATE TABLE Ejemplar_Usuario (
    id INT PRIMARY KEY IDENTITY(1,1),
    fecha_ingreso DATE NOT NULL,
    fecha_entrega DATE NOT NULL,
    cod_ejemplar INT FOREIGN KEY REFERENCES Ejemplar(cod_ejemplar),
    cod_usuario INT FOREIGN KEY REFERENCES Usuario(cod_usuario)
);