-- Crear base de datos e ingresar
CREATE DATABASE empresa;

\c empresa

-- Crear tablas y luego sus respectivas asociaciones mediante llaves
CREATE TABLE trabajador(id SERIAL, rut VARCHAR(15) , direccion VARCHAR(50), nombre VARCHAR(30), nombre_depto VARCHAR(20));

CREATE TABLE departamento(id SERIAL, depto VARCHAR(30));

CREATE TABLE liquidaciones(id SERIAL, responsable_almacenar VARCHAR(30), rut_trabajador VARCHAR(15));

ALTER TABLE trabajador ADD PRIMARY KEY (rut);
ALTER TABLE departamento ADD PRIMARY KEY (depto);
ALTER TABLE liquidaciones ADD PRIMARY KEY (id);

ALTER TABLE trabajador ADD FOREIGN KEY (nombre_depto) REFERENCES departamento(depto);
ALTER TABLE liquidaciones ADD FOREIGN KEY (rut_trabajador) REFERENCES trabajador(rut);

-- Insertar datos a las tablas
INSERT INTO trabajador(rut, direccion, nombre, nombre_depto) VALUES('17293905-8', 'Argomedo 76', 'James Labrie', 'Finanzas');
INSERT INTO trabajador(rut, direccion, nombre, nombre_depto) VALUES('17273700-k', 'Santa Isabel 10', 'Misha Mansoor', 'Informática');

INSERT INTO departamento(depto) VALUES('Finanzas');
INSERT INTO departamento(depto) VALUES('Informática');

INSERT INTO liquidaciones(responsable_almacenar, rut_trabajador) VALUES('Elvis Presley', '17293905-8');
INSERT INTO liquidaciones(responsable_almacenar, rut_trabajador) VALUES('David Gilmoure', '17273700-k');