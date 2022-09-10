DROP PROCEDURE IF EXISTS sp_registro_calificaciones_insertar;
DROP PROCEDURE IF EXISTS sp_registro_calificaciones_actualizar;
DROP PROCEDURE IF EXISTS sp_registro_calificaciones_buscar_por_id_de_estudiante;
DROP PROCEDURE IF EXISTS sp_registro_calificaciones_buscar_por_dni_de_estudiante;
DROP PROCEDURE IF EXISTS sp_registro_calificaciones_buscar_para_docente;
DROP PROCEDURE IF EXISTS sp_registro_calificaciones_eliminar;

DELIMITER //
CREATE PROCEDURE sp_registro_calificaciones_insertar(
	IN docente_id_ INT,
    estudiante_id_ INT,
    curso_id_ INT,
	salon_clases_ CHAR(2),
    calif1_ TINYINT,
    calif2_ TINYINT,
    calif3_ TINYINT,
    fecha_emision_ DATE
)
BEGIN
    INSERT INTO infinite_knowledge.registro_calificaciones(registro_calificaciones.docente_id,registro_calificaciones.estudiante_id,
    registro_calificaciones.curso_id,registro_calificaciones.salon_clases,registro_calificaciones.calif1,registro_calificaciones.calif2,registro_calificaciones.calif3,
    registro_calificaciones.fecha_emision) VALUES (docente_id_,estudiante_id_,curso_id_,salon_clases_,calif1_,calif2_,calif3_,fecha_emision_);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_registro_calificaciones_actualizar(
	IN docente_id_ INT,
    estudiante_id_ INT,
    curso_id_ INT,
	salon_clases_ CHAR(2),
    calif1_ TINYINT,
    calif2_ TINYINT,
    calif3_ TINYINT,
    fecha_emision_ DATE
)
BEGIN
    UPDATE infinite_knowledge.registro_calificaciones SET registro_calificaciones.salon_clases = salon_clases_, registro_calificaciones.calif1 = calif1_, 
    registro_calificaciones.calif2 = calif2_, registro_calificaciones.calif3 = calif3_, registro_calificaciones.fecha_emision = fecha_emision_ WHERE 
    registro_calificaciones.docente_id = docente_id_ AND registro_calificaciones.estudiante_id = estudiante_id_
    AND registro_calificaciones.curso_id = curso_id_;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_registro_calificaciones_buscar_por_id_de_estudiante(
    IN estudiante_id_ INT
)
BEGIN
    SELECT CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS docente, CONCAT(estudiante.apellido_paterno,' ',estudiante.apellido_materno,' ',
    estudiante.nombre) AS estudiante, curso.nombre AS curso, registro_calificaciones.salon_clases ,registro_calificaciones.calif1, 
    registro_calificaciones.calif2, registro_calificaciones.calif3, registro_calificaciones.promedio_final AS promedio, registro_calificaciones.estado_aprobacion AS estado, 
    registro_calificaciones.fecha_emision AS emision FROM (((infinite_knowledge.registro_calificaciones INNER JOIN 
    infinite_knowledge.docente ON registro_calificaciones.docente_id = docente.docente_id) INNER JOIN infinite_knowledge.estudiante ON registro_calificaciones.estudiante_id = 
    estudiante.estudiante_id) INNER JOIN curso ON registro_calificaciones.curso_id = curso.curso_id)  WHERE registro_calificaciones.estudiante_id = estudiante_id_ ORDER BY docente.apellido_paterno ASC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_registro_calificaciones_buscar_por_dni_de_estudiante(
    IN dni_ CHAR(8)
)
BEGIN
    SELECT CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS docente, CONCAT(estudiante.apellido_paterno,' ',estudiante.apellido_materno,' ',
    estudiante.nombre) AS estudiante, curso.nombre AS curso, registro_calificaciones.salon_clases ,registro_calificaciones.calif1, 
    registro_calificaciones.calif2, registro_calificaciones.calif3, registro_calificaciones.promedio_final AS promedio, registro_calificaciones.estado_aprobacion AS estado, 
    registro_calificaciones.fecha_emision AS emision FROM (((infinite_knowledge.registro_calificaciones INNER JOIN 
    infinite_knowledge.docente ON registro_calificaciones.docente_id = docente.docente_id) INNER JOIN infinite_knowledge.estudiante ON registro_calificaciones.estudiante_id = 
    estudiante.estudiante_id) INNER JOIN curso ON registro_calificaciones.curso_id = curso.curso_id)  WHERE estudiante.dni = dni_ ORDER BY docente.apellido_paterno ASC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_registro_calificaciones_buscar_para_docente(
    IN dni_ CHAR(8),
    curso_id_ INT
)
BEGIN
    SELECT CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS docente, CONCAT(estudiante.apellido_paterno,' ',estudiante.apellido_materno,' ',
    estudiante.nombre) AS estudiante, curso.nombre AS curso, registro_calificaciones.salon_clases ,registro_calificaciones.calif1, 
    registro_calificaciones.calif2, registro_calificaciones.calif3, registro_calificaciones.promedio_final AS promedio, registro_calificaciones.estado_aprobacion AS estado, 
    registro_calificaciones.fecha_emision AS emision FROM (((infinite_knowledge.registro_calificaciones INNER JOIN 
    infinite_knowledge.docente ON registro_calificaciones.docente_id = docente.docente_id) INNER JOIN infinite_knowledge.estudiante ON registro_calificaciones.estudiante_id = 
    estudiante.estudiante_id) INNER JOIN curso ON registro_calificaciones.curso_id = curso.curso_id)  WHERE docente.dni = dni_ AND curso.curso_id = curso_id_ ORDER BY estudiante.apellido_paterno ASC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_registro_calificaciones_eliminar(
	IN docente_id_ INT,
    estudiante_id_ INT,
    curso_id_ INT
)
BEGIN
    DELETE FROM infinite_knowledge.registro_calificaciones WHERE registro_calificaciones.docente_id = docente_id_ AND registro_calificaciones.estudiante_id = estudiante_id_ 
	AND registro_calificaciones.curso_id = curso_id_;
END //
DELIMITER ;