-- ##########################
-- ###### EXAMEN MYSQL ########
-- ##########################
-- Diagrama creado a base de modeloFisico_diagramER.png

-- Creacion de base de datos
CREATE DATABASE olimpiadas;

-- Uso de base de datos
USE olimpiadas;

-- Creacion de la tabla deportes
CREATE TABLE deportes(
	id_deporte INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    num_jugadores INT NOT NULL
);

-- Creacion de la tabla jefes
CREATE TABLE jefes(
	id_jefe INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    titulo VARCHAR(100) NOT NULL
);

-- Creacion de la tabla equipamiento
CREATE TABLE equipamiento(
	id_equipamiento INT PRIMARY KEY AUTO_INCREMENT,
    nombre_equipos VARCHAR(100) NOT NULL,
    stock INT NOT NULL
);

-- Creacion de la tabla comisario
CREATE TABLE comisario(
	id_comisario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    tipo ENUM('Juez','Observador') 
);

-- Creacion de la tabla info_complejo
CREATE TABLE info_complejo(
	id_complejo INT PRIMARY KEY AUTO_INCREMENT,
    locacion VARCHAR(100) NOT NULL,
    area_complejo float NOT NULL,
    id_jefe INT NOT NULL,
    FOREIGN KEY(id_jefe) REFERENCES jefes(id_jefe)
);

-- Creacion de la tabla complejo_polideportivo
CREATE TABLE complejo_polideportivo(
	id_complejo_polideportivo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    id_deporte INT NOT NULL,
    id_info_complejo INT NOT NULL,
    FOREIGN KEY(id_deporte) REFERENCES deportes(id_deporte),
    FOREIGN KEY(id_info_complejo) REFERENCES info_complejo(id_complejo)
);

-- Creacion de la tabla complejo_deportivo
CREATE TABLE complejo_deportivo(
	id_complejo_deportivo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    id_deporte INT NOT NULL UNIQUE,
    id_info_complejo INT NOT NULL,
    FOREIGN KEY(id_deporte) REFERENCES deportes(id_deporte),
    FOREIGN KEY(id_info_complejo) REFERENCES info_complejo(id_complejo)
);

-- Creacion de la tabla eventos
CREATE TABLE eventos(
	id_evento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    fecha DATETIME NOT NULL,
    duracion TIME NOT NULL,
    num_participantes INT NOT NULL
);

-- Creacion de la tabla evento_complejo_poli 
CREATE TABLE evento_complejo_poli(
	id_evento_complejo INT PRIMARY KEY AUTO_INCREMENT,
    id_evento INT NOT NULL,
    id_complejo INT NOT NULL,
    FOREIGN KEY(id_evento) REFERENCES eventos(id_evento),
    FOREIGN KEY(id_complejo) REFERENCES complejo_polideportivo(id_complejo_polideportivo)
);

-- Creacion de la tabla evento_complejo_deportivo 
CREATE TABLE evento_complejo_deportivo(
	id_evento_complejo_deportivo INT PRIMARY KEY AUTO_INCREMENT,
    id_evento INT NOT NULL,
    id_complejo INT NOT NULL,
    FOREIGN KEY(id_evento) REFERENCES eventos(id_evento),
    FOREIGN KEY(id_complejo) REFERENCES complejo_deportivo(id_complejo_deportivo)
);

-- Creacion de la tabla evento_complejo_poli 
CREATE TABLE evento_comisario(
	id_evento_comisario INT PRIMARY KEY AUTO_INCREMENT,
    id_evento INT NOT NULL,
    id_comisario INT NOT NULL,
    FOREIGN KEY(id_evento) REFERENCES eventos(id_evento),
    FOREIGN KEY(id_comisario) REFERENCES comisario(id_comisario)
);


-- Creacion de la tabla evento_equipo
CREATE TABLE evento_equipo(
	id_evento_equipo INT PRIMARY KEY AUTO_INCREMENT,
    id_evento INT NOT NULL,
    id_equipamiento INT NOT NULL,
	FOREIGN KEY(id_evento) REFERENCES eventos(id_evento),
    FOREIGN KEY(id_equipamiento) REFERENCES equipamiento(id_equipamiento)
);


-- Creacion de la tabla sede
CREATE TABLE sede(
	id_sede INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    id_complejo INT NOT NULL,
    presupuesto FLOAT NOT NULL,
    -- ESTA FOREIGN KEY FUE CAMBIADA ES DIFERENTE AL DIAGRAMA ER
    FOREIGN KEY(id_complejo) REFERENCES info_complejo(id_complejo)
);

-- Developed by Juan Diego Contreras Melendez, CC 1097*******782
