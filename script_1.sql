CREATE DATABASE Clases_db;

USE Clases_db;

CREATE TABLE Alumno (
    num_cuenta INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR (25) NOT NULL,
    fecha_nacimiento DATE NOT NULL
);

CREATE TABLE Docente (
    id_docente SMALLINT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    telefono VARHCAR(25) NOT NULL
);

CREATE TABLE Asignatura (
    cod_asignatura SMALLINT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    uv TINYINT NOT NULL,
    id_docente SMALLINT NOT NULL FOREIGN KEY REFERENCES Docente(id_docente)
);

CREATE TABLE Alumno_Asignatura (
    id INT PRIMARY KEY IDENTITY(1,1),
    num_cuenta INT NOT NULL FOREIGN KEY REFERENCES Alumno(num_cuenta),
    cod_asignatura SMALLINT NOT NULL FOREIGN KEY REFERENCES Asignatura(cod_asignatura) 
);
