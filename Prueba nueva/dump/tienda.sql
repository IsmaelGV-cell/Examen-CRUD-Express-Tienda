DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;


-- Tabla de Clientes
CREATE TABLE cliente (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    direccion VARCHAR(255)
);


CREATE TABLE orden (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_cliente INT UNSIGNED NOT NULL,
    total DOUBLE NOT NULL,
    estado ENUM('pendiente', 'procesando', 'enviado', 'entregado') DEFAULT 'pendiente',
    observaciones TEXT,
    FOREIGN KEY (id_cliente) 
        REFERENCES cliente(id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);




-- Insertar datos de clientes
INSERT INTO cliente (nombre, apellido, email, telefono, direccion) VALUES
    ('Juan', 'Pérez', 'juan.perez@email.com', '123456789', 'Calle 123, Ciudad'),
    ('Ana', 'Gómez', 'ana.gomez@email.com', '987654321', 'Avenida XYZ, Pueblo'),
    ('Carlos', 'Rodríguez', 'carlos.rodriguez@email.com', '555-1234', 'Plaza Principal, Villa');

-- Insertar datos de órdenes
INSERT INTO orden (fecha, id_cliente, total, estado, observaciones) VALUES
    ('2023-01-15 10:00:00', 1, 120.50, 'procesando', 'Orden en proceso de preparación'),
    ('2023-02-01 15:30:00', 2, 75.20, 'pendiente', NULL),
    ('2023-03-10 08:45:00', 3, 200.00, 'enviado', 'Entregar en la dirección indicada');
