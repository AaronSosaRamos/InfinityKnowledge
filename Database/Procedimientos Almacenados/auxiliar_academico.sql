DROP PROCEDURE IF EXISTS sp_auxiliar_academico_insertar;
DROP PROCEDURE IF EXISTS sp_auxiliar_academico_buscar_por_id;
DROP PROCEDURE IF EXISTS sp_auxiliar_academico_buscar_por_id_nombre_concatenado;
DROP PROCEDURE IF EXISTS sp_auxiliar_academico_buscar_por_dni;
DROP PROCEDURE IF EXISTS sp_auxiliar_academico_buscar_por_dni_nombre_concatenado;
DROP PROCEDURE IF EXISTS sp_auxiliar_academico_buscar_por_nombre_completo;
DROP PROCEDURE IF EXISTS sp_auxiliar_academico_buscar_datos_para_email;
DROP PROCEDURE IF EXISTS sp_auxiliar_academico_buscar_nombre_completo;
DROP PROCEDURE IF EXISTS sp_auxiliar_academico_eliminar;
DROP PROCEDURE IF EXISTS sp_auxiliar_academico_actualizar;
DROP PROCEDURE IF EXISTS sp_auxiliar_academico_presentar_cantidad;

DELIMITER //
CREATE PROCEDURE sp_auxiliar_academico_insertar(
	IN dni_ CHAR(8),
    nombre_ VARCHAR(50),
    apellido_paterno_ VARCHAR(50),
    apellido_materno_ VARCHAR(50),
    fecha_nacimiento_ DATE,
    n_docentes_a_cargo_ TINYINT,
    genero_ VARCHAR(6),
    numero_telefonico_ CHAR(9),
    grado_academico_ VARCHAR(40)
)
BEGIN
    INSERT INTO infinite_knowledge.auxiliar_academico(dni,nombre,apellido_paterno,apellido_materno,fecha_nacimiento,
    n_docentes_a_cargo,genero,numero_telefonico,grado_academico) VALUES (dni_,nombre_,apellido_paterno_,apellido_materno_,
    fecha_nacimiento_,n_docentes_a_cargo_,genero_,numero_telefonico_,grado_academico_); 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_auxiliar_academico_buscar_por_id(
)
BEGIN
    SELECT auxiliar_academico.auxiliar_academico_id,auxiliar_academico.dni, auxiliar_academico.nombre, auxiliar_academico.apellido_paterno, auxiliar_academico.apellido_materno,
    auxiliar_academico.fecha_nacimiento,
    auxiliar_academico.n_docentes_a_cargo,auxiliar_academico.genero,auxiliar_academico.numero_telefonico,auxiliar_academico.grado_academico 
    FROM infinite_knowledge.auxiliar_academico
    WHERE auxiliar_academico.auxiliar_academico_id = LAST_INSERT_ID(); 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_auxiliar_academico_buscar_por_id_nombre_concatenado(
)
BEGIN
    SELECT auxiliar_academico.auxiliar_academico_id,auxiliar_academico.dni, CONCAT(auxiliar_academico.apellido_paterno,' '
    ,auxiliar_academico.apellido_materno,' ',auxiliar_academico.nombre) AS nombre_completo,auxiliar_academico.fecha_nacimiento,
    auxiliar_academico.n_docentes_a_cargo,auxiliar_academico.genero,auxiliar_academico.numero_telefonico,auxiliar_academico.grado_academico 
    FROM infinite_knowledge.auxiliar_academico
    WHERE auxiliar_academico.auxiliar_academico_id = LAST_INSERT_ID(); 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_auxiliar_academico_buscar_por_dni(
	IN dni_ CHAR(8)
)
BEGIN
    SELECT auxiliar_academico.auxiliar_academico_id,auxiliar_academico.dni, auxiliar_academico.nombre, auxiliar_academico.apellido_paterno, auxiliar_academico.apellido_materno,
    auxiliar_academico.fecha_nacimiento,
    auxiliar_academico.n_docentes_a_cargo,auxiliar_academico.genero,auxiliar_academico.numero_telefonico,auxiliar_academico.grado_academico 
    FROM infinite_knowledge.auxiliar_academico
    WHERE auxiliar_academico.dni = dni_; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_auxiliar_academico_buscar_por_dni_nombre_concatenado(
	IN dni_ CHAR(8)
)
BEGIN
    SELECT auxiliar_academico.auxiliar_academico_id,auxiliar_academico.dni, CONCAT(auxiliar_academico.apellido_paterno,' '
    ,auxiliar_academico.apellido_materno,' ',auxiliar_academico.nombre) AS nombre_completo,auxiliar_academico.fecha_nacimiento,
    auxiliar_academico.n_docentes_a_cargo,auxiliar_academico.genero,auxiliar_academico.numero_telefonico,auxiliar_academico.grado_academico 
    FROM infinite_knowledge.auxiliar_academico
    WHERE auxiliar_academico.dni = dni_; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_auxiliar_academico_buscar_por_nombre_completo(
	IN nombre_completo_ VARCHAR(152)
)
BEGIN
	SELECT auxiliar_academico.auxiliar_academico_id,auxiliar_academico.dni, CONCAT(auxiliar_academico.apellido_paterno,' '
    ,auxiliar_academico.apellido_materno,' ',auxiliar_academico.nombre) AS nombre_completo,auxiliar_academico.fecha_nacimiento,
    auxiliar_academico.n_docentes_a_cargo,auxiliar_academico.genero,auxiliar_academico.numero_telefonico,auxiliar_academico.grado_academico 
    FROM infinite_knowledge.auxiliar_academico
    WHERE CONCAT(auxiliar_academico.apellido_paterno,' ' ,auxiliar_academico.apellido_materno,' ',auxiliar_academico.nombre) 
    LIKE CONCAT('%',nombre_completo_,'%'); 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_auxiliar_academico_buscar_datos_para_email(
)
BEGIN
    SELECT auxiliar_academico.auxiliar_academico_id,auxiliar_academico.dni, 
    CONCAT(auxiliar_academico.apellido_paterno,' ',auxiliar_academico.apellido_materno,' ',auxiliar_academico.nombre) 
    AS nombre_completo FROM infinite_knowledge.auxiliar_academico WHERE auxiliar_academico.auxiliar_academico_id = LAST_INSERT_ID(); 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_auxiliar_academico_buscar_nombre_completo(
)
BEGIN
    SELECT CONCAT(auxiliar_academico.apellido_paterno,' ',auxiliar_academico.apellido_materno,' ',auxiliar_academico.nombre) 
    AS nombre_completo FROM infinite_knowledge.auxiliar_academico WHERE auxiliar_academico.auxiliar_academico_id = LAST_INSERT_ID(); 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_auxiliar_academico_eliminar(
)
BEGIN
    DELETE FROM infinite_knowledge.auxiliar_academico WHERE auxiliar_academico.auxiliar_academico_id = LAST_INSERT_ID(); 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_auxiliar_academico_actualizar(
	IN dni_ CHAR(8),
    nombre_ VARCHAR(50),
    apellido_paterno_ VARCHAR(50),
    apellido_materno_ VARCHAR(50),
    fecha_nacimiento_ DATE,
    n_docentes_a_cargo_ TINYINT,
    genero_ VARCHAR(6),
    numero_telefonico_ CHAR(9),
    grado_academico_ VARCHAR(40)
)
BEGIN
    UPDATE infinite_knowledge.auxiliar_academico SET auxiliar_academico.dni = dni_, auxiliar_academico.nombre = nombre_,auxiliar_academico.apellido_paterno = 
    apellido_paterno_,auxiliar_academico.apellido_materno = apellido_materno_,auxiliar_academico.fecha_nacimiento = fecha_nacimiento_,auxiliar_academico.n_docentes_a_cargo 
    = n_docentes_a_cargo_,auxiliar_academico.genero = genero_,auxiliar_academico.numero_telefonico = numero_telefonico_,auxiliar_academico.grado_academico = 
    grado_academico_ WHERE auxiliar_academico.auxiliar_academico_id = LAST_INSERT_ID();
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_auxiliar_academico_presentar_cantidad(
)
BEGIN
    SELECT COUNT(auxiliar_academico.auxiliar_academico_id) AS cantidad FROM infinite_knowledge.auxiliar_academico;
END //