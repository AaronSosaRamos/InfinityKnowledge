DROP PROCEDURE IF EXISTS sp_nivel_academico_insertar;
DROP PROCEDURE IF EXISTS sp_nivel_academico_listar;
DROP PROCEDURE IF EXISTS sp_nivel_academico_buscar_por_id;
DROP PROCEDURE IF EXISTS sp_nivel_academico_buscar_por_nombre;
DROP PROCEDURE IF EXISTS sp_nivel_academico_actualizar;
DROP PROCEDURE IF EXISTS sp_nivel_academico_eliminar;

DELIMITER //
CREATE PROCEDURE sp_nivel_academico_insertar(
	IN nombre_ VARCHAR(45)
)
BEGIN
    INSERT INTO infinite_knowledge.nivel_academico(nombre) VALUES (nombre_); 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_nivel_academico_listar(
)
BEGIN
    SELECT nivel_academico.nivel_academico_id, nivel_academico.nombre FROM infinite_knowledge.nivel_academico ORDER BY nivel_academico.nivel_academico_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_nivel_academico_buscar_por_id(
	IN nivel_academico_id_ INT(10)
)
BEGIN
    SELECT nivel_academico.nivel_academico_id, nivel_academico.nombre FROM infinite_knowledge.nivel_academico WHERE nivel_academico.nivel_academico_id = 
    nivel_academico_id_ ORDER BY nivel_academico.nivel_academico_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_nivel_academico_buscar_por_nombre(
	IN nombre_ VARCHAR(45)
)
BEGIN
    SELECT nivel_academico.nivel_academico_id, nivel_academico.nombre  FROM infinite_knowledge.nivel_academico WHERE nivel_academico.nombre LIKE nombre_ 
    ORDER BY nivel_academico.nivel_academico_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_nivel_academico_actualizar(
	IN nivel_academico_id_ INT,
    nombre_ VARCHAR(45)
)
BEGIN
    UPDATE infinite_knowledge.nivel_academico SET nivel_academico.nombre = nombre_ WHERE nivel_academico.nivel_academico_id = nivel_academico_id_; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_nivel_academico_eliminar(
	IN nivel_academico_id_ INT
)
BEGIN
    DELETE FROM infinite_knowledge.nivel_academico WHERE nivel_academico.nivel_academico_id = nivel_academico_id_; 
END //
DELIMITER ;