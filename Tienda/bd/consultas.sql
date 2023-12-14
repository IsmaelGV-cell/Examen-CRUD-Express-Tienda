DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;
CREATE TABLE fabricante (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);
CREATE TABLE producto (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DOUBLE NOT NULL,
id_fabricante INT UNSIGNED NOT NULL,
FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);
INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);


-- Nombre de todos los productos:
SELECT nombre 
FROM producto;

-- Nombres y precios de todos los productos:
SELECT nombre, precio 
FROM producto;

-- Todas las columnas de la tabla producto:
SHOW COLUMNS FROM producto;

-- Nombre de productos, precio en euros y precio en dólares:
SELECT nombre, precio, precio * 0.85 AS euros, precio AS dolares 
FROM producto;

-- Nombre de productos, precio en euros y precio en dólares con alias:
SELECT nombre AS "nombre de producto", precio AS euros, precio * 0.85 AS dolares 
FROM producto;

-- Nombres y precios en mayúsculas:
SELECT UPPER(nombre) AS nombre, precio 
FROM producto;

-- Nombres y precios en minúsculas:
SELECT LOWER(nombre) AS nombre, precio 
FROM producto;

-- Nombres de fabricantes y dos primeros caracteres en mayúsculas:
SELECT nombre AS "Nombre de Fabricante", UPPER(SUBSTRING(nombre, 1, 2)) AS "2 Primeros Caracteres" 
FROM fabricante;

-- Nombres y precios redondeados:
SELECT nombre, ROUND(precio) AS precio 
FROM producto;

-- Nombres y precios truncados:
SELECT nombre, TRUNCATE(precio, 0) AS precio 
FROM producto;

-- Identificadores de fabricantes con productos:
SELECT DISTINCT id_fabricante 
FROM producto;

-- Identificadores de fabricantes sin duplicados:
SELECT DISTINCT id_fabricante 
FROM producto;

-- Nombres de fabricantes en orden ascendente:
SELECT nombre 
FROM fabricante 
ORDER BY nombre ASC;

-- Nombres de fabricantes en orden descendente:
SELECT nombre 
FROM fabricante 
ORDER BY nombre DESC;

Productos ordenados por nombre ascendente y precio descendente:
SELECT nombre, precio 
FROM producto 
ORDER BY nombre ASC, precio DESC;
- Selecciona los nombres y precios de la tabla producto, ordenándolos por nombre ascendente y precio descendente.

5 primeras filas de la tabla fabricante:
SELECT * 
FROM fabricante 
LIMIT 5;
- Selecciona todas las columnas de las primeras 5 filas de la tabla fabricante.

2 filas a partir de la cuarta fila de la tabla fabricante:
SELECT * 
FROM fabricante 
LIMIT 2 OFFSET 3;
- Selecciona todas las columnas de 2 filas a partir de la cuarta fila de la tabla fabricante.

Nombre y precio del producto más barato:
SELECT nombre, precio 
FROM producto 
ORDER BY precio 
LIMIT 1;
- Selecciona el nombre y precio del producto con el precio más bajo.

Nombre y precio del producto más caro:
SELECT nombre, precio 
FROM producto 
ORDER BY precio DESC 
LIMIT 1;
- Selecciona el nombre y precio del producto con el precio más alto.

Nombres de productos del fabricante con id 2:
SELECT nombre 
FROM producto 
WHERE id_fabricante = 2;
- Selecciona los nombres de los productos de la tabla producto donde el id_fabricante es igual a 2.

Nombres de productos con precio menor o igual a 120€:
SELECT nombre 
FROM producto 
WHERE precio <= 120;
- Selecciona los nombres de los productos de la tabla producto donde el precio es menor o igual a 120€.

Nombres de productos con precio mayor o igual a 400€:
SELECT nombre 
FROM producto 
WHERE precio >= 400;
- Selecciona los nombres de los productos de la tabla producto donde el precio es mayor o igual a 400€.

