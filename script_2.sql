CREATE DATABASE Ciudadanos_db;

USE Ciudadanos_db;

CREATE TABLE Departamento (
    cod_departamento SMALLINT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Municipio (
    cod_municipio INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cod_departamento SMALLINT FOREIGN KEY REFERENCES Departamento(cod_departamento)
);

CREATE TABLE Localidad (
    cod_localidad INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    cod_municipio INT FOREIGN KEY REFERENCES Municipio(cod_municipio)
);

CREATE TABLE Ciudadano (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(25) NOT NULL,
    salario SMALLMONEY NOT NULL
    cod_localidad INT FOREIGN KEY REFERENCES Localidad(cod_localidad)
);