DROP PROCEDURE IF EXISTS sp_docente_insertar;
DROP PROCEDURE IF EXISTS sp_docente_buscar_por_id;
DROP PROCEDURE IF EXISTS sp_docente_buscar_por_id_nombre_concatenado;
DROP PROCEDURE IF EXISTS sp_docente_buscar_por_dni;
DROP PROCEDURE IF EXISTS sp_docente_buscar_por_dni_nombre_concatenado;
DROP PROCEDURE IF EXISTS sp_docente_buscar_por_nombre_completo;
DROP PROCEDURE IF EXISTS sp_docente_buscar_datos_para_email;
DROP PROCEDURE IF EXISTS sp_docente_buscar_datos_para_informe_de_verificacion;
DROP PROCEDURE IF EXISTS sp_docente_buscar_nombre_completo_por_dni;
DROP PROCEDURE IF EXISTS sp_docente_listar;
DROP PROCEDURE IF EXISTS sp_docente_eliminar;
DROP PROCEDURE IF EXISTS sp_docente_actualizar;

DELIMITER //
CREATE PROCEDURE sp_docente_insertar(
	IN dni_ CHAR(8),
    nombre_ VARCHAR(50),
    apellido_paterno_ VARCHAR(50),
    apellido_materno_ VARCHAR(50),
    fecha_nacimiento_ DATE,
    genero_ VARCHAR(6),
    numero_telefonico_ CHAR(9),
    grado_academico_ VARCHAR(40),
    especialidad_academica_ VARCHAR(40)
)
BEGIN
    INSERT INTO infinite_knowledge.docente(dni,nombre,apellido_paterno,apellido_materno,fecha_nacimiento,genero,numero_telefonico,grado_academico,
    especialidad_academica) VALUES (dni_,nombre_,apellido_paterno_,apellido_materno_,fecha_nacimiento_,genero_,numero_telefonico_,grado_academico_,
    especialidad_academica_); 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_docente_buscar_por_id(
	IN docente_id_ INT
)
BEGIN
    SELECT docente.docente_id,docente.dni,docente.nombre,docente.apellido_paterno,docente.apellido_materno,
    docente.fecha_nacimiento, docente.genero, docente.numero_telefonico, docente.grado_academico, docente.especialidad_academica FROM infinite_knowledge.docente WHERE 
    docente.docente_id = docente_id_; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_docente_buscar_por_id_nombre_concatenado(
	IN docente_id_ INT
)
BEGIN
    SELECT docente.docente_id,docente.dni,CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS 
    nombre_completo, docente.fecha_nacimiento, docente.genero, docente.numero_telefonico, docente.grado_academico, docente.especialidad_academica FROM infinite_knowledge.docente WHERE 
    docente.docente_id = docente_id_; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_docente_buscar_por_dni(
	IN dni_ CHAR(8)
)
BEGIN
    SELECT docente.docente_id,docente.dni,docente.nombre,docente.apellido_paterno,docente.apellido_materno, 
    docente.fecha_nacimiento, docente.genero, docente.numero_telefonico, docente.grado_academico, docente.especialidad_academica FROM infinite_knowledge.docente WHERE 
    docente.dni = dni_; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_docente_buscar_por_dni_nombre_concatenado(
	IN dni_ CHAR(8)
)
BEGIN
	SELECT docente.docente_id,docente.dni,CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS 
    nombre_completo, docente.fecha_nacimiento, docente.genero, docente.numero_telefonico, docente.grado_academico, docente.especialidad_academica FROM infinite_knowledge.docente WHERE 
    docente.dni = dni_; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_docente_buscar_por_nombre_completo(
	IN nombre_completo_ VARCHAR(152)
)
BEGIN
	SELECT docente.docente_id,docente.dni,CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS 
    nombre_completo, docente.fecha_nacimiento, docente.genero, docente.numero_telefonico, docente.grado_academico, docente.especialidad_academica FROM infinite_knowledge.docente 
    WHERE CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) LIKE 
    CONCAT('%',nombre_completo_,'%') ORDER BY docente.docente_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_docente_buscar_datos_para_email(
	IN docente_id_ INT
)
BEGIN
    SELECT docente.docente_id,docente.dni,CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS nombre_completo WHERE docente.docente_id = 
    docente_id_; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_docente_buscar_datos_para_informe_de_verificacion(
	IN docente_id_ INT
)
BEGIN
    SELECT docente.docente_id,docente.dni,CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS nombre_completo,docente.grado_academico,
    docente.especialidad_academica FROM infinite_knowledge.docente WHERE docente.docente_id = docente_id_; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_docente_buscar_nombre_completo_por_dni(
	IN dni_ CHAR(8)
)
BEGIN
    SELECT CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS nombre_completo FROM infinite_knowledge.docente WHERE docente.dni = dni_;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_docente_listar(
)
BEGIN
	SELECT docente.docente_id,docente.dni,CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS 
    nombre_completo, docente.fecha_nacimiento, docente.genero, docente.numero_telefonico, docente.grado_academico, docente.especialidad_academica FROM infinite_knowledge.docente 
    ORDER BY docente.docente_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_docente_eliminar(
	IN docente_id_ INT
)
BEGIN
    DELETE FROM infinite_knowledge.docente WHERE docente.docente_id = docente_id_;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_docente_actualizar(
	IN docente_id_ INT,
    dni_ CHAR(8),
    nombre_ VARCHAR(50),
    apellido_paterno_ VARCHAR(50),
    apellido_materno_ VARCHAR(50),
    fecha_nacimiento_ DATE,
    genero_ VARCHAR(6),
    numero_telefonico_ CHAR(9),
    grado_academico_ VARCHAR(40),
    especialidad_academica_ VARCHAR(40)
)
BEGIN
    UPDATE infinite_knowledge.docente SET docente.dni=dni_,docente.nombre=nombre_,docente.apellido_paterno=apellido_paterno_,docente.apellido_materno=apellido_materno_,
    docente.fecha_nacimiento=fecha_nacimiento_,docente.genero=genero_, docente.numero_telefonico=numero_telefonico_,docente.grado_academico=grado_academico_,
    docente.especialidad_academica=especialidad_academica_ WHERE docente.docente_id = docente_id_; 
END //
DELIMITER ;