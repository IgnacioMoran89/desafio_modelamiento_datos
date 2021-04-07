-- Crear base de datos e ingresar
CREATE DATABASE colegio;

\c colegio

-- Crear tablas y luego sus respectivas asociaciones mediante llaves
CREATE TABLE curso(id SERIAL, nombre_curso VARCHAR(15));
CREATE TABLE alumno(id SERIAL, rut VARCHAR(15), nombre_alumno VARCHAR(20), nombre_curso VARCHAR(15));
CREATE TABLE pruebas(id SERIAL, puntaje SMALLINT, rut_alumno VARCHAR(15), id_profesor SMALLINT);
CREATE TABLE profesor(id SERIAL, nombre_profesor VARCHAR(20), departamento VARCHAR(20));

ALTER TABLE curso ADD PRIMARY KEY (nombre_curso);
ALTER TABLE alumno ADD PRIMARY KEY (rut);
ALTER TABLE pruebas ADD PRIMARY KEY (id);
ALTER TABLE profesor ADD PRIMARY KEY (id);

ALTER TABLE alumno ADD FOREIGN KEY (nombre_curso) REFERENCES curso(nombre_curso);
ALTER TABLE pruebas ADD FOREIGN KEY (rut_alumno) REFERENCES alumno(rut);
ALTER TABLE pruebas ADD FOREIGN KEY (id_profesor) REFERENCES profesor(id);

-- Insertar datos a las tablas
INSERT INTO curso(nombre_curso) VALUES('Segundo grado');
INSERT INTO curso(nombre_curso) VALUES('Tercer grado');

INSERT INTO alumno(rut, nombre_alumno, nombre_curso) VALUES('20220004-7', 'Tom Araya', 'Segundo grado'); 
INSERT INTO alumno(rut, nombre_alumno, nombre_curso) VALUES('22220004-8', 'Roy Orbison', 'Tercer grado'); 

INSERT INTO profesor(nombre_profesor, departamento) VALUES('Jonny Bravo', 'Física'); 
INSERT INTO profesor(nombre_profesor, departamento) VALUES('Weeman', 'Química');

INSERT INTO pruebas(puntaje, rut_alumno, id_profesor) VALUES(8, '20220004-7', 1); 
INSERT INTO pruebas(puntaje, rut_alumno, id_profesor) VALUES(5, '22220004-8', 2); 
