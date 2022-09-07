DROP PROCEDURE IF EXISTS sp_grado_academico_insertar;
DROP PROCEDURE IF EXISTS sp_grado_academico_listar;
DROP PROCEDURE IF EXISTS sp_grado_academico_buscar_por_id;
DROP PROCEDURE IF EXISTS sp_grado_academico_buscar_por_nombre;
DROP PROCEDURE IF EXISTS sp_grado_academico_actualizar;
DROP PROCEDURE IF EXISTS sp_grado_academico_eliminar;

DELIMITER //
CREATE PROCEDURE sp_grado_academico_insertar(
	IN nombre_ VARCHAR(45)
)
BEGIN
    INSERT INTO infinite_knowledge.grado_academico(nombre) VALUES (nombre_); 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_grado_academico_listar(
)
BEGIN
    SELECT grado_academico.grado_academico_id, grado_academico.nombre FROM infinite_knowledge.grado_academico ORDER BY grado_academico.grado_academico_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_grado_academico_buscar_por_id(
	IN grado_academico_id_ INT(10)
)
BEGIN
    SELECT grado_academico.grado_academico_id, grado_academico.nombre FROM infinite_knowledge.grado_academico WHERE grado_academico.grado_academico_id = grado_academico_id_ ORDER BY grado_academico.grado_academico_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_grado_academico_buscar_por_nombre(
	IN nombre_ VARCHAR(45)
)
BEGIN
    SELECT grado_academico.grado_academico_id, grado_academico.nombre  FROM infinite_knowledge.grado_academico WHERE grado_academico.nombre LIKE nombre_ ORDER BY grado_academico.grado_academico_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_grado_academico_actualizar(
	IN grado_academico_id_ INT,
    nombre_ VARCHAR(45)
)
BEGIN
    UPDATE infinite_knowledge.grado_academico SET grado_academico.nombre = nombre_ WHERE grado_academico.grado_academico_id = grado_academico_id_; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_grado_academico_eliminar(
	IN grado_academico_id_ INT
)
BEGIN
    DELETE FROM infinite_knowledge.grado_academico WHERE grado_academico.grado_academico_id = grado_academico_id_; 
END //
DELIMITER ;