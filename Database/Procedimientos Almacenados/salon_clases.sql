DROP PROCEDURE IF EXISTS sp_salon_clases_insertar;
DROP PROCEDURE IF EXISTS sp_salon_clases_buscar_por_id;
DROP PROCEDURE IF EXISTS sp_salon_clases_buscar_por_nivel_academico;
DROP PROCEDURE IF EXISTS sp_salon_clases_listar;
DROP PROCEDURE IF EXISTS sp_salon_clases_eliminar;
DROP PROCEDURE IF EXISTS sp_salon_clases_actualizar;

DELIMITER //
CREATE PROCEDURE sp_salon_clases_insertar(
	IN grado_ TINYINT,
    seccion_ VARCHAR(2),
    nivel_academico_id_ INT
)
BEGIN
    INSERT INTO infinite_knowledge.salon_clases(salon_clases.grado,salon_clases.seccion,salon_clases.nivel_academico_id) VALUES (grado_,seccion_,nivel_academico_id_);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_salon_clases_buscar_por_id(
	IN salon_clases_id_ INT
)
BEGIN
    SELECT salon_clases.salon_clases_id,salon_clases.grado, salon_clases.seccion, nivel_academico.nombre AS nivel_academico FROM infinite_knowledge.salon_clases INNER JOIN infinite_knowledge.nivel_academico ON salon_clases.nivel_academico_id = nivel_academico.nivel_academico_id WHERE salon_clases.salon_clases_id = salon_clases_id_ ORDER BY salon_clases.salon_clases_id ASC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_salon_clases_buscar_por_nivel_academico(
	IN nivel_academico_id_ INT
)
BEGIN
    SELECT salon_clases.salon_clases_id,salon_clases.grado, salon_clases.seccion, nivel_academico.nombre AS nivel_academico FROM infinite_knowledge.salon_clases INNER JOIN infinite_knowledge.nivel_academico ON salon_clases.nivel_academico_id = nivel_academico.nivel_academico_id WHERE salon_clases.nivel_academico_id = nivel_academico_id_ ORDER BY salon_clases.salon_clases_id ASC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_salon_clases_listar(
)
BEGIN
    SELECT salon_clases.salon_clases_id,salon_clases.grado, salon_clases.seccion, nivel_academico.nombre AS nivel_academico FROM infinite_knowledge.salon_clases INNER JOIN infinite_knowledge.nivel_academico ON salon_clases.nivel_academico_id = nivel_academico.nivel_academico_id ORDER BY salon_clases.salon_clases_id ASC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_salon_clases_eliminar(
	IN salon_clases_id_ INT 
)
BEGIN
    DELETE FROM infinite_knowledge.salon_clases WHERE salon_clases.salon_clases_id = salon_clases_id_;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_salon_clases_actualizar(
	IN salon_clases_id_ INT,
    grado_ TINYINT,
    seccion_ VARCHAR(2),
    nivel_academico_id_ INT
)
BEGIN
    UPDATE infinite_knowledge.salon_clases SET salon_clases.grado = grado_, salon_clases.seccion = seccion_, salon_clases.nivel_academico_id = nivel_academico_id_ WHERE salon_clases.salon_clases_id = salon_clases_id_;
END //
DELIMITER ;