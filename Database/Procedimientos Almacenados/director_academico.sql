DROP PROCEDURE IF EXISTS sp_director_academico_insertar;
DROP PROCEDURE IF EXISTS sp_director_academico_buscar_por_id;
DROP PROCEDURE IF EXISTS sp_director_academico_buscar_por_dni;
DROP PROCEDURE IF EXISTS sp_director_academico_buscar_por_nombre_completo;
DROP PROCEDURE IF EXISTS sp_director_academico_buscar_datos_para_email;
DROP PROCEDURE IF EXISTS sp_director_academico_buscar_nombre_completo_por_dni;
DROP PROCEDURE IF EXISTS sp_director_academico_listar;
DROP PROCEDURE IF EXISTS sp_director_academico_eliminar;
DROP PROCEDURE IF EXISTS sp_director_academico_actualizar;
DROP PROCEDURE IF EXISTS sp_director_academico_presentar_cantidad;

DELIMITER //
CREATE PROCEDURE sp_director_academico_insertar(
	IN dni_ CHAR(8),
    nombre_ VARCHAR(50),
    apellido_paterno_ VARCHAR(50),
    apellido_materno_ VARCHAR(50),
    fecha_nacimiento_ DATE,
    anios_labor_ TINYINT,
    genero_id_ INT,
    numero_telefonico_ CHAR(9),
    grado_academico_id_ INT
)
BEGIN
    INSERT INTO infinite_knowledge.director_academico(dni,nombre,apellido_paterno,apellido_materno,fecha_nacimiento,anios_labor,
    genero_id,numero_telefonico,grado_academico_id) VALUES (dni_,nombre_,apellido_paterno_,apellido_materno_,fecha_nacimiento_,anios_labor_,
    genero_id_,numero_telefonico_,grado_academico_id_); 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_director_academico_buscar_por_id(
	IN director_academico_id_ INT
)
BEGIN
    SELECT director_academico.director_academico_id,director_academico.dni, CONCAT(director_academico.apellido_paterno,' ',
    director_academico.apellido_materno,' ',director_academico.nombre) AS nombre_completo,director_academico.fecha_nacimiento,director_academico.anios_labor,
    genero.nombre AS genero,director_academico.numero_telefonico,grado_academico.nombre AS grado_academico FROM (infinite_knowledge.director_academico 
    INNER JOIN infinite_knowledge.genero ON director_academico.genero_id = genero.genero_id) INNER JOIN infinite_knowledge.grado_academico ON 
    director_academico.grado_academico_id = grado_academico.grado_academico_id WHERE director_academico.director_academico_id = director_academico_id_ 
    ORDER BY director_academico.director_academico_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_director_academico_buscar_por_dni(
	IN dni_ CHAR(8)
)
BEGIN
    SELECT director_academico.director_academico_id,director_academico.dni, CONCAT(director_academico.apellido_paterno,' ',
    director_academico.apellido_materno,' ',director_academico.nombre) AS nombre_completo,director_academico.fecha_nacimiento,director_academico.anios_labor,genero.nombre 
    AS genero,director_academico.numero_telefonico,grado_academico.nombre AS grado_academico FROM (infinite_knowledge.director_academico INNER JOIN infinite_knowledge.genero 
    ON director_academico.genero_id = genero.genero_id) INNER JOIN infinite_knowledge.grado_academico ON director_academico.grado_academico_id = 
    grado_academico.grado_academico_id WHERE director_academico.dni = dni_ ORDER BY director_academico.director_academico_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_director_academico_buscar_por_nombre_completo(
	IN nombre_completo_ VARCHAR(152)
)
BEGIN
    SELECT director_academico.director_academico_id,director_academico.dni, CONCAT(director_academico.apellido_paterno,' ',director_academico.apellido_materno,' ',
    director_academico.nombre) AS nombre_completo,director_academico.fecha_nacimiento,director_academico.anios_labor,genero.nombre AS 
    genero,director_academico.numero_telefonico,grado_academico.nombre AS grado_academico FROM (infinite_knowledge.director_academico INNER JOIN 
    infinite_knowledge.genero ON director_academico.genero_id = genero.genero_id) INNER JOIN infinite_knowledge.grado_academico ON director_academico.grado_academico_id =
    grado_academico.grado_academico_id WHERE CONCAT(director_academico.apellido_paterno,' ',director_academico.apellido_materno,' ',director_academico.nombre)
    LIKE CONCAT('%',nombre_completo_,'%') ORDER BY director_academico.director_academico_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_director_academico_buscar_datos_para_email(
)
BEGIN
    SELECT director_academico.director_academico_id,director_academico.dni, CONCAT(director_academico.apellido_paterno,' ',director_academico.apellido_materno,' ',
    director_academico.nombre) AS nombre_completo FROM infinite_knowledge.director_academico WHERE director_academico.director_academico_id = LAST_INSERT_ID() ORDER BY
    director_academico.director_academico_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_director_academico_buscar_nombre_completo_por_dni(
	IN dni_ CHAR(8)
)
BEGIN
    SELECT CONCAT(director_academico.apellido_paterno,' ',director_academico.apellido_materno,' ',director_academico.nombre) AS nombre_completo 
    FROM infinite_knowledge.director_academico WHERE director_academico.dni = dni_ ORDER BY director_academico.director_academico_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_director_academico_listar(
)
BEGIN
    SELECT director_academico.director_academico_id,director_academico.dni, CONCAT(director_academico.apellido_paterno,' ',director_academico.apellido_materno,' ',
    director_academico.nombre) AS nombre_completo,director_academico.fecha_nacimiento,director_academico.anios_labor,genero.nombre AS 
    genero,director_academico.numero_telefonico,grado_academico.nombre AS grado_academico FROM (infinite_knowledge.director_academico INNER JOIN infinite_knowledge.genero 
    ON director_academico.genero_id = genero.genero_id) INNER JOIN infinite_knowledge.grado_academico ON director_academico.grado_academico_id = 
    grado_academico.grado_academico_id WHERE director_academico.director_academico_id = LAST_INSERT_ID() ORDER BY director_academico.director_academico_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_director_academico_eliminar(
)
BEGIN
    DELETE FROM infinite_knowledge.director_academico WHERE director_academico.director_academico_id = LAST_INSERT_ID(); 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_director_academico_actualizar(
	IN dni_ CHAR(8),
    nombre_ VARCHAR(50),
    apellido_paterno_ VARCHAR(50),
    apellido_materno_ VARCHAR(50),
    fecha_nacimiento_ DATE,
    anios_labor_ TINYINT,
    genero_id_ INT,
    numero_telefonico_ CHAR(9),
    grado_academico_id_ INT
)
BEGIN
    UPDATE infinite_knowledge.director_academico SET director_academico.dni = dni_, director_academico.nombre = nombre_,director_academico.apellido_paterno = 
    apellido_paterno_,director_academico.apellido_materno = apellido_materno_,director_academico.fecha_nacimiento = fecha_nacimiento_,director_academico.anios_labor = 
    anios_labor_,director_academico.genero_id = genero_id_,director_academico.numero_telefonico = numero_telefonico_,director_academico.grado_academico_id = 
    grado_academico_id_ WHERE director_academico.director_academico_id = LAST_INSERT_ID();
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_director_academico_presentar_cantidad(
)
BEGIN
    SELECT COUNT(director_academico.director_academico_id) AS cantidad FROM infinite_knowledge.director_academico;
END //
DELIMITER ;