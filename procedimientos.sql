USE `consultas`;
DROP procedure IF EXISTS `InsertFabricante`;

DELIMITER $$
USE `consultas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertFabricante`(
IN NombreFab VARCHAR(100)
)
BEGIN
INSERT INTO Fabricante (Nombre)
	VALUES (NombreFab);

END$$

DELIMITER ;

USE `consultas`;
DROP procedure IF EXISTS `InsertProducto`;

USE `consultas`;
DROP procedure IF EXISTS `InsertProducto`;

DELIMITER $$
USE `consultas`$$
CREATE PROCEDURE `InsertProducto`(
	IN nombre VARCHAR (30),
	IN valor DOUBLE,
    IN fabricante INT
)
BEGIN
	INSERT INTO Producto (nombre,precio,codigo_fabricante)
    VALUES (nombre,valor,fabricante);
END$$

DELIMITER ;

-- 1
SELECT nombre FROM producto;

-- 2
SELECT nombre, precio
FROM producto;

-- 3
DESCRIBE producto;

-- 4 y 5
SELECT
nombre as producto, 
precio as precio_usd,
round(precio*0.93,2) as precio_eur
from producto;

-- 6
SELECT upper(Nombre) as Nombre_Mayusculas,precio
from producto;

-- 7
SELECT lower(Nombre) as Nombre_Minuscula, precio
from producto;

-- 8
SELECT 
nombre,
upper(LEFT(Nombre, 2)) as Iniciales_Mayuscula
from fabricante;

-- 9
SELECT Nombre, round(precio) as precio_redeondado
from producto;

-- 10

SELECT Nombre, truncate(precio,0) as precio_truncado
from producto;

-- 11
SELECT codigo_fabricante
from producto;

-- 12
SELECT distinct codigo_fabricante
FROM producto;

-- 13
SELECT distinct nombre
from fabricante 
ORDER BY nombre ASC;

-- 14
SELECT distinct nombre
from fabricante 
ORDER BY nombre DESC;

-- 15
SELECT distinct Nombre, precio 
from producto
ORDER BY Nombre ASC, precio DESC;

-- 16
SELECT * FROM fabricante
LIMIT 5;

SELECT * FROM fabricante 
LIMIT 3, 2;

SELECT nombre, precio 
FROM producto 
ORDER BY precio ASC
LIMIT 1;

-- 20
SELECT nombre 
FROM producto 
where NOT ROUND(precio * 0.93,2) >= 400;

-- 21
SELECT nombre 
FROM producto
WHERE precio <=120;  

-- 22
SELECT nombre 
FROM producto 
WHERE precio >= 400;

-- 23
SELECT nombre 
FROM producto 
WHERE precio<400;

-- 24
SELECT * FROM producto 
WHERE precio>=80 
AND precio<= 300; 

-- 25 
SELECT * 
FROM producto 
WHERE precio BETWEEN 60 AND 200;

-- 26
SELECT *
FROM producto 
WHERE precio > 200
AND codigo_fabricante = 6;

-- 27 

-- 28
SELECT * FROM producto
WHERE codigo_fabricante IN (1);

-- 29 
SELECT nombre, precio  * 100 AS centimos
FROM producto;

-- 30
SELECT nombre
FROM fabricante 
WHERE nombre LIKE 'S%';

-- 31 
SELECT nombre
FROM fabricante
WHERE nombre LIKE '%e';

-- 32
SELECT nombre
FROM fabricante 
WHERE nombre LIKE '%w%';

-- 33
SELECT nombre
FROM fabricante 
WHERE LENGTH(nombre) = 4;

-- 34
SELECT nombre FROM producto WHERE nombre LIKE '%Portátil%';

-- 35
SELECT nombre 
FROM producto 

WHERE nombre LIKE '%Monitor%'
AND precio < 215;

-- 36
SELECT nombre, precio 
FROM producto 
WHERE precio >= 100
ORDER BY precio DESC, nombre ASC;

-- 1 Consultas multitabla (Composición interna) 
-- 1
SELECT 
    p.nombre AS Producto,
    p.precio,
    m.nombre AS fabricante
FROM 
    Producto p
