DROP PROCEDURE IF EXISTS sp_genero_insertar;
DROP PROCEDURE IF EXISTS sp_genero_listar;
DROP PROCEDURE IF EXISTS sp_genero_buscar_por_id;
DROP PROCEDURE IF EXISTS sp_genero_buscar_por_nombre;
DROP PROCEDURE IF EXISTS sp_genero_actualizar;
DROP PROCEDURE IF EXISTS sp_genero_eliminar;

DELIMITER //
CREATE PROCEDURE sp_genero_insertar(
	IN nombre_ VARCHAR(45)
)
BEGIN
    INSERT INTO infinite_knowledge.genero(nombre) VALUES (nombre_); 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_genero_listar(
)
BEGIN
    SELECT genero.genero_id, genero.nombre FROM infinite_knowledge.genero ORDER BY genero.genero_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_genero_buscar_por_id(
	IN genero_id_ INT(10)
)
BEGIN
    SELECT genero.genero_id, genero.nombre FROM infinite_knowledge.genero WHERE genero.genero_id = genero_id_ ORDER BY genero.genero_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_genero_buscar_por_nombre(
	IN nombre_ VARCHAR(45)
)
BEGIN
    SELECT genero.genero_id, genero.nombre  FROM infinite_knowledge.genero WHERE genero.nombre LIKE nombre_ ORDER BY genero.genero_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_genero_actualizar(
	IN genero_id_ INT,
    nombre_ VARCHAR(45)
)
BEGIN
    UPDATE infinite_knowledge.genero SET genero.nombre = nombre_ WHERE genero.genero_id = genero_id_; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_genero_eliminar(
	IN genero_id_ INT
)
BEGIN
    DELETE FROM infinite_knowledge.genero WHERE genero.genero_id = genero_id_; 
END //
DELIMITER ;