Nombres de productos sin precio mayor o igual a 400€:
SELECT nombre 
FROM producto 
WHERE NOT precio >= 400;
- Selecciona los nombres de los productos de la tabla producto donde el precio no es mayor o igual a 400€.

Productos con precio entre 80€ y 300€ (sin BETWEEN):
SELECT nombre 
FROM producto 
WHERE precio >= 80 AND precio <= 300;
- Selecciona los nombres de los productos de la tabla producto donde el precio está entre 80€ y 300€.

Productos con precio entre 60€ y 200€ (con BETWEEN):
SELECT nombre 
FROM producto 
WHERE precio BETWEEN 60 AND 200;
- Selecciona los nombres de los productos de la tabla producto donde el precio está entre 60€ y 200€.

Productos con precio >200€ y id_fabricante = 6:
SELECT nombre 
FROM producto 
WHERE precio > 200 AND id_fabricante = 6;
- Selecciona los nombres de los productos de la tabla producto donde el precio es mayor a 200€ y el id_fabricante es igual a 6.

Productos con id_fabricante 1, 3 o 5 (sin IN):
SELECT nombre 
FROM producto 
WHERE id_fabricante = 1 OR id_fabricante = 3 OR id_fabricante = 5;
- Selecciona los nombres de los productos de la tabla producto donde el id_fabricante es igual a 1, 3 o 5.

Productos con id_fabricante 1, 3 o 5 (con IN):
SELECT nombre 
FROM producto 
WHERE id_fabricante IN (1, 3, 5);
- Selecciona los nombres de los productos de la tabla producto donde el id_fabricante es igual a 1, 3 o 5.

Nombre y precio en céntimos (multiplicar por 100):
SELECT nombre, precio * 100 AS centimos 
FROM producto;
- Selecciona los nombres y precios de la tabla producto, multiplicando el precio por 100 y renombrando la columna como "centimos".

Nombres de fabricantes que empiezan con la letra S:
SELECT nombre 
FROM fabricante 
WHERE nombre LIKE 'S%';
- Selecciona los nombres de los fabricantes de la tabla fabricante donde el nombre empieza con la letra "S".

Nombres de fabricantes que terminan con la vocal e:
SELECT nombre 
FROM fabricante 
WHERE nombre LIKE '%e';
- Selecciona los nombres de los fabricantes de la tabla fabricante donde el nombre termina con la vocal "e".

Nombres de fabricantes que contienen el carácter w:
SELECT nombre 
FROM fabricante 
WHERE nombre LIKE '%w%';
- Selecciona los nombres de los fabricantes de la tabla fabricante donde el nombre contiene el carácter "w".

Nombres de fabricantes con nombre de 4 caracteres:
SELECT nombre 
FROM fabricante 
WHERE LENGTH(nombre) = 4;
- Selecciona los nombres de los fabricantes de la tabla fabricante donde el nombre tiene 4 caracteres.

Productos que contienen la cadena "Portátil" en el nombre:
SELECT nombre 
FROM producto 
WHERE nombre LIKE '%Portátil%';
- Selecciona los nombres de los productos de la tabla producto donde el nombre contiene la cadena "Portátil".

Productos que contienen "Monitor" y tienen precio < 215€:
SELECT nombre 
FROM producto 
WHERE nombre LIKE '%Monitor%' AND precio < 215;
- Selecciona los nombres de los productos de la tabla producto donde el nombre contiene la cadena "Monitor" y el precio es menor a 215€.

Productos con precio >= 180€, ordenados por precio (desc) y nombre (asc):
SELECT nombre, precio 
FROM producto 
WHERE precio >= 180 
ORDER BY precio DESC, nombre ASC;
- Selecciona los nombres y precios de los productos de la tabla producto donde el precio es mayor o igual a 180€, ordenándolos por precio descendente y nombre ascendente.


--Multitablas

-- Obtener el nombre del producto, precio y nombre del fabricante de todos los productos
SELECT p.nombre AS 'Nombre del producto', p.precio AS 'Precio', f.nombre AS 'Nombre del fabricante'
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id;

