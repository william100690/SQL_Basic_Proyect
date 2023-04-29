


-- If there is a DATABASE with that name, DROP it 
drop database if EXISTS Computer_Store;

-- createa the new DATABASE
CREATE DATABASE Computer_Store;


-- stablish that Computer_Store is the DATABASE to USE
USE Computer_Store;


-- Create the table named Manufacturer
CREATE TABLE Manufacturer (
    ID int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);


-- crea the table named Product
CREATE Table Product (
    ID int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Price DOUBLE NOT NULL,
    ID_Manufacturer INT UNSIGNED NOT NULL,
    Foreign Key (ID_Manufacturer) REFERENCES Manufacturer (ID)
);


-- Insert the information into Manufacturer table
INSERT INTO Manufacturer
VALUES
(1, 'Asus'),
(2, 'Lenovo'),
(3, 'Hewlett-Packard'),
(4, 'Samsung'),
(5, 'Seagate'),
(6, 'Crucial'),
(7, 'Gigabyte'),
(8, 'Huawei'),
(9, 'Xiaomi');


-- Insert the infomation into Product table
INSERT into Product
VALUES
(1, 'Disco duro SATA3 1TB', 86.99, 5),
(2, 'Memoria RAM DDR4 8GB', 120, 6),
(3, 'Disco SSD 1 TB', 150.99, 4),
(4, 'GeForce GTX 1050Ti', 185, 7),
(5, 'GeForce GTX 1080 Xtreme', 755, 6),
(6, 'Monitor 24 LED Full HD', 202, 1),
(7, 'Monitor 27 LED Full HD', 245.99, 1),
(8, 'Portátil Yoga 520', 559, 2),
(9, 'Portátil Ideapd 320', 444, 2),
(10, 'Impresora HP Deskjet 3720', 59.99, 3),
(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);