JOIN 
    fabricante m ON p.codigo_fabricante = m.codigo; 
    
-- 2
SELECT 
    p.nombre AS Producto,
    p.precio,
    m.nombre AS fabricante
FROM 
    Producto p
JOIN 
    fabricante m ON p.codigo_fabricante = m.codigo
    ORDER BY 
    m.nombre ASC;
    
    -- 3 
    
    SELECT 
    p.codigo AS id_producto,
    p.nombre AS nombre_producto,
    m.codigo AS id_fabricante,
    m.nombre AS nombre_fabricante
FROM 
    Producto p
JOIN 
    fabricante m ON p.codigo_fabricante = m.codigo;

-- 4 
SELECT 
    p.nombre AS Producto,
    p.precio,
    m.nombre AS fabricante
FROM 
    Producto p
JOIN 
    fabricante m ON p.codigo_fabricante = m.codigo
    ORDER BY 
    p.precio ASC
    LIMIT 1;
    -- 5
SELECT 
    p.nombre AS Producto,
    p.precio,
    m.nombre AS fabricante
FROM 
    Producto p
JOIN 
    fabricante m ON p.codigo_fabricante = m.codigo
    ORDER BY 
    p.precio DESC
    LIMIT 1;
-- 6
SELECT 
    p.nombre AS Producto,
    p.precio,
    m.nombre AS fabricante
FROM 
    Producto p
JOIN 
    fabricante m ON p.codigo_fabricante = m.codigo
WHERE 
m.nombre = 'Lenovo';

-- 7
SELECT 
    p.nombre AS Producto,
    p.precio,
    m.nombre AS fabricante
FROM 
    Producto p
JOIN 
    fabricante m ON p.codigo_fabricante = m.codigo
WHERE 
m.nombre = 'Crucial'
AND p.precio > 200;

-- 8
SELECT 
    p.nombre AS Producto,
    p.precio,
    m.nombre AS fabricante
FROM 
    Producto p
JOIN 
    fabricante m ON p.codigo_fabricante = m.codigo
WHERE 
m.nombre = 'Asus'
OR m.nombre = 'Hewlett-Packard'
OR m.nombre = 'Seagate';

-- 9 
SELECT 
    p.nombre AS Producto,
    p.precio,
    m.nombre AS fabricante
FROM 
    Producto p
JOIN 
    fabricante m ON p.codigo_fabricante = m.codigo
WHERE m.nombre IN ('Asus', 'Hewlett-PAckard','Seagate');
-- 10
SELECT 
    p.nombre AS Producto,
    p.precio,
    m.nombre AS fabricante
FROM 
    Producto p
JOIN 
    fabricante m ON p.codigo_fabricante = m.codigo
WHERE m.nombre LIKE '%e';
-- 11
SELECT 
    p.nombre AS Producto,
    p.precio,
    m.nombre AS fabricante
FROM 
    Producto p
JOIN 
    fabricante m ON p.codigo_fabricante = m.codigo
WHERE m.nombre LIKE '%w%';
-- 12
SELECT 
    p.nombre AS Producto,
    p.precio,
    m.nombre AS fabricante
FROM 
    Producto p
JOIN 
    fabricante m ON p.codigo_fabricante = m.codigo
WHERE p.precio >=180
ORDER BY p.precio DESC, p.precio ASC;
-- 13

SELECT codigo, nombre
FROM fabricante
WHERE codigo IN (SELECT DISTINCT codigo_fabricante FROM producto);

-- Consultas multitabla (Composición externa)  

-- 1 
SELECT 
    f.nombre AS nombre_fabricante,
    p.nombre AS Producto
FROM 
    fabricante f 
    left join producto p ON f.codigo = p.codigo_fabricante;
    -- 2 
    SELECT 
    f.nombre AS nombre_fabricante,
    p.nombre AS Producto
FROM 
    fabricante f 
    left join producto p ON f.codigo = p.codigo_fabricante
    WHERE p.codigo IS NULL;
    -- 3 Si podrian existir productod que no esten relacionados con un fabricante ya que es la clave foranea en la tabla producto, donde la columna codigo_fabricante en la tabla producto es la que establece la relacion con la columna codigo de la tabla fabricantes.
 
