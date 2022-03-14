CREATE DATABASE Ventas_db;

USE Ventas_db;

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    direccion TEXT,
    fecha_nacimiento DATE NOT NULL
);

CREATE TABLE Proveedor (
    rtn_proveedor VARCHAR(14) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion TEXT,
);

CREATE TABLE Producto (
    cod_producto INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    precio SMALLMONEY NOT NULL,
    rtn_proveedor VARCHAR(14) FOREIGN KEY REFERENCES Proveedor(rtn_proveedor)
);

CREATE TABLE Compra (
    id INT PRIMARY KEY IDENTITY(1,1),
    id_cliente INT FOREIGN KEY REFERENCES Cliente(id_cliente),
    cod_producto INT FOREIGN KEY REFERENCES Producto(cod_producto)
);
