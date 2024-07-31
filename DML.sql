INSERT INTO categorias (id_categoria, descripcion, estado) VALUES
(1, 'Electrónica', 1),
(2, 'Ropa', 1),
(3, 'Alimentos', 1),
(4, 'Hogar', 1);

INSERT INTO productos (id_producto, nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado) VALUES
(1, 'Smartphone', 1, '1234567890123', 299.99, 50, 1),
(2, 'Televisor 4K', 1, '1234567890124', 799.99, 30, 1),
(3, 'Chaqueta de Invierno', 2, '1234567890125', 129.99, 20, 1),
(4, 'Cereal', 3, '1234567890126', 3.99, 100, 1),
(5, 'Sofá', 4, '1234567890127', 499.99, 10, 1);

INSERT INTO clientes (id_clientes, nombre, apellidos, celular, direccion, correo_electronico) VALUES
('C001', 'Juan', 'Pérez Gómez', 1234567890, 'Calle Falsa 123', 'juan.perez@example.com'),
('C002', 'Ana', 'Martínez López', 2345678901, 'Avenida Siempre Viva 456', 'ana.martinez@example.com'),
('C003', 'Luis', 'García Fernández', 3456789012, 'Boulevard de los Sueños 789', 'luis.garcia@example.com');

INSERT INTO compras (id_compra, id_cliente, fecha, medio_pago, comentario, estado) VALUES
(1, 'C001', '2024-07-30 14:30:00', 'T', 'Compra de verano', 'P'),
(2, 'C002', '2024-07-30 15:00:00', 'C', 'Compra para hogar', 'P'),
(3, 'C003', '2024-07-30 16:00:00', 'T', 'Compra de alimentos', 'P');

INSERT INTO compras_productos (id_compra, id_producto, cantidad, total, estado) VALUES
(1, 1, 1, 299.99, 1),
(1, 3, 2, 259.98, 1),
(2, 5, 1, 499.99, 1),
(3, 4, 5, 19.95, 1);


