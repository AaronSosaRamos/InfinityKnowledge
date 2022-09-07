DROP PROCEDURE IF EXISTS sp_estudiante_insertar;
DROP PROCEDURE IF EXISTS sp_estudiante_buscar_por_id;
DROP PROCEDURE IF EXISTS sp_estudiante_buscar_por_dni;
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
    genero_id_ INT,
    numero_telefonico_ CHAR(9)
)
BEGIN
    INSERT INTO infinite_knowledge.estudiante(dni,nombre,apellido_paterno,apellido_materno,fecha_nacimiento,genero_id,numero_telefonico) VALUES (dni_,nombre_,apellido_paterno_,apellido_materno_,fecha_nacimiento_,genero_id_,numero_telefonico_); 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estudiante_buscar_por_id(
	IN estudiante_id_ INT
)
BEGIN
    SELECT estudiante.estudiante_id,estudiante.dni,CONCAT(estudiante.apellido_paterno,' ',estudiante.apellido_materno,' ',estudiante.nombre) AS nombre_completo, estudiante.fecha_nacimiento, genero.nombre as genero, estudiante.numero_telefonico FROM infinite_knowledge.estudiante INNER JOIN infinite_knowledge.genero ON estudiante.genero_id = genero.genero_id WHERE estudiante.estudiante_id = estudiante_id_ ORDER BY estudiante.estudiante_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estudiante_buscar_por_dni(
	IN dni_ CHAR(8)
)
BEGIN
    SELECT estudiante.estudiante_id,estudiante.dni,CONCAT(estudiante.apellido_paterno,' ',estudiante.apellido_materno,' ',estudiante.nombre) AS nombre_completo, estudiante.fecha_nacimiento, genero.nombre as genero, estudiante.numero_telefonico FROM infinite_knowledge.estudiante INNER JOIN infinite_knowledge.genero ON estudiante.genero_id = genero.genero_id WHERE estudiante.dni = dni_ ORDER BY estudiante.estudiante_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estudiante_buscar_por_nombre_completo(
	IN nombre_completo_ VARCHAR(152)
)
BEGIN
    SELECT estudiante.estudiante_id,estudiante.dni,CONCAT(estudiante.apellido_paterno,' ',estudiante.apellido_materno,' ',estudiante.nombre) AS nombre_completo, estudiante.fecha_nacimiento, genero.nombre as genero, estudiante.numero_telefonico FROM infinite_knowledge.estudiante INNER JOIN infinite_knowledge.genero ON estudiante.genero_id = genero.genero_id WHERE CONCAT(estudiante.apellido_paterno,' ',estudiante.apellido_materno,' ',estudiante.nombre) LIKE CONCAT('%',nombre_completo_,'%') ORDER BY estudiante.estudiante_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estudiante_buscar_nombre_completo_por_dni(
	IN dni_ CHAR(8)
)
BEGIN
    SELECT CONCAT(estudiante.apellido_paterno,' ',estudiante.apellido_materno,' ',estudiante.nombre) AS nombre_completo FROM infinite_knowledge.estudiante WHERE estudiante.dni = dni_ ORDER BY estudiante.estudiante_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estudiante_listar(
)
BEGIN
    SELECT estudiante.estudiante_id,estudiante.dni,CONCAT(estudiante.apellido_paterno,' ',estudiante.apellido_materno,' ',estudiante.nombre) AS nombre_completo, estudiante.fecha_nacimiento, genero.nombre as genero, estudiante.numero_telefonico FROM infinite_knowledge.estudiante INNER JOIN infinite_knowledge.genero ON estudiante.genero_id = genero.genero_id ORDER BY estudiante.estudiante_id ASC; 
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
    genero_id_ INT,
    numero_telefonico_ CHAR(9)
)
BEGIN
    UPDATE infinite_knowledge.estudiante SET estudiante.dni=dni_,estudiante.nombre=nombre_,estudiante.apellido_paterno=apellido_paterno_,estudiante.apellido_materno=apellido_materno_,estudiante.fecha_nacimiento=fecha_nacimiento_,estudiante.genero_id=genero_id_,estudiante.numero_telefonico=numero_telefonico_ WHERE estudiante.estudiante_id = estudiante_id_; 
END //
DELIMITER ;