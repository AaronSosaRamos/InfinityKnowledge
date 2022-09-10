DROP PROCEDURE IF EXISTS sp_estudiante_insertar;
DROP PROCEDURE IF EXISTS sp_estudiante_buscar_por_id;
DROP PROCEDURE IF EXISTS sp_estudiante_buscar_por_id_nombre_concatenado;
DROP PROCEDURE IF EXISTS sp_estudiante_buscar_por_dni;
DROP PROCEDURE IF EXISTS sp_estudiante_buscar_por_dni_nombre_concatenado;
DROP PROCEDURE IF EXISTS sp_estudiante_buscar_por_nombre_completo;
DROP PROCEDURE IF EXISTS sp_estudiante_buscar_nombre_completo_por_dni;
DROP PROCEDURE IF EXISTS sp_estudiante_listar;
DROP PROCEDURE IF EXISTS sp_estudiante_eliminar;
DROP PROCEDURE IF EXISTS sp_estudiante_actualizar;

DELIMITER //
CREATE PROCEDURE sp_estudiante_insertar(
	IN dni_ CHAR(8),
    nombre_ VARCHAR(50),
    apellido_paterno_ VARCHAR(50),
    apellido_materno_ VARCHAR(50),
    fecha_nacimiento_ DATE,
    genero_ VARCHAR(6),
    numero_telefonico_ CHAR(9)
)
BEGIN
    INSERT INTO infinite_knowledge.estudiante(dni,nombre,apellido_paterno,apellido_materno,fecha_nacimiento,genero,numero_telefonico) VALUES 
    (dni_,nombre_,apellido_paterno_,apellido_materno_,fecha_nacimiento_,genero_,numero_telefonico_); 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estudiante_buscar_por_id(
	IN estudiante_id_ INT
)
BEGIN
    SELECT estudiante.estudiante_id,estudiante.dni,estudiante.nombre,estudiante.apellido_paterno,estudiante.apellido_materno,
    estudiante.fecha_nacimiento, estudiante.genero, estudiante.numero_telefonico FROM infinite_knowledge.estudiante
    WHERE estudiante.estudiante_id = estudiante_id_; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estudiante_buscar_por_id_nombre_concatenado(
	IN estudiante_id_ INT
)
BEGIN
    SELECT estudiante.estudiante_id,estudiante.dni,CONCAT(estudiante.apellido_paterno,' ',estudiante.apellido_materno,' ',estudiante.nombre) AS 
    nombre_completo, estudiante.fecha_nacimiento, estudiante.genero, estudiante.numero_telefonico FROM infinite_knowledge.estudiante
    WHERE estudiante.estudiante_id = estudiante_id_; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estudiante_buscar_por_dni(
	IN dni_ CHAR(8)
)
BEGIN
    SELECT estudiante.estudiante_id,estudiante.dni,estudiante.nombre,estudiante.apellido_paterno,estudiante.apellido_materno, 
    estudiante.fecha_nacimiento, estudiante.genero, estudiante.numero_telefonico FROM infinite_knowledge.estudiante
    WHERE estudiante.dni = dni_; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estudiante_buscar_por_dni_nombre_concatenado(
	IN dni_ CHAR(8)
)
BEGIN
    SELECT estudiante.estudiante_id,estudiante.dni,CONCAT(estudiante.apellido_paterno,' ',estudiante.apellido_materno,' ',estudiante.nombre) AS 
    nombre_completo, estudiante.fecha_nacimiento, estudiante.genero, estudiante.numero_telefonico FROM infinite_knowledge.estudiante
    WHERE estudiante.dni = dni_; 
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_estudiante_buscar_por_nombre_completo(
	IN nombre_completo_ VARCHAR(152)
)
BEGIN
    SELECT estudiante.estudiante_id,estudiante.dni,CONCAT(estudiante.apellido_paterno,' ',estudiante.apellido_materno,' ',estudiante.nombre) AS 
    nombre_completo, estudiante.fecha_nacimiento, estudiante.genero, estudiante.numero_telefonico FROM infinite_knowledge.estudiante
    WHERE CONCAT(estudiante.apellido_paterno,' ',estudiante.apellido_materno,' ',estudiante.nombre) 
    LIKE CONCAT('%',nombre_completo_,'%') ORDER BY estudiante.estudiante_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estudiante_buscar_nombre_completo_por_dni(
	IN dni_ CHAR(8)
)
BEGIN
    SELECT CONCAT(estudiante.apellido_paterno,' ',estudiante.apellido_materno,' ',estudiante.nombre) AS nombre_completo FROM infinite_knowledge.estudiante WHERE 
    estudiante.dni = dni_; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estudiante_listar(
)
BEGIN
    SELECT estudiante.estudiante_id,estudiante.dni,CONCAT(estudiante.apellido_paterno,' ',estudiante.apellido_materno,' ',estudiante.nombre) AS 
    nombre_completo, estudiante.fecha_nacimiento, estudiante.genero, estudiante.numero_telefonico FROM infinite_knowledge.estudiante ORDER BY estudiante.estudiante_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estudiante_eliminar(
	IN estudiante_id_ INT
)
BEGIN
    DELETE FROM infinite_knowledge.estudiante WHERE estudiante.estudiante_id = estudiante_id_;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estudiante_actualizar(
	IN estudiante_id_ INT,
    dni_ CHAR(8),
    nombre_ VARCHAR(50),
    apellido_paterno_ VARCHAR(50),
    apellido_materno_ VARCHAR(50),
    fecha_nacimiento_ DATE,
    genero_ VARCHAR(6),
    numero_telefonico_ CHAR(9)
)
BEGIN
    UPDATE infinite_knowledge.estudiante SET estudiante.dni=dni_,estudiante.nombre=nombre_,estudiante.apellido_paterno=apellido_paterno_,estudiante.apellido_materno=
    apellido_materno_,estudiante.fecha_nacimiento=fecha_nacimiento_,estudiante.genero=genero_,estudiante.numero_telefonico=numero_telefonico_ WHERE 
    estudiante.estudiante_id = estudiante_id_; 
END //
DELIMITER ;