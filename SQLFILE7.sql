use consultas; 
CALL InsertProducto('Disco duro SATA3 1TB', 86.99, 'Seagate');
SHOW PROCEDURE STATUS WHERE Db = 'consultas' AND Name = 'insertar_producto';