-- Consultas resumen 

-- 1
SELECT COUNT(*) AS total_productos
FROM producto;

-- 2 
SELECT COUNT(*) AS total_fabricantes
FROM fabricante;

-- 3
SELECT COUNT(DISTINCT codigo_fabricante) AS total_fabricantes_distintos
FROM producto;

-- 4
SELECT AVG(precio) AS precio_medio
FROM producto;

-- 5
SELECT MIN(precio) AS precio_mas_barato
FROM producto;

-- 6
SELECT MAX(precio) AS precio_mas_caro
FROM producto;

-- 7
SELECT nombre, precio
FROM producto
ORDER BY precio ASC
LIMIT 1;

-- 8
SELECT nombre, precio
FROM producto
ORDER BY precio DESC
LIMIT 1;

-- 9
SELECT SUM(precio) AS suma_precios
FROM producto;

-- 10
SELECT COUNT(p.codigo) AS numero_productos_asus
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- 11
SELECT AVG(p.precio) AS precio_medio_asus
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- 12
SELECT min(p.precio) AS precio_medio_asus
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- 13
SELECT max(p.precio) AS precio_medio_asus
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- 14
SELECT sum(p.precio) AS precio_medio_asus
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- 15
SELECT
    MAX(p.precio) AS precio_maximo_crucial,
    MIN(p.precio) AS precio_minimo_crucial,
    AVG(p.precio) AS precio_medio_crucial,
    COUNT(p.codigo) AS total_productos_crucial
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Crucial';

-- 16
SELECT
    f.nombre AS nombre_fabricante,
    COUNT(p.codigo) AS numero_productos
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
ORDER BY numero_productos DESC;
-- 17
SELECT
    f.nombre AS nombre_fabricante,
    MAX(p.precio) AS precio_maximo,
    MIN(p.precio) AS precio_minimo,
    AVG(p.precio) AS precio_medio
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre;



-- 18 
SELECT
codigo_fabricante,
MAX(precio) AS precio_maximo,
MIN(precio) AS precio_minimo,
AVG(precio) AS precio_medio,
COUNT(*) AS total_producto
FROM
    producto
GROUP BY
    codigo_fabricante
HAVING
    AVG(precio) > 200;
    
-- 19 CORREGIR
SELECT
    fabricante.nombre,
    MAX(producto.precio) AS precio_maximo,
    MIN(producto.precio) AS precio_minimo,
    AVG(producto.precio) AS precio_medio,
    COUNT(producto.id_producto) AS total_productos
FROM
fabricante
JOIN
producto ON fabricante.codigo_fabricante = producto.codigo_fabricante
GROUP BY
fabricante.codigo_fabricante, fabricante.nombre
HAVING
AVG(producto.precio) > 200;

-- 20 
SELECT COUNT(*)
FROM producto
WHERE precio >= 180;

-- 21 
SELECT fabricante.nombre, COUNT(producto.nombre) as 'N° Productos con precio mayor a 180'
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo AND producto.precio >= 180
GROUP BY fabricante.nombre;

-- 22 
SELECT 
codigo_fabricante,
AVG(precio) AS precio_medio
FROM
producto
GROUP BY
codigo_fabricante;

-- 23 corregir
SELECT
    fabricante.nombre
    FROM
    fabricante
    JOIN
    producto ON fabricante.codigo_fabricante = producto.id_fabricante
GROUP BY
    fabricante.nombre
ORDER BY
    fabricante.nombre;
    
-- 24
SELECT f.nombre
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING AVG(p.precio) >= 150;

-- 25
SELECT fabricante.nombre
FROM fabricante
JOIN producto ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.nombre
HAVING COUNT(producto.codigo) >= 2;

-- 26 CORREGIR
SELECT
    f.nombre_fabricante,
    (SELECT COUNT(*) FROM producto WHERE producto.id_fabricante = f.id_fabricante AND producto.precio >= 220) AS numero_producto
FROM
    fabricante f
WHERE
    (SELECT COUNT(*) FROM producto WHERE producto.id_fabricante = f.id_fabricante AND productos.precio >= 220) > 0;

