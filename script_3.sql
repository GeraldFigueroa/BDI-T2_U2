CREATE DATABASE Eventos_db;

USE Eventos_db;

CREATE TABLE Disfraz (
    cod_disfraz SMALLINT PRIMARY KEY IDENTITY(1,1),
    personaje VARCHAR(100) NOT NULL,
    precio SMALLMONEY NOT NULL
);

CREATE TABLE Animador (
    cod_animador SMALLINT PRIMARY KEY IDENTITY(1,1),
    dni INT NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    cod_disfraz SMALLINT FOREIGN KEY REFERENCES Disfraz(cod_disfraz)
);

CREATE TABLE Presentador (
    cod_presentador SMALLINT PRIMARY KEY IDENTITY(1,1),
    dni INT NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    anio_comienzo DATE NOT NULL
);

CREATE TABLE EVENTO (
    cod_evento INT PRIMARY KEY IDENTITY(1,1),
    precio SMALLMONEY NOT NULL,
    horario TIME(3) NOT NULL,
    descripcion TEXT,
    cod_presentador SMALLINT FOREIGN KEY REFERENCES Presentador(cod_presentador)
);

CREATE TABLE Evento_Animador (
    id INT PRIMARY KEY IDENTITY(1,1),
    cod_evento INT FOREIGN KEY REFERENCES Evento(cod_evento),
    cod_animador SMALLINT FOREIGN KEY REFERENCES Animador(cod_animador)
);

CREATE TABLE Cliente (
    num_cliente INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    domicilio VARCHAR(255) NOT NULL,
    telefono VARCHAR(25) NOT NULL
);

CREATE TABLE Cliente_Evento (
    id INT PRIMARY KEY IDENTITY(1,1),
    num_cliente INT FOREIGN KEY REFERENCES Cliente(num_cliente),
    cod_evento INT FOREIGN KEY REFERENCES Evento(cod_evento),
    lugar VARCHAR(150) NOT NULL,
    costo_total SMALLMONEY
);