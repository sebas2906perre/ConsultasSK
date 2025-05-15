USE consultas;
CALL InsertFabricante('Asus');
CALL InsertFabricante('Lenovo');
CALL InsertFabricante('Hewlett-Packard');
CALL InsertFabricante('Samsung');
CALL InsertFabricante('Seagate');
CALL InsertFabricante('Crucial');
CALL InsertFabricante('Gigabyte');
CALL InsertFabricante('Huawei');
CALL InsertFabricante('Xiaomi');
Select * from fabricante; 
CALL InsertProducto('Disco duro', 86.99,5);
CALL InsertProducto('Memoria RAM DDR4 8GB',120,6);
CALL InsertProducto('Disco SSD 1 TB',150.99,4);
CALL InsertProducto('GeForce GTX 1050Ti',185,7);
CALL InsertProducto('GeForce GTX 1080 Xtreme',755,6);
CALL InsertProducto('Monitor 24 LED Full HD',202,1);
CALL InsertProducto('Monitor 27 LED Full HD',245.99,1);
CALL InsertProducto('Portátil Yoga 520',559,2);
CALL InsertProducto('Portátil Ideapd 320',444,2);
CALL InsertProducto('Impresora HP Deskjet 3720',59.99,3);
CALL InsertProducto('Impresora HP Laserjet Pro M26nw',180,3);
Select * from producto;


