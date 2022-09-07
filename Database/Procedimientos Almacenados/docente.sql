DROP PROCEDURE IF EXISTS sp_docente_insertar;
DROP PROCEDURE IF EXISTS sp_docente_buscar_por_id;
DROP PROCEDURE IF EXISTS sp_docente_buscar_por_dni;
DROP PROCEDURE IF EXISTS sp_docente_buscar_por_nombre_completo;
DROP PROCEDURE IF EXISTS sp_docente_buscar_por_grado_academico;
DROP PROCEDURE IF EXISTS sp_docente_buscar_por_especialidad_academica;
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
    genero_id_ INT,
    numero_telefonico_ CHAR(9),
    grado_academico_id_ INT,
    especialidad_academica_id_ INT
)
BEGIN
    INSERT INTO infinite_knowledge.docente(dni,nombre,apellido_paterno,apellido_materno,fecha_nacimiento,genero_id,numero_telefonico,grado_academico_id,
    especialidad_academica_id) VALUES (dni_,nombre_,apellido_paterno_,apellido_materno_,fecha_nacimiento_,genero_id_,numero_telefonico_,grado_academico_id_,
    especialidad_academica_id_); 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_docente_buscar_por_id(
	IN docente_id_ INT
)
BEGIN
    SELECT docente.docente_id,docente.dni,CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS 
    nombre_completo, docente.fecha_nacimiento, genero.nombre as genero, docente.numero_telefonico, grado_academico.nombre AS
    grado_academico, especialidad_academica.nombre AS especialidad_academica FROM ((infinite_knowledge.docente INNER JOIN infinite_knowledge.genero 
    ON docente.genero_id = genero.genero_id) INNER JOIN infinite_knowledge.grado_academico ON docente.grado_academico_id = grado_academico.grado_academico_id) 
    INNER JOIN infinite_knowledge.especialidad_academica ON docente.especialidad_academica_id = especialidad_academica.especialidad_academica_id WHERE 
    docente.docente_id = docente_id_ ORDER BY docente.docente_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_docente_buscar_por_dni(
	IN dni_ CHAR(8)
)
BEGIN
    SELECT docente.docente_id,docente.dni,CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS nombre_completo, 
    docente.fecha_nacimiento, genero.nombre as genero, docente.numero_telefonico, grado_academico.nombre AS grado_academico, especialidad_academica.nombre AS 
    especialidad_academica FROM ((infinite_knowledge.docente INNER JOIN infinite_knowledge.genero ON docente.genero_id = genero.genero_id) INNER JOIN 
    infinite_knowledge.grado_academico ON docente.grado_academico_id = grado_academico.grado_academico_id) INNER JOIN infinite_knowledge.especialidad_academica ON
    docente.especialidad_academica_id = especialidad_academica.especialidad_academica_id WHERE docente.dni = dni_ ORDER BY docente.docente_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_docente_buscar_por_nombre_completo(
	IN nombre_completo_ VARCHAR(152)
)
BEGIN
    SELECT docente.docente_id,docente.dni,CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS nombre_completo, docente.fecha_nacimiento,
    genero.nombre as genero, docente.numero_telefonico, grado_academico.nombre AS grado_academico, especialidad_academica.nombre AS especialidad_academica FROM 
    ((infinite_knowledge.docente INNER JOIN infinite_knowledge.genero ON docente.genero_id = genero.genero_id) INNER JOIN infinite_knowledge.grado_academico ON 
    docente.grado_academico_id = grado_academico.grado_academico_id) INNER JOIN infinite_knowledge.especialidad_academica ON docente.especialidad_academica_id = 
    especialidad_academica.especialidad_academica_id WHERE CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) LIKE 
    CONCAT('%',nombre_completo_,'%') ORDER BY docente.docente_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_docente_buscar_por_grado_academico(
	IN grado_academico_id_ INT
)
BEGIN
    SELECT docente.docente_id,docente.dni,CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS nombre_completo, docente.fecha_nacimiento,
    genero.nombre as genero, docente.numero_telefonico, grado_academico.nombre AS grado_academico, especialidad_academica.nombre AS especialidad_academica FROM 
    ((infinite_knowledge.docente INNER JOIN infinite_knowledge.genero ON docente.genero_id = genero.genero_id) INNER JOIN infinite_knowledge.grado_academico ON
    docente.grado_academico_id = grado_academico.grado_academico_id) INNER JOIN infinite_knowledge.especialidad_academica ON docente.especialidad_academica_id = 
    especialidad_academica.especialidad_academica_id WHERE docente.grado_academico_id = grado_academico_id_ ORDER BY docente.docente_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_docente_buscar_por_especialidad_academica(
	IN especialidad_academica_id_ INT
)
BEGIN
    SELECT docente.docente_id,docente.dni,CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS nombre_completo, docente.fecha_nacimiento,
    genero.nombre as genero, docente.numero_telefonico, grado_academico.nombre AS grado_academico, especialidad_academica.nombre AS especialidad_academica FROM 
    ((infinite_knowledge.docente INNER JOIN infinite_knowledge.genero ON docente.genero_id = genero.genero_id) INNER JOIN infinite_knowledge.grado_academico ON 
    docente.grado_academico_id = grado_academico.grado_academico_id) INNER JOIN infinite_knowledge.especialidad_academica ON docente.especialidad_academica_id = 
    especialidad_academica.especialidad_academica_id WHERE docente.especialidad_academica_id = especialidad_academica_id_ ORDER BY docente.docente_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_docente_buscar_datos_para_email(
	IN docente_id_ INT
)
BEGIN
    SELECT docente.docente_id,docente.dni,CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS nombre_completo WHERE docente.docente_id = 
    docente_id_ ORDER BY docente.docente_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_docente_buscar_datos_para_informe_de_verificacion(
	IN docente_id_ INT
)
BEGIN
    SELECT docente.docente_id,docente.dni,CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS nombre_completo,grado_academico.nombre AS 
    grado_academico,especialidad_academica.nombre AS especialidad_academica FROM (infinite_knowledge.docente INNER JOIN infinite_knowledge.grado_academico ON 
    docente.grado_academico_id = grado_academico.grado_academico_id) INNER JOIN infinite_knowledge.especialidad_academica ON docente.especialidad_academica_id = 
    especialidad_academica.especialidad_academica_id WHERE docente.docente_id = docente_id_ ORDER BY docente.docente_id ASC; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_docente_buscar_nombre_completo_por_dni(
	IN dni_ CHAR(8)
)
BEGIN
    SELECT CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS nombre_completo FROM infinite_knowledge.docente WHERE docente.dni = dni_ 
    ORDER BY docente.docente_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_docente_listar(
)
BEGIN
    SELECT docente.docente_id,docente.dni,CONCAT(docente.apellido_paterno,' ',docente.apellido_materno,' ',docente.nombre) AS nombre_completo, docente.fecha_nacimiento,
    genero.nombre as genero, docente.numero_telefonico, grado_academico.nombre AS grado_academico, especialidad_academica.nombre AS especialidad_academica FROM 
    ((infinite_knowledge.docente INNER JOIN infinite_knowledge.genero ON docente.genero_id = genero.genero_id) INNER JOIN infinite_knowledge.grado_academico ON 
    docente.grado_academico_id = grado_academico.grado_academico_id) INNER JOIN infinite_knowledge.especialidad_academica ON docente.especialidad_academica_id = 
    especialidad_academica.especialidad_academica_id ORDER BY docente.docente_id ASC; 
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
    genero_id_ INT,
    numero_telefonico_ CHAR(9),
    grado_academico_id_ INT,
    especialidad_academica_id_ INT
)
BEGIN
    UPDATE infinite_knowledge.docente SET docente.dni=dni_,docente.nombre=nombre_,docente.apellido_paterno=apellido_paterno_,docente.apellido_materno=apellido_materno_,
    docente.fecha_nacimiento=fecha_nacimiento_,docente.genero_id=genero_id_, docente.numero_telefonico=numero_telefonico_,docente.grado_academico_id=grado_academico_id_,
    docente.especialidad_academica_id=especialidad_academica_id_ WHERE docente.docente_id = docente_id_; 
END //
DELIMITER ;