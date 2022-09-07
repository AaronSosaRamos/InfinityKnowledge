DROP PROCEDURE IF EXISTS sp_enfoque_curso_insertar;
DROP PROCEDURE IF EXISTS sp_enfoque_curso_listar;
DROP PROCEDURE IF EXISTS sp_enfoque_curso_buscar_por_id;
DROP PROCEDURE IF EXISTS sp_enfoque_curso_buscar_por_nombre;
DROP PROCEDURE IF EXISTS sp_enfoque_curso_actualizar;
DROP PROCEDURE IF EXISTS sp_enfoque_curso_eliminar;

DELIMITER //
CREATE PROCEDURE sp_enfoque_curso_insertar(
	IN nombre_ VARCHAR(45)
)
BEGIN
    INSERT INTO infinite_knowledge.enfoque_curso(nombre) VALUES (nombre_); 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_enfoque_curso_listar(
)
BEGIN
    SELECT enfoque_curso.enfoque_curso_id, enfoque_curso.nombre FROM infinite_knowledge.enfoque_curso ORDER BY enfoque_curso.enfoque_curso_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_enfoque_curso_buscar_por_id(
	IN enfoque_curso_id_ INT(10)
)
BEGIN
    SELECT enfoque_curso.enfoque_curso_id, enfoque_curso.nombre FROM infinite_knowledge.enfoque_curso WHERE enfoque_curso.enfoque_curso_id = enfoque_curso_id_ ORDER BY enfoque_curso.enfoque_curso_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_enfoque_curso_buscar_por_nombre(
	IN nombre_ VARCHAR(45)
)
BEGIN
    SELECT enfoque_curso.enfoque_curso_id, enfoque_curso.nombre  FROM infinite_knowledge.enfoque_curso WHERE enfoque_curso.nombre LIKE nombre_ ORDER BY enfoque_curso.enfoque_curso_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_enfoque_curso_actualizarr(
	IN enfoque_curso_id_ INT,
    nombre_ VARCHAR(45)
)
BEGIN
    UPDATE infinite_knowledge.enfoque_curso SET enfoque_curso.nombre = nombre_ WHERE enfoque_curso.enfoque_curso_id = enfoque_curso_id_; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_enfoque_curso_eliminar(
	IN enfoque_curso_id_ INT
)
BEGIN
    DELETE FROM infinite_knowledge.enfoque_curso WHERE enfoque_curso.enfoque_curso_id = enfoque_curso_id_; 
END //
DELIMITER ;