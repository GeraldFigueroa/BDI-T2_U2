CREATE DATABASE Farmacia_db;

USE Farmacia_db;

CREATE TABLE Ciudad (
    cod_postal CHAR(5) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Farmacia (
    id_farmacia SMALLINT PRIMARY KEY IDENTITY(1,1),
    direccion TEXT NOT NULL,
    guardia TEXT,
    cod_postal CHAR(5) FOREIGN KEY REFERENCES Ciudad(cod_postal)
);

CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    fecha_ingreso DATE NOT NULL,
    enfermedades TEXT,
    id_farmacia SMALLINT FOREIGN KEY REFERENCES Farmacia(id_farmacia)
);

CREATE TABLE Laboratorio (
    id_laboratorio SMALLINT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    direccion TEXT NOT NULL,
    dueño VARCHAR(100) NOT NULL
);

CREATE TABLE PresentacionMedicamento (
    cod_presetacion SMALLINT PRIMARY KEY IDENTITY(1,1),
    tipo VARCHAR(50) NOT NULL,
    cantidad VARCHAR(50) NOT NULL
);

CREATE TABLE Medicamento (
    cod_medicamento INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    precio MONEY NOT NULL,
    cod_presentacion SMALLINT FOREIGN KEY REFERENCES PresentacionMedicamento(cod_presentacion),
    id_laborario SMALLINT FOREIGN KEY REFERENCES Laboratorio(id_laborario)
);

CREATE TABLE Componente (
    cod_componente INT PRIMARY KEY IDENTITY(1,1),
    nombre_cientifico VARCHAR(100) NOT NULL,
    nombre_comercial VARCHAR(100) NOT NULL
);

CREATE TABLE Componente_Medicamento (
    id INT PRIMARY KEY IDENTITY(1,1),
    cod_medicamento INT FOREIGN KEY REFERENCES Medicamento(cod_medicamento),
    cod_componente INT FOREIGN KEY REFERENCES Componente(cod_componente)
);

CREATE TABLE Accion_Terapeutica (
    nombre VARCHAR(100) PRIMARY KEY,
    tiempo_efecto TIME NOT NULL,
    cod_medicamento INT FOREIGN KEY REFERENCES Medicamento(cod_medicamento),
);

CREATE TABLE Inventario_Medicamentos (
    id INT PRIMARY KEY IDENTITY(1,1),
    id_farmacia SMALLINT FOREIGN KEY REFERENCES Farmacia(id_farmacia)
    cod_medicamento INT FOREIGN KEY REFERENCES Medicamento(cod_medicamento),
);