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
SELECT * FROM producto WHERE  codigo_fabricante (1, 2, 3);

-- 29 
SELECT nombre, precio  * 100 AS centimos
FROM producto; 









