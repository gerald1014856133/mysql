USE torneoRelampago;

CREATE TABLE equipos (
    idEquipo VARCHAR(12) PRIMARY KEY,
    nombreEquipo VARCHAR(100),
    apodoEquipo VARCHAR(100),
    fundacionEquipo DATE
);

CREATE TABLE jugadores (
    idJugador VARCHAR(12) PRIMARY KEY,
    nombreJugador VARCHAR(100),
    apellidoJugador VARCHAR(100),
    fechaDeNacimientoJugador DATE,
    dorsalJugador INT,
    idEquipo VARCHAR(12),
    CONSTRAINT fkIdJugadores FOREIGN KEY (idEquipo) REFERENCES equipos(idEquipo)
);

CREATE TABLE estadios (
    idEstadio VARCHAR(12) PRIMARY KEY,
    nombreEstadio VARCHAR(100),
    apodoEstadio VARCHAR(100),
    direccionEstadio VARCHAR(100),
    idEquipo VARCHAR(12),
    CONSTRAINT fkIdEquipo FOREIGN KEY (idEquipo) REFERENCES equipos(idEquipo)
);

CREATE TABLE partidos (
    idPartido VARCHAR(12) PRIMARY KEY,
    fechaPartido DATE,
    idEquipoLocal VARCHAR(12),
    idEquipoVisitante VARCHAR(12),
    estadoDelPartido BOOLEAN,
    resultadoPartido VARCHAR(6),
    CONSTRAINT fkIdEquipoLocal FOREIGN KEY (idEquipoLocal) REFERENCES equipos(idEquipo),
    CONSTRAINT fkIdEquipoVisitante FOREIGN KEY (idEquipoVisitante) REFERENCES equipos(idEquipo)
);

CREATE TABLE arbitros (
    idArbitro VARCHAR(12) PRIMARY KEY,
    nombreArbitro VARCHAR(100),
    apellidoArbitro VARCHAR(100),
    fechaDeNacimientoArbitro DATE,
    idPartido VARCHAR(12),
    CONSTRAINT fkIdArbitros FOREIGN KEY (idPartido) REFERENCES partidos(idPartido)
);



-- Insertar datos en la tabla equipos
INSERT INTO equipos (idEquipo, nombreEquipo, apodoEquipo, fundacionEquipo) VALUES
('E01', 'Los Tigres', 'Felinos', '2005-03-15'),
('E02', 'Las Águilas', 'Aviadores', '1998-07-20'),
('E03', 'Los Dragones', 'Fuego', '2010-11-10');

-- Insertar datos en la tabla jugadores
INSERT INTO jugadores (idJugador, nombreJugador, apellidoJugador, fechaDeNacimientoJugador, dorsalJugador, idEquipo) VALUES
('J01', 'Juan', 'Pérez', '1990-01-01', 10, 'E01'),
('J02', 'María', 'López', '1995-05-05', 8, 'E01'),
('J03', 'Carlos', 'Gómez', '1992-02-02', 9, 'E02'),
('J04', 'Ana', 'Martínez', '1993-03-03', 11, 'E03'),
('J05', 'Luis', 'Hernández', '1991-04-04', 7, 'E02');

-- Insertar datos en la tabla estadios
INSERT INTO estadios (idEstadio, nombreEstadio, apodoEstadio, direccionEstadio, idEquipo) VALUES
('S01', 'Estadio de los Tigres', 'La Selva', 'Calle Tigre 123', 'E01'),
('S02', 'Estadio de las Águilas', 'Nido de Águilas', 'Avenida Aviador 456', 'E02'),
('S03', 'Estadio de los Dragones', 'Cueva de Fuego', 'Ruta Dragón 789', 'E03');

-- Insertar datos en la tabla partidos
INSERT INTO partidos (idPartido, fechaPartido, idEquipoLocal, idEquipoVisitante, estadoDelPartido, resultadoPartido) VALUES
('P01', '2024-09-01', 'E01', 'E02', TRUE, '2-1'),
('P02', '2024-09-10', 'E02', 'E03', FALSE, NULL),
('P03', '2024-09-15', 'E03', 'E01', TRUE, '0-3');

-- Insertar datos en la tabla arbitros
INSERT INTO arbitros (idArbitro, nombreArbitro, apellidoArbitro, fechaDeNacimientoArbitro, idPartido) VALUES
('A01', 'Pedro', 'Sánchez', '1985-08-15', 'P01'),
('A02', 'Lucía', 'Torres', '1990-12-10', 'P02'),
('A03', 'Jorge', 'Ramírez', '1988-06-25', 'P03');