-- Obtener el nombre del producto, precio y nombre del fabricante, ordenado por nombre del fabricante
SELECT p.nombre AS 'Nombre del producto', p.precio AS 'Precio', f.nombre AS 'Nombre del fabricante'
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
ORDER BY f.nombre;

-- Obtener el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante
SELECT p.id AS 'Identificador del producto', p.nombre AS 'Nombre del producto', p.id_fabricante AS 'Identificador del fabricante', f.nombre AS 'Nombre del fabricante'
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id;

-- Obtener el nombre del producto, precio y nombre del fabricante del producto más barato
SELECT p.nombre AS 'Nombre del producto', p.precio AS 'Precio', f.nombre AS 'Nombre del fabricante'
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
ORDER BY p.precio ASC
LIMIT 1;

-- Obtener el nombre del producto, precio y nombre del fabricante del producto más caro
SELECT p.nombre AS 'Nombre del producto', p.precio AS 'Precio', f.nombre AS 'Nombre del fabricante'
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
ORDER BY p.precio DESC
LIMIT 1;

-- Obtener la lista de todos los productos del fabricante Lenovo
SELECT p.nombre AS 'Nombre del producto', p.precio AS 'Precio', f.nombre AS 'Nombre del fabricante'
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
WHERE f.nombre = 'Lenovo';

-- Obtener la lista de todos los productos del fabricante Crucial con precio mayor a 200€
SELECT p.nombre AS 'Nombre del producto', p.precio AS 'Precio', f.nombre AS 'Nombre del fabricante'
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
WHERE f.nombre = 'Crucial' AND p.precio > 200;

-- Obtener el listado de productos de Asus, Hewlett-Packard y Seagate (sin IN)
SELECT p.nombre AS 'Nombre del producto', p.precio AS 'Precio', f.nombre AS 'Nombre del fabricante'
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

-- Obtener el listado de productos de Asus, Hewlett-Packard y Seagate (con IN)
SELECT p.nombre AS 'Nombre del producto', p.precio AS 'Precio', f.nombre AS 'Nombre del fabricante'
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- Obtener el listado de nombre y precio de productos de fabricantes cuyo nombre termina en "e"
SELECT p.nombre AS 'Nombre del producto', p.precio AS 'Precio'
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
WHERE f.nombre LIKE '%e';

-- Obtener el listado de nombre y precio de productos cuyo nombre de fabricante contiene "w"
SELECT p.nombre AS 'Nombre del producto', p.precio AS 'Precio', f.nombre AS 'Nombre del fabricante'
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
WHERE f.nombre LIKE '%w%';

-- Obtener el listado de nombre, precio y nombre de fabricante de productos que tienen un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT p.nombre AS 'Nombre del producto', p.precio AS 'Precio', f.nombre AS 'Nombre del fabricante'
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
WHERE p.precio >= 180
ORDER BY p.precio DESC, p.nombre ASC;

-- Obtener el listado de identificador y nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos
SELECT DISTINCT f.id AS 'Identificador', f.nombre AS 'Nombre del fabricante'
FROM fabricante f
JOIN producto p ON f.id = p.id_fabricante;


SELECT AVG(precio) AS precio_medio
FROM producto;
Esta consulta calculará el precio medio de todos los productos de la tabla "producto" y lo mostrará en la columna "precio_medio".


SELECT p.id_fabricante, MAX(p.precio) AS precio_maximo, MIN(p.precio) AS precio_minimo, AVG(p.precio) AS precio_medio, COUNT(*) AS total_productos
FROM producto p
JOIN (
    SELECT id_fabricante, AVG(precio) AS precio_medio
    FROM producto
    GROUP BY id_fabricante
    HAVING precio_medio > 200
) subquery ON p.id_fabricante = subquery.id_fabricante
GROUP BY p.id_fabricante;

Esta consulta obtiene el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes cuyo precio medio es superior a 200€. Agrupa los resultados por el identificador del fabricante. 