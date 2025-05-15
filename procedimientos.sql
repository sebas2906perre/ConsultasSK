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

SELECT nombre FROM producto;
SELECT nombre, precio
FROM producto;

DESCRIBE producto;