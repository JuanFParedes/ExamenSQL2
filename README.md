EXAMEN MYSQL2

----- CONSULTAS BASICAS -----
1 Consultar todos los productos y sus categorías
```
SELECT p.id_producto, p.nombre AS producto, c.descripcion AS categoria, p.precio_venta, p.cantidad_stock
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria;
```

2 Consultar todas las compras y los clientes que las realizaron
```
SELECT co.id_compra, co.fecha, co.medio_pago, co.comentario, co.estado, c.nombre, c.apellidos
FROM compras co
JOIN clientes c ON co.id_cliente = c.id_clientes;
```

3 Consultar los productos comprados en una compra específica
```
SELECT p.nombre AS producto, cp.cantidad, cp.total
FROM compras_productos cp
JOIN productos p ON cp.id_producto = p.id_producto
WHERE cp.id_compra = 1;  
```

4 Agregar un nuevo producto
```
INSERT INTO productos (id_producto, nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado)
VALUES (6, 'Nuevo Producto', 2, '1234567890128', 19.99, 100, 1); 
```

5 Actualizar el stock de un producto
```
UPDATE productos
SET cantidad_stock = 50  
WHERE id_producto = 1; 
```

6 Consultar todas las compras de un cliente específico
```
SELECT co.id_compra, co.fecha, co.medio_pago, co.comentario, co.estado
FROM compras co
WHERE co.id_cliente = 'C001';  
```

7 Consultar todos los clientes y sus correos electrónicos
```
SELECT id_clientes, nombre, apellidos, correo_electronico
FROM clientes;
```

8 Consultar la cantidad total de productos comprados en cada compra
```
SELECT cp.id_compra, SUM(cp.cantidad) AS total_productos
FROM compras_productos cp
GROUP BY cp.id_compra;
```

9 Consultar las compras realizadas en un rango de fechas
```
SELECT id_compra, id_cliente, fecha, medio_pago, comentario, estado
FROM compras
WHERE fecha BETWEEN '2024-01-01' AND '2024-12-31';  
```

----- CONSULTAS USANDO FUNCIONES AGREGADAS -----

1 Contar la cantidad de productos por categoría.
```
SELECT c.descripcion AS categoria, COUNT(p.id_producto) AS cantidad_productos
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria
GROUP BY c.descripcion;
```

2 Calcular el precio total de ventas por cada cliente.
```
SELECT c.id_clientes, c.nombre, c.apellidos, SUM(cp.total) AS total_ventas
FROM clientes c
JOIN compras co ON c.id_clientes = co.id_cliente
JOIN compras_productos cp ON co.id_compra = cp.id_compra
GROUP BY c.id_clientes, c.nombre, c.apellidos;
```

3 Calcular el precio promedio de los productos por categoría.



4 Encontrar la fecha de la primera y última compra registrada.
```
SELECT MIN(fecha) AS fecha_primera_compra, MAX(fecha) AS fecha_ultima_compra
FROM compras;
```

5 Calcular el total de ingresos por ventas.
```
SELECT SUM(cp.total) AS total_ingresos
FROM compras_productos cp;
```

6 Contar la cantidad de compras realizadas por cada medio de pago.
```
SELECT medio_pago, COUNT(id_compra) AS cantidad_compras
FROM compras
GROUP BY medio_pago;
```

7 Calcular el total de productos vendidos por cada producto.
```
SELECT p.nombre AS producto, SUM(cp.cantidad) AS total_vendido
FROM productos p
JOIN compras_productos cp ON p.id_producto = cp.id_producto
GROUP BY p.nombre;
```

8 Obtener el promedio de cantidad de productos comprados por compra.



9 Encontrar los productos con el stock más bajo.
```
SELECT nombre, cantidad_stock
FROM productos
ORDER BY cantidad_stock ASC
LIMIT 5;  
```

10 Calcular el total de productos comprados y el total gastado por cliente.



----- CONSULTAS USANDO JOIN -----

1 Consultar todos los productos con sus categorías
```
SELECT p.id_producto, p.nombre AS producto, c.descripcion AS categoria
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria;
```

2 Consultar todas las compras y los clientes que las realizaron
```
SELECT co.id_compra, co.fecha, co.medio_pago, co.comentario, co.estado, cl.nombre, cl.apellidos
FROM compras co
JOIN clientes cl ON co.id_cliente = cl.id_clientes;
```

