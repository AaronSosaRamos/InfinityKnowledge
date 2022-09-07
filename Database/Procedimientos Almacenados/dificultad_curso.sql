DROP PROCEDURE IF EXISTS sp_dificultad_curso_insertar;
DROP PROCEDURE IF EXISTS sp_dificultad_curso_listar;
DROP PROCEDURE IF EXISTS sp_dificultad_curso_buscar_por_id;
DROP PROCEDURE IF EXISTS sp_dificultad_curso_buscar_por_nombre;
DROP PROCEDURE IF EXISTS sp_dificultad_curso_actualizar;
DROP PROCEDURE IF EXISTS sp_dificultad_curso_eliminar;

DELIMITER //
CREATE PROCEDURE sp_dificultad_curso_insertar(
	IN nombre_ VARCHAR(45)
)
BEGIN
    INSERT INTO infinite_knowledge.dificultad_curso(nombre) VALUES (nombre_); 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_dificultad_curso_listar(
)
BEGIN
    SELECT dificultad_curso.dificultad_curso_id, dificultad_curso.nombre FROM infinite_knowledge.dificultad_curso ORDER BY dificultad_curso.dificultad_curso_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_dificultad_curso_buscar_por_id(
	IN dificultad_curso_id_ INT(10)
)
BEGIN
    SELECT dificultad_curso.dificultad_curso_id, dificultad_curso.nombre FROM infinite_knowledge.dificultad_curso WHERE dificultad_curso.dificultad_curso_id = 
    dificultad_curso_id_ ORDER BY dificultad_curso.dificultad_curso_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_dificultad_curso_buscar_por_nombre(
	IN nombre_ VARCHAR(45)
)
BEGIN
    SELECT dificultad_curso.dificultad_curso_id, dificultad_curso.nombre  FROM infinite_knowledge.dificultad_curso WHERE 
    dificultad_curso.nombre LIKE nombre_ ORDER BY dificultad_curso.dificultad_curso_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_dificultad_curso_actualizar(
	IN dificultad_curso_id_ INT,
    nombre_ VARCHAR(45)
)
BEGIN
    UPDATE infinite_knowledge.dificultad_curso SET dificultad_curso.nombre = nombre_ WHERE dificultad_curso.dificultad_curso_id = dificultad_curso_id_; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_dificultad_curso_eliminarr(
	IN dificultad_curso_id_ INT
)
BEGIN
    DELETE FROM infinite_knowledge.dificultad_curso WHERE dificultad_curso.dificultad_curso_id = dificultad_curso_id_; 
END //
DELIMITER ;