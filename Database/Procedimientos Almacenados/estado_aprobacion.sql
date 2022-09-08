DROP PROCEDURE IF EXISTS sp_estado_aprobacion_insertar;
DROP PROCEDURE IF EXISTS sp_estado_aprobacion_listar;
DROP PROCEDURE IF EXISTS sp_estado_aprobacion_buscar_por_id;
DROP PROCEDURE IF EXISTS sp_estado_aprobacion_buscar_por_nombre;
DROP PROCEDURE IF EXISTS sp_estado_aprobacion_actualizar;
DROP PROCEDURE IF EXISTS sp_estado_aprobacion_eliminar;

DELIMITER //
CREATE PROCEDURE sp_estado_aprobacion_insertar(
	IN nombre_ VARCHAR(45)
)
BEGIN
    INSERT INTO infinite_knowledge.estado_aprobacion(nombre) VALUES (nombre_); 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estado_aprobacion_listar(
)
BEGIN
    SELECT estado_aprobacion.estado_aprobacion_id, estado_aprobacion.nombre FROM infinite_knowledge.estado_aprobacion ORDER BY estado_aprobacion.estado_aprobacion_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estado_aprobacion_buscar_por_id(
	IN estado_aprobacion_id_ INT(10)
)
BEGIN
    SELECT estado_aprobacion.estado_aprobacion_id, estado_aprobacion.nombre FROM infinite_knowledge.estado_aprobacion WHERE estado_aprobacion.estado_aprobacion_id = 
    estado_aprobacion_id_ ORDER BY estado_aprobacion.estado_aprobacion_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estado_aprobacion_buscar_por_nombre(
	IN nombre_ VARCHAR(45)
)
BEGIN
    SELECT estado_aprobacion.estado_aprobacion_id, estado_aprobacion.nombre  FROM infinite_knowledge.estado_aprobacion WHERE estado_aprobacion.nombre LIKE nombre_ 
    ORDER BY estado_aprobacion.estado_aprobacion_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estado_aprobacion_actualizar(
	IN estado_aprobacion_id_ INT,
    nombre_ VARCHAR(45)
)
BEGIN
    UPDATE infinite_knowledge.estado_aprobacion SET estado_aprobacion.nombre = nombre_ WHERE estado_aprobacion.estado_aprobacion_id = estado_aprobacion_id_; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estado_aprobacion_eliminar(
	IN estado_aprobacion_id_ INT
)
BEGIN
    DELETE FROM infinite_knowledge.estado_aprobacion WHERE estado_aprobacion.estado_aprobacion_id = estado_aprobacion_id_; 
END //
DELIMITER ;