3 Consultar los productos comprados en cada compra
```
SELECT co.id_compra, p.nombre AS producto, cp.cantidad, cp.total
FROM compras_productos cp
JOIN productos p ON cp.id_producto = p.id_producto
JOIN compras co ON cp.id_compra = co.id_compra;
```

4 Consultar las compras realizadas por un cliente específico
```
SELECT co.id_compra, co.fecha, co.medio_pago, co.comentario, co.estado
FROM compras co
WHERE co.id_cliente = 'C001';  
```

5 Consultar el total gastado por cada cliente
```
SELECT cl.id_clientes, cl.nombre, cl.apellidos, SUM(cp.total) AS total_gastado
FROM compras co
JOIN compras_productos cp ON co.id_compra = cp.id_compra
JOIN clientes cl ON co.id_cliente = cl.id_clientes
GROUP BY cl.id_clientes, cl.nombre, cl.apellidos;
```

6 Consultar el stock disponible de productos y su categoría
```
SELECT p.id_producto, p.nombre AS producto, p.cantidad_stock, c.descripcion AS categoria
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria;
```

7 Consultar los detalles de compras junto con la información del cliente y el producto



8 Consultar los productos que han sido comprados por más de una cantidad específica
```
SELECT p.id_producto, p.nombre, SUM(cp.cantidad) AS cantidad_total
FROM compras_productos cp
JOIN productos p ON cp.id_producto = p.id_producto
GROUP BY p.id_producto, p.nombre
HAVING SUM(cp.cantidad) > 1; 
```

9 Consultar la cantidad total de productos vendidos por categoría
```
SELECT c.descripcion AS categoria, SUM(cp.cantidad) AS cantidad_total_vendida
FROM compras_productos cp
JOIN productos p ON cp.id_producto = p.id_producto
JOIN categorias c ON p.id_categoria = c.id_categoria
GROUP BY c.descripcion;
```

10 Consultar los clientes que han realizado compras en un rango de fechas específico
```
SELECT DISTINCT cl.id_clientes, cl.nombre, cl.apellidos
FROM compras co
JOIN clientes cl ON co.id_cliente = cl.id_clientes
WHERE co.fecha BETWEEN '2024-07-01' AND '2024-07-31';  
```

11 Consultar el total gastado por cada cliente junto con la cantidad total de productos comprados
```
SELECT cl.id_clientes, cl.nombre, cl.apellidos, SUM(cp.total) AS total_gastado, SUM(cp.cantidad) AS cantidad_total
FROM compras co
JOIN compras_productos cp ON co.id_compra = cp.id_compra
JOIN clientes cl ON co.id_cliente = cl.id_clientes
GROUP BY cl.id_clientes, cl.nombre, cl.apellidos;
```

12 Consultar los productos que nunca han sido comprados
```
SELECT p.id_producto, p.nombre
FROM productos p
LEFT JOIN compras_productos cp ON p.id_producto = cp.id_producto
WHERE cp.id_producto IS NULL;
```

13 Consultar los clientes que han realizado más de una compra y el total gastado por ellos
```
SELECT cl.id_clientes, cl.nombre, cl.apellidos, COUNT(co.id_compra) AS numero_compras, SUM(cp.total) AS total_gastado
FROM compras co
JOIN compras_productos cp ON co.id_compra = cp.id_compra
JOIN clientes cl ON co.id_cliente = cl.id_clientes
GROUP BY cl.id_clientes, cl.nombre, cl.apellidos
HAVING COUNT(co.id_compra) > 1;
```

14 Consultar los productos más vendidos por categoría
```
SELECT c.descripcion AS categoria, p.nombre AS producto, SUM(cp.cantidad) AS cantidad_vendida
FROM compras_productos cp
JOIN productos p ON cp.id_producto = p.id_producto
JOIN categorias c ON p.id_categoria = c.id_categoria
GROUP BY c.descripcion, p.nombre
ORDER BY c.descripcion, cantidad_vendida DESC;
```
----- SUBCONSULTAS -----

1 Consultar los productos que tienen un precio de venta superior al precio promedio de todos los productos.
```
SELECT p.id_producto, p.nombre, p.precio_venta
FROM productos p
WHERE p.precio_venta > (
    SELECT AVG(precio_venta)
    FROM productos
);
```

