-- Crear base y usuario de aplicación
CREATE DATABASE IF NOT EXISTS huntechdb;
USE huntechdb;

CREATE USER IF NOT EXISTS 'huntech'@'localhost' IDENTIFIED BY '1029';
GRANT ALL PRIVILEGES ON huntechdb.* TO 'huntech'@'localhost';
FLUSH PRIVILEGES;

-- Tabla: categorias
CREATE TABLE IF NOT EXISTS categorias (
  id_categoria INT NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_categoria),
  UNIQUE KEY nombre (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO categorias VALUES
(1,'Accesorios'),
(2,'Ensambles'),
(3,'Servicios Técnicos');

-- Tabla: productos
CREATE TABLE IF NOT EXISTS productos (
  id_producto INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  categoria_id INT NOT NULL,
  marca VARCHAR(50),
  modelo VARCHAR(50),
  tipo VARCHAR(50),
  especificaciones TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_producto),
  CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES categorias (id_categoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO productos VALUES
(1,'Cable USB-C','Cable de carga y datos',1,'Generic','C100','Accesorio','1m','2025-11-24 00:39:46'),
(2,'Kit Ensamblaje','Kit con tornillería y placas',2,'BuildIt','KIT-A','Ensamble','Set','2025-11-24 00:39:46');

-- Tabla: servicios_tecnicos
CREATE TABLE IF NOT EXISTS servicios_tecnicos (
  id_servicio INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  precio DECIMAL(10,2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_servicio)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO servicios_tecnicos VALUES
(1,'Limpieza General','Limpieza interna y externa',15.00,'2025-11-24 00:39:46'),
(2,'Formateo e instalación SO','Formateo y reinstalación del sistema operativo',30.00,'2025-11-24 00:39:46'),
(3,'Diagnóstico','Diagnóstico de fallas',10.00,'2025-11-24 00:39:46');

-- Tabla: ventas
CREATE TABLE IF NOT EXISTS ventas (
  id_venta INT NOT NULL AUTO_INCREMENT,
  fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  total DECIMAL(10,2),
  cliente VARCHAR(255) DEFAULT '',
  telefono VARCHAR(50) DEFAULT '',
  PRIMARY KEY (id_venta)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO ventas VALUES
(16,'2025-11-27 04:19:30',345.60,'Aldo','212376812903'),
(17,'2025-11-27 15:13:46',162.00,'Gabo','12345678908');

-- Tabla: detalles_venta
CREATE TABLE IF NOT EXISTS detalles_venta (
  id_detalle INT NOT NULL AUTO_INCREMENT,
  id_venta INT NOT NULL,
  id_producto INT DEFAULT NULL,
  id_servicio INT DEFAULT NULL,
  cantidad INT DEFAULT 1,
  precio_unitario DECIMAL(10,2),
  subtotal DECIMAL(10,2),
  PRIMARY KEY (id_detalle),
  CONSTRAINT fk_venta FOREIGN KEY (id_venta) REFERENCES ventas (id_venta) ON DELETE CASCADE,
  CONSTRAINT fk_producto FOREIGN KEY (id_producto) REFERENCES productos (id_producto) ON DELETE SET NULL,
  CONSTRAINT fk_servicio FOREIGN KEY (id_servicio) REFERENCES servicios_tecnicos (id_servicio) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO detalles_venta VALUES
(33,16,2,NULL,1,320.00,320.00),
(34,17,NULL,1,1,150.00,150.00);