-- Subconsultas (En la cláusula WHERE)
-- 1
SELECT *
FROM producto 
WHERE codigo_fabricante = (SELECT codigo_fabricante WHERE nombre = 'Lenovo');

-- 2 CORREGIR 
SELECT *
FROM producto
WHERE precio = (
SELECT (precio)
FROM producto
WHERE fabricante = 'Lenovo'
);

-- 3 CORREGIR 
SELECT
    producto.nombre_producto
FROM
    producto
INNER JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo_fabricante
WHERE
    producto.precio = (
        SELECT MAX(precio)
        FROM producto
        WHERE codigo_fabricante = (
            SELECT codigo_fabricante
            FROM fabricante
            WHERE nombre_fabricante = 'Lenovo'
        )
    )
    AND fabricante.nombre_fabricante = 'Lenovo';

-- 4 CORREGIR
SELECT
    p.nombre
FROM
    producto
JOIN
    fabricante f ON p.codigo_fabricante = f.codigo_fabricante
WHERE
    f.nombre_fabricante = 'Lenovo'
    AND p.precio = (
        SELECT MAX(precio)
        FROM producto
        WHERE codigo_fabricante = f.codigo_fabricante
);

-- 5 CORREGIR
SELECT *
FROM Producto
WHERE Precio >= (SELECT MAX(Precio) FROM Producto WHERE Fabricante = 'Lenovo');

-- 6 CORREGIR
SELECT nombre,precio
FROM producto
WHERE fabbricante = 'Asus'
AND precio > (SELECT AVG(precio) FROM producto);

-- Subconsultas con ALL y ANY
-- 7 CORREGIR
SELECT nombre, precio
FROM producto
WHERE fabricante = 'Asus'
AND precio > (SELECT AVG(precio) FROM producto); 

-- 8 CORREGIR
SELECT *
FROM producto
WHERE precio >= (SELECT precio FROM producto);

-- 9 CORREGIR
 
-- 10
SELECT nombre
FROM fabricante
WHERE nombre NOT IN (SELECT nombre FROM Producto);

-- Subconsultas con IN y NOT IN
-- 11 CORREGIR 
SELECT nombre
FROM fabricante
WHERE codigo_fabricante IN (SELECT DISTINCT codigo_fabricante FROM producto);

-- 12 CORREGIR 
SELECT nombre
FROM fabricante
WHERE codigo_fabricante NOT IN (SELECT codigo_fabricante FROM Producto);

-- 13 CORREGIR
SELECT nombre
FROM fabricante
WHERE EXISTS (
    SELECT 1
    FROM producto
    WHERE producto.fabricante_codigo = fabricante.id
);

-- 14 CORREGIR
SELECT nombre
FROM fabricante
WHERE NOT EXISTS (
    SELECT 1
    FROM producto
    WHERE productos.codigo_fabricante = fabricante.codigo_fabricante
);

-- Subconsultas correlacionadas
-- 15 CORREGIR
SELECT 
    f.nombre AS fabricante,
    p.nombre AS producto,
    p.precio
FROM 
    fabricante f
JOIN 
    producto p ON f.id = p.fabricante_id
WHERE 
    p.precio = (
        SELECT MAX(precio)
        FROM producto p2
        WHERE p2.codigo_fabricante = f.id
    );

-- 16
SELECT
    p.nombre,
    p.precio
FROM
    productos p
JOIN
    fabricante f ON p.codigo_fabricante = f.codigo
WHERE
    p.precio >= (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = f.codigo)
;

-- 17 CORREGIR
SELECT nombre
FROM producto
WHERE fabricante = 'Lenovo' AND precio = (
    SELECT MAX(precio)
    FROM producto
    WHERE fabricante = 'Lenovo'
);

-- 18 CORREGIR 
SELECT nombre
FROM fabricante
WHERE (
    SELECT COUNT(*)
    FROM producto
    WHERE fabricante_id = (
        SELECT id
        FROM fabricante
        WHERE nombre = 'Lenovo'
    )
) = (
    SELECT COUNT(*)
    FROM producto
    WHERE fabricante_id = (
        SELECT id
        FROM fabricante
        WHERE nombre = 'Lenovo'
    )
);





