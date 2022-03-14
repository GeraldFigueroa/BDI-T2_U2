CREATE DATABASE Paqueteria_db;

USE Paqueteria_db;

CREATE TABLE Camion (
    matricula VARCHAR(7) PRIMARY KEY,
    modelo VARCHAR(25) NOT NULL,
    tipo VARCHAR(25) NOT NULL,
    potencia VARCHAR(25) NOT NULL
);

CREATE TABLE Camionero (
    dni_camionero VARCHAR(13) PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    direccion TEXT,
    salario MONEY NOT NULL,
);

CREATE TABLE Camion_Camionero(
    id INT PRIMARY KEY IDENTITY(1,1),
    matricula VARCHAR(7) FOREIGN KEY REFERENCES Camion(matricula),
    dni_camionero VARCHAR(13) FOREIGN KEY REFERENCES Camionero(dni_camionero)
    fecha DATE NOT NULL
);

CREATE TABLE Departamento (
    cod_departamento SMALLINT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Paquete (
    cod_paquete INT PRIMARY KEY IDENTITY (1,1),
    descripcion TEXT,
    destinatario TEXT NOT NULL,
    dni_camionero VARCHAR(13) FOREIGN KEY REFERENCES Camionero(dni_camionero),
    cod_departamento SMALLINT FOREIGN KEY REFERENCES Departamento(cod_departamento)
);