DROP DATABASE IF EXISTS miscompras;
CREATE DATABASE miscompras;
USE miscompras;

CREATE TABLE categorias(
    id_categoria INT PRIMARY KEY,
    descripcion VARCHAR(45),
    estado TINYINT
);

CREATE TABLE clientes(
    id_clientes VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(40),
    apellidos VARCHAR(100),
    celular DECIMAL(10,0),
    direccion VARCHAR(80),
    correo_electronico VARCHAR(70) 
);

CREATE TABLE compras (
    id_compra INT PRIMARY KEY,
    id_cliente VARCHAR(20),
    fecha DATETIME,
    medio_pago CHAR(1),
    comentario VARCHAR(300),
    estado CHAR (1),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_clientes)
);

CREATE TABLE productos(
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(45),
    id_categoria INT,
    codigo_barras VARCHAR(150),
    precio_venta DECIMAL(16,2),
    cantidad_stock INT,
    estado TINYINT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE compras_productos(
    id_compra INT,
    id_producto INT,
    cantidad INT,
    total DECIMAL(16,2),
    estado TINYINT,
    FOREIGN KEY (id_compra) REFERENCES compras(id_compra),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);


