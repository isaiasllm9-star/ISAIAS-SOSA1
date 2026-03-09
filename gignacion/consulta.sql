-- ============================================================
-- SCRIPT DE IMPLEMENTACIÓN: GIMNASIO "FITLIFE"
-- Motor: SQLite
-- ============================================================

-- Habilitar integridad referencial
PRAGMA foreign_keys = ON;

-- 1. ELIMINACIÓN DE TABLAS (Para re-ejecución limpia)
DROP TABLE IF EXISTS Inscripciones;
DROP TABLE IF EXISTS Clases;
DROP TABLE IF EXISTS Miembros;

-- 2. CREACIÓN DE TABLAS

-- Tabla Miembros
CREATE TABLE Miembros (
    cedula          TEXT PRIMARY KEY,
    nombre_completo TEXT NOT NULL,
    telefono        TEXT
);

-- Tabla Clases
CREATE TABLE Clases (
    id_clase        INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_clase    TEXT NOT NULL,
    dia_semana      TEXT NOT NULL,
    horario         TEXT NOT NULL
);

-- Tabla Inscripciones (Resolución de relación Muchos a Muchos entre Miembros y Clases)
CREATE TABLE Inscripciones (
    id_inscripcion  INTEGER PRIMARY KEY AUTOINCREMENT,
    cedula_miembro  TEXT NOT NULL,
    id_clase        INTEGER NOT NULL,
    fecha_registro  DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (cedula_miembro) REFERENCES Miembros(cedula) ON DELETE CASCADE,
    FOREIGN KEY (id_clase) REFERENCES Clases(id_clase) ON DELETE CASCADE
);

-- 3. INSERCIÓN DE DATOS (Mínimo 5 registros por tabla)

-- Miembros
INSERT INTO Miembros (cedula, nombre_completo, telefono) VALUES
('1-1111-1111', 'Juan Pérez', '809-555-0101'),
('2-2222-2222', 'María García', '809-555-0202'),
('3-3333-3333', 'Carlos Rodríguez', '809-555-0303'),
('4-4444-4444', 'Elena Martínez', '809-555-0404'),
('5-5555-5555', 'Luis Sánchez', '809-555-0505');

-- Clases
INSERT INTO Clases (nombre_clase, dia_semana, horario) VALUES
('Yoga', 'Lunes', '08:00 AM'),
('Spinning', 'Martes', '06:00 PM'),
('Zumba', 'Miércoles', '07:00 PM'),
('Crossfit', 'Jueves', '05:00 AM'),
('Pilates', 'Viernes', '09:00 AM');

-- Inscripciones (Relación N:M)
INSERT INTO Inscripciones (cedula_miembro, id_clase) VALUES
('1-1111-1111', 1), -- Juan en Yoga
('1-1111-1111', 2), -- Juan en Spinning
('2-2222-2222', 1), -- María en Yoga
('3-3333-3333', 3), -- Carlos en Zumba
('4-4444-4444', 4), -- Elena en Crossfit
('5-5555-5555', 5); -- Luis en Pilates

-- 4. CONSULTA DE VERIFICACIÓN
SELECT m.nombre_completo AS Miembro, c.nombre_clase AS Clase, c.dia_semana, c.horario
FROM Inscripciones i
JOIN Miembros m ON i.cedula_miembro = m.cedula
JOIN Clases c ON i.id_clase = c.id_clase;
