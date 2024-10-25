DROP DATABASE IF EXISTS db_agenda;
CREATE DATABASE IF NOT EXISTS db_agenda;

USE db_agenda;

CREATE TABLE IF NOT EXISTS personas(
    id_persona int AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50) NOT NULL,
    primer_apellido varchar(50) NOT NULL,
    segundo_apellido varchar(50) NOT NULL,
    email varchar(100) NOT NULL,
    telefono varchar(10) NOT NULL
);

DELETE FROM personas;

INSERT INTO personas (nombre,primer_apellido,segundo_apellido,email,telefono)
VALUES 
('Ana', 'Lopez', 'Martinez', 'ana.lopez23@gmail.com', '5551234567'),
('Carlos', 'Perez', 'Gomez', 'carlospg78@hotmail.com', '7719876543'),
('Maria', 'Garcia', 'Sanchez', 'maria_garcia@gmail.com', '4443217890');
SELECT * FROM personas;
