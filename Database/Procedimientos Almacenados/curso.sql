DROP PROCEDURE IF EXISTS sp_curso_insertar;
DROP PROCEDURE IF EXISTS sp_curso_buscar_por_id;
DROP PROCEDURE IF EXISTS sp_curso_buscar_por_nombre;
DROP PROCEDURE IF EXISTS sp_curso_buscar_por_enfoque;
DROP PROCEDURE IF EXISTS sp_curso_buscar_por_dificultad;
DROP PROCEDURE IF EXISTS sp_curso_listar;
DROP PROCEDURE IF EXISTS sp_curso_listar_nombres_por_dni_estudiante;
DROP PROCEDURE IF EXISTS sp_curso_listar_nombres_por_dni_docente;
DROP PROCEDURE IF EXISTS sp_curso_eliminar;
DROP PROCEDURE IF EXISTS sp_curso_actualizar;

DELIMITER //
CREATE PROCEDURE sp_curso_insertar(
	IN nombre_ VARCHAR(45),
    n_horas_ TINYINT,
    dificultad_curso_id_ INT,
    enfoque_curso_id_ INT
)
BEGIN
    INSERT INTO infinite_knowledge.curso(curso.nombre,curso.n_horas,curso.dificultad_curso_id,curso.enfoque_curso_id) 
    VALUES (nombre_,n_horas_,dificultad_curso_id_,enfoque_curso_id_);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_curso_buscar_por_id(
	IN curso_id_ INT
)
BEGIN
     SELECT curso.curso_id, curso.nombre, curso.n_horas, dificultad_curso.nombre AS dificultad_curso, enfoque_curso.nombre 
     AS enfoque_curso FROM (infinite_knowledge.curso INNER JOIN infinite_knowledge.dificultad_curso ON curso.dificultad_curso_id = 
     dificultad_curso.dificultad_curso_id) INNER JOIN infinite_knowledge.enfoque_curso ON curso.enfoque_curso_id = enfoque_curso.enfoque_curso_id 
     WHERE curso.curso_id = curso_id_ ORDER BY curso.curso_id ASC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_curso_buscar_por_nombre(
	IN nombre_ VARCHAR(45)
)
BEGIN
     SELECT curso.curso_id, curso.nombre, curso.n_horas, dificultad_curso.nombre AS dificultad_curso, enfoque_curso.nombre AS 
     enfoque_curso FROM (infinite_knowledge.curso INNER JOIN infinite_knowledge.dificultad_curso ON curso.dificultad_curso_id = 
     dificultad_curso.dificultad_curso_id) INNER JOIN infinite_knowledge.enfoque_curso ON curso.enfoque_curso_id = enfoque_curso.enfoque_curso_id
     WHERE curso.nombre LIKE nombre_ ORDER BY curso.curso_id ASC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_curso_buscar_por_enfoque(
	IN enfoque_curso_id_ INT
)
BEGIN
     SELECT curso.curso_id, curso.nombre, curso.n_horas, dificultad_curso.nombre AS dificultad_curso, enfoque_curso.nombre AS 
     enfoque_curso FROM (infinite_knowledge.curso INNER JOIN infinite_knowledge.dificultad_curso ON curso.dificultad_curso_id = 
     dificultad_curso.dificultad_curso_id) INNER JOIN infinite_knowledge.enfoque_curso ON curso.enfoque_curso_id = enfoque_curso.enfoque_curso_id
     WHERE curso.enfoque_curso_id = enfoque_curso_id_ ORDER BY curso.curso_id ASC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_curso_buscar_por_dificultad(
	IN dificultad_curso_id_ INT
)
BEGIN
     SELECT curso.curso_id, curso.nombre, curso.n_horas, dificultad_curso.nombre AS dificultad_curso, enfoque_curso.nombre AS 
     enfoque_curso FROM (infinite_knowledge.curso INNER JOIN infinite_knowledge.dificultad_curso ON curso.dificultad_curso_id = 
     dificultad_curso.dificultad_curso_id) INNER JOIN infinite_knowledge.enfoque_curso ON curso.enfoque_curso_id = enfoque_curso.enfoque_curso_id 
     WHERE curso.dificultad_curso_id = dificultad_curso_id_ ORDER BY curso.curso_id ASC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_curso_listar(
)
BEGIN
    SELECT curso.curso_id, curso.nombre, curso.n_horas, dificultad_curso.nombre AS dificultad_curso, enfoque_curso.nombre 
    AS enfoque_curso FROM (infinite_knowledge.curso INNER JOIN infinite_knowledge.dificultad_curso ON curso.dificultad_curso_id = 
    dificultad_curso.dificultad_curso_id) INNER JOIN infinite_knowledge.enfoque_curso ON curso.enfoque_curso_id = enfoque_curso.enfoque_curso_id 
    ORDER BY curso.curso_id ASC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_curso_listar_nombres_por_dni_estudiante(
    IN dni_ CHAR(8)
)
BEGIN
    SELECT DISTINCT curso.curso_id, curso.nombre FROM (infinite_knowledge.curso INNER JOIN infinite_knowledge.registro_asistencias 
    ON curso.curso_id = registro_asistencias.curso_id) INNER JOIN infinite_knowledge.estudiante ON estudiante.estudiante_id = 
    registro_asistencias.estudiante_id WHERE estudiante.dni = dni_  ORDER BY curso.curso_id ASC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_curso_listar_nombres_por_dni_docente(
    IN dni_ CHAR(8)
)
BEGIN
    SELECT DISTINCT curso.curso_id, curso.nombre FROM (infinite_knowledge.curso INNER JOIN infinite_knowledge.registro_asistencias 
    ON curso.curso_id = registro_asistencias.curso_id) INNER JOIN infinite_knowledge.docente ON docente.docente_id = registro_asistencias.docente_id
    WHERE docente.dni = dni_  ORDER BY curso.curso_id ASC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_curso_eliminar(
	IN curso_id_ INT
)
BEGIN
    DELETE FROM infinite_knowledge.curso WHERE curso.curso_id = curso_id_;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_curso_actualizar(
	IN curso_id_ INT,
    nombre_ VARCHAR(45),
    n_horas_ TINYINT,
    dificultad_curso_id_ INT,
    enfoque_curso_id_ INT
)
BEGIN
    UPDATE infinite_knowledge.curso SET curso.nombre = nombre_,curso.n_horas = n_horas_,curso.dificultad_curso_id = 
    dificultad_curso_id_,curso.enfoque_curso_id = enfoque_curso_id_;
END //
DELIMITER ;