DROP PROCEDURE IF EXISTS sp_curso_insertar;
DROP PROCEDURE IF EXISTS sp_curso_buscar_por_id;
DROP PROCEDURE IF EXISTS sp_curso_buscar_por_nombre;
DROP PROCEDURE IF EXISTS sp_curso_listar;
DROP PROCEDURE IF EXISTS sp_curso_listar_nombres_por_dni_estudiante;
DROP PROCEDURE IF EXISTS sp_curso_listar_nombres_por_dni_docente;
DROP PROCEDURE IF EXISTS sp_curso_eliminar;
DROP PROCEDURE IF EXISTS sp_curso_actualizar;

DELIMITER //
CREATE PROCEDURE sp_curso_insertar(
	IN nombre_ VARCHAR(45),
    n_horas_por_semana_ TINYINT,
    enfoque_ VARCHAR(50)
)
BEGIN
    INSERT INTO infinite_knowledge.curso(curso.nombre,curso.n_horas_por_semana,curso.enfoque) 
    VALUES (nombre_,n_horas_por_semana_,enfoque_);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_curso_buscar_por_id(
	IN curso_id_ INT
)
BEGIN
     SELECT curso.curso_id, curso.nombre, curso.n_horas_por_semana, curso.enfoque
     FROM infinite_knowledge.curso WHERE curso.curso_id = curso_id_ ORDER BY curso.curso_id ASC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_curso_buscar_por_nombre(
	IN nombre_ VARCHAR(45)
)
BEGIN
     SELECT curso.curso_id, curso.nombre, curso.n_horas_por_semana, curso.enfoque
     FROM infinite_knowledge.curso WHERE curso.nombre LIKE CONCAT('%',nombre_,'%') ORDER BY curso.curso_id ASC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_curso_listar(
)
BEGIN
     SELECT curso.curso_id, curso.nombre, curso.n_horas_por_semana, curso.enfoque
     FROM infinite_knowledge.curso ORDER BY curso.curso_id ASC;
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
    n_horas_por_semana_ TINYINT,
    enfoque_ VARCHAR(50)
)
BEGIN
    UPDATE infinite_knowledge.curso SET curso.nombre = nombre_,curso.n_horas_por_semana = n_horas_por_semana_, curso.enfoque = enfoque_ WHERE curso.curso_id = curso_id_;
END //
DELIMITER ;