2 Consultar los clientes que han gastado más del promedio general en sus compras.
```
WITH TotalGastadoPorCliente AS (
    SELECT cl.id_clientes, cl.nombre, cl.apellidos, SUM(cp.total) AS total_gastado
    FROM compras co
    JOIN compras_productos cp ON co.id_compra = cp.id_compra
    JOIN clientes cl ON co.id_cliente = cl.id_clientes
    GROUP BY cl.id_clientes, cl.nombre, cl.apellidos
),

PromedioGastoGeneral AS (
    SELECT AVG(total_gastado) AS promedio_general
    FROM TotalGastadoPorCliente
)

SELECT tgc.id_clientes, tgc.nombre, tgc.apellidos, tgc.total_gastado
FROM TotalGastadoPorCliente tgc, PromedioGastoGeneral pg
WHERE tgc.total_gastado > pg.promedio_general;
```

3 Consultar las categorías que tienen más de 5 productos.



4 Consultar los productos más vendidos (top 5) por categoría.
```
SELECT p.id_producto, p.nombre, p.id_categoria, SUM(cp.cantidad) AS cantidad_vendida
FROM productos p
JOIN compras_productos cp ON p.id_producto = cp.id_producto
GROUP BY p.id_producto, p.nombre, p.id_categoria
ORDER BY p.id_categoria, cantidad_vendida DESC
LIMIT 5;
```

5 Consultar los clientes que han realizado compras en los últimos 30 días.
```
SELECT DISTINCT cl.id_clientes, cl.nombre, cl.apellidos
FROM clientes cl
JOIN compras co ON cl.id_clientes = co.id_cliente
WHERE co.fecha >= CURDATE() - INTERVAL 30 DAY;
```

6 Consultar las compras y sus productos para un cliente específico, mostrando solo las compras más recientes.
```
WITH ComprasRecientes AS (
    SELECT co.id_compra, co.fecha
    FROM compras co
    WHERE co.id_cliente = 'C001'  
    ORDER BY co.fecha DESC
    LIMIT 5  
)

SELECT cr.id_compra, cp.id_producto, p.nombre AS producto, cp.cantidad, cp.total
FROM ComprasRecientes cr
JOIN compras_productos cp ON cr.id_compra = cp.id_compra
JOIN productos p ON cp.id_producto = p.id_producto;
```

7 Consultar las categorías que tienen productos con un stock por debajo del promedio general.
```
WITH PromedioStock AS (
    SELECT AVG(cantidad_stock) AS promedio_stock
    FROM productos
),

CategoriasPorDebajoDelPromedio AS (
    SELECT p.id_categoria
    FROM productos p
    JOIN PromedioStock ps ON p.cantidad_stock < ps.promedio_stock
    GROUP BY p.id_categoria
)

SELECT c.id_categoria, c.descripcion
FROM categorias c
JOIN CategoriasPorDebajoDelPromedio cd ON c.id_categoria = cd.id_categoria;
```

8 Consultar los productos que han sido comprados por todos los clientes.



9 Consultar las compras que tienen más productos que el promedio de productos por compra.
```
WITH PromedioProductosPorCompra AS (
    SELECT AVG(cantidad_productos) AS promedio
    FROM (
        SELECT id_compra, COUNT(id_producto) AS cantidad_productos
        FROM compras_productos
        GROUP BY id_compra
    ) AS subquery
)

SELECT co.id_compra, COUNT(cp.id_producto) AS cantidad_productos
FROM compras co
JOIN compras_productos cp ON co.id_compra = cp.id_compra
GROUP BY co.id_compra
HAVING cantidad_productos > (SELECT promedio FROM PromedioProductosPorCompra);
```

10 Consultar los productos que se han vendido menos de la cantidad promedio de productos vendidos.
```
WITH PromedioCantidadVendida AS (
    SELECT AVG(cantidad_vendida) AS promedio
    FROM (
        SELECT p.id_producto, SUM(cp.cantidad) AS cantidad_vendida
        FROM productos p
        JOIN compras_productos cp ON p.id_producto = cp.id_producto
        GROUP BY p.id_producto
    ) AS subquery
)

SELECT p.id_producto, p.nombre, COALESCE(SUM(cp.cantidad), 0) AS cantidad_vendida
FROM productos p
LEFT JOIN compras_productos cp ON p.id_producto = cp.id_producto
GROUP BY p.id_producto, p.nombre
HAVING cantidad_vendida < (SELECT promedio FROM PromedioCantidadVendida);
```