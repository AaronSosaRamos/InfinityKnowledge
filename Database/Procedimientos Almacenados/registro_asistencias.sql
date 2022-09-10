DROP PROCEDURE IF EXISTS sp_registro_asistencias_insertar;
DROP PROCEDURE IF EXISTS sp_registro_asistencias_actualizar;
DROP PROCEDURE IF EXISTS sp_registro_asistencias_buscar_por_id_de_estudiante;
DROP PROCEDURE IF EXISTS sp_registro_asistencias_buscar_por_dni_de_estudiante;
DROP PROCEDURE IF EXISTS sp_registro_asistencias_buscar_para_docente;
DROP PROCEDURE IF EXISTS sp_registro_asistencias_eliminar;

DELIMITER //
CREATE PROCEDURE sp_registro_asistencias_insertar(
	IN docente_id_ INT,
    estudiante_id_ INT,
    curso_id_ INT,
    salon_clases_ CHAR(2),
    n_asistencias_realizadas_ SMALLINT,
    n_justificaciones_realizadas_ SMALLINT,
    fecha_emision_ DATE
)
BEGIN
    INSERT INTO infinite_knowledge.registro_asistencias(registro_asistencias.docente_id,registro_asistencias.estudiante_id,
    registro_asistencias.curso_id,registro_asistencias.salon_clases,registro_asistencias.n_asistencias_realizadas,
    registro_asistencias.n_justificaciones_realizadas,registro_asistencias.fecha_emision) 
    VALUES (docente_id_,estudiante_id_,curso_id_,salon_clases_,n_asistencias_realizadas_,n_justificaciones_realizadas_,fecha_emision_);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_registro_asistencias_actualizar(
	IN docente_id_ INT,
    estudiante_id_ INT,
    curso_id_ INT,
    salon_clases_ CHAR(2),
    n_asistencias_realizadas_ SMALLINT,
    n_justificaciones_realizadas_ SMALLINT,
    fecha_emision_ DATE
)
BEGIN
    UPDATE infinite_knowledge.registro_asistencias SET registro_asistencias.salon_clases = salon_clases_,
    registro_asistencias.n_asistencias_realizadas = n_asistencias_realizadas_,
    registro_asistencias.n_justificaciones_realizadas = n_justificaciones_realizadas_,registro_asistencias.fecha_emision = fecha_emision_ WHERE 
    registro_asistencias.docente_id = docente_id_ AND registro_asistencias.estudiante_id = estudiante_id_ 
    AND registro_asistencias.curso_id = curso_id_;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_registro_asistencias_buscar_por_id_de_estudiante(
    IN estudiante_id_ INT
)
BEGIN
    SELECT CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS docente, CONCAT(estudiante.apellido_paterno,' ',estudiante.apellido_materno,' ',
    estudiante.nombre) AS estudiante, curso.nombre AS curso, registro_asistencias.salon_clases, registro_asistencias.n_asistencias_realizadas AS 
    asistencias, registro_asistencias.n_faltas_realizadas AS faltas,  registro_asistencias.n_justificaciones_realizadas AS justificaciones, 
    registro_asistencias.n_total_asistencias AS total, registro_asistencias.fecha_emision AS emision
    FROM (((infinite_knowledge.registro_asistencias INNER JOIN 
    infinite_knowledge.docente ON registro_asistencias.docente_id = docente.docente_id) INNER JOIN infinite_knowledge.estudiante ON registro_asistencias.estudiante_id = 
    estudiante.estudiante_id) INNER JOIN curso ON registro_asistencias.curso_id = curso.curso_id) 
    WHERE registro_asistencias.estudiante_id = estudiante_id_ ORDER BY docente.apellido_paterno ASC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_registro_asistencias_buscar_por_dni_de_estudiante(
   IN dni_ CHAR(8)
)
BEGIN
	SELECT CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS docente, CONCAT(estudiante.apellido_paterno,' ',estudiante.apellido_materno,' ',
    estudiante.nombre) AS estudiante, curso.nombre AS curso, registro_asistencias.salon_clases, registro_asistencias.n_asistencias_realizadas AS 
    asistencias, registro_asistencias.n_faltas_realizadas AS faltas,  registro_asistencias.n_justificaciones_realizadas AS justificaciones, 
    registro_asistencias.n_total_asistencias AS total, registro_asistencias.fecha_emision AS emision
    FROM (((infinite_knowledge.registro_asistencias INNER JOIN 
    infinite_knowledge.docente ON registro_asistencias.docente_id = docente.docente_id) INNER JOIN infinite_knowledge.estudiante ON registro_asistencias.estudiante_id = 
    estudiante.estudiante_id) INNER JOIN curso ON registro_asistencias.curso_id = curso.curso_id) 
    WHERE estudiante.dni = dni_ ORDER BY docente.apellido_paterno ASC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_registro_asistencias_buscar_para_docente(
   IN dni_ CHAR(8),
   curso_id_ INT
)
BEGIN
	SELECT CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS docente, CONCAT(estudiante.apellido_paterno,' ',estudiante.apellido_materno,' ',
    estudiante.nombre) AS estudiante, curso.nombre AS curso, registro_asistencias.salon_clases, registro_asistencias.n_asistencias_realizadas AS 
    asistencias, registro_asistencias.n_faltas_realizadas AS faltas,  registro_asistencias.n_justificaciones_realizadas AS justificaciones, 
    registro_asistencias.n_total_asistencias AS total, registro_asistencias.fecha_emision AS emision
    FROM (((infinite_knowledge.registro_asistencias INNER JOIN 
    infinite_knowledge.docente ON registro_asistencias.docente_id = docente.docente_id) INNER JOIN infinite_knowledge.estudiante ON registro_asistencias.estudiante_id = 
    estudiante.estudiante_id) INNER JOIN curso ON registro_asistencias.curso_id = curso.curso_id) 
    WHERE docente.dni = dni_ AND curso.curso_id = curso_id_ ORDER BY estudiante.apellido_paterno ASC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_registro_asistencias_eliminar(
	IN docente_id_ INT,
    estudiante_id_ INT,
    curso_id_ INT
)
BEGIN
    DELETE FROM infinite_knowledge.registro_asistencias WHERE registro_asistencias.docente_id = docente_id_ AND registro_asistencias.estudiante_id = estudiante_id_ 
	AND registro_asistencias.curso_id = curso_id_;
END //
DELIMITER ;