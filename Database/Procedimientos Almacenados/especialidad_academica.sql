DROP PROCEDURE IF EXISTS sp_especialidad_academica_insertar;
DROP PROCEDURE IF EXISTS sp_especialidad_academica_listar;
DROP PROCEDURE IF EXISTS sp_especialidad_academica_buscar_por_id;
DROP PROCEDURE IF EXISTS sp_especialidad_academica_buscar_por_nombre;
DROP PROCEDURE IF EXISTS sp_especialidad_academica_actualizar;
DROP PROCEDURE IF EXISTS sp_especialidad_academica_eliminar;

DELIMITER //
CREATE PROCEDURE sp_especialidad_academica_insertar(
	IN nombre_ VARCHAR(45)
)
BEGIN
    INSERT INTO infinite_knowledge.especialidad_academica(nombre) VALUES (nombre_); 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_especialidad_academica_listar(
)
BEGIN
    SELECT especialidad_academica.especialidad_academica_id, especialidad_academica.nombre FROM infinite_knowledge.especialidad_academica ORDER BY especialidad_academica.especialidad_academica_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_especialidad_academica_buscar_por_id(
	IN especialidad_academica_id_ INT(10)
)
BEGIN
    SELECT especialidad_academica.especialidad_academica_id, especialidad_academica.nombre FROM infinite_knowledge.especialidad_academica WHERE especialidad_academica.especialidad_academica_id = especialidad_academica_id_ ORDER BY especialidad_academica.especialidad_academica_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_especialidad_academica_buscar_por_nombre(
	IN nombre_ VARCHAR(45)
)
BEGIN
    SELECT especialidad_academica.especialidad_academica_id, especialidad_academica.nombre  FROM infinite_knowledge.especialidad_academica WHERE especialidad_academica.nombre LIKE nombre_ ORDER BY especialidad_academica.especialidad_academica_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_especialidad_academica_actualizar(
	IN especialidad_academica_id_ INT,
    nombre_ VARCHAR(45)
)
BEGIN
    UPDATE infinite_knowledge.especialidad_academica SET especialidad_academica.nombre = nombre_ WHERE especialidad_academica.especialidad_academica_id = especialidad_academica_id_; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_especialidad_academica_eliminar(
	IN especialidad_academica_id_ INT
)
BEGIN
    DELETE FROM infinite_knowledge.especialidad_academica WHERE especialidad_academica.especialidad_academica_id = especialidad_academica_id_; 
END //
DELIMITER ;