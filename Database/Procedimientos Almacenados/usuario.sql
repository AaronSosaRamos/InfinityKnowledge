DROP PROCEDURE IF EXISTS sp_usuario_insertar;
DROP PROCEDURE IF EXISTS sp_usuario_modificar;
DROP PROCEDURE IF EXISTS sp_usuario_eliminar;
DROP PROCEDURE IF EXISTS sp_usuario_listar_por_rol;
DROP PROCEDURE IF EXISTS sp_usuario_realizar_inicio_de_sesión;
DROP PROCEDURE IF EXISTS sp_usuario_contar_usuarios_por_rol;
DROP PROCEDURE IF EXISTS sp_usuario_buscar_correo_por_dni;

DELIMITER //
CREATE PROCEDURE sp_usuario_insertar(
	IN dni_ CHAR(8),
    correo_electronico_ VARCHAR(100),
    contrasenia_ VARCHAR(50),
    rol_ TINYINT
)
BEGIN
    INSERT INTO infinite_knowledge.usuario(usuario.dni,usuario.correo_electronico,usuario.contrasenia,usuario.rol) VALUES (dni_,correo_electronico_,contrasenia_,rol_);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_usuario_modificar(
	IN usuario_id_ INT,
    dni_ CHAR(8),
    correo_electronico_ VARCHAR(100),
    contrasenia_ VARCHAR(50),
    rol_ TINYINT
)
BEGIN
    UPDATE infinite_knowledge.usuario SET usuario.dni=dni_,usuario.correo_electronico = correo_electronico_,usuario.contrasenia = contrasenia_,usuario.rol = rol_ 
    WHERE usuario.usuario_id = usuario_id_;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_usuario_eliminar(
	IN usuario_id_ INT
)
BEGIN
    DELETE FROM infinite_knowledge.usuario WHERE usuario.usuario_id = usuario_id_;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_usuario_listar_por_rol(
	IN rol_ TINYINT
)
BEGIN
    SELECT usuario.usuario_id, usuario.dni, usuario.correo_electronico, usuario.contrasenia, usuario.rol FROM infinite_knowledge.usuario WHERE usuario.rol = rol_ 
    ORDER BY usuario.usuario_id ASC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_usuario_realizar_inicio_de_sesión(
	IN correo_electronico_ VARCHAR(100),
    contrasenia_ VARCHAR(50)
)
BEGIN
    SELECT usuario.usuario_id, usuario.dni, usuario.rol FROM infinite_knowledge.usuario WHERE usuario.correo_electronico = correo_electronico_ AND usuario.contrasenia = 
    contrasenia_;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_usuario_contar_usuarios_por_rol(
	IN rol_ TINYINT
)
BEGIN
    SELECT COUNT(usuario.usuario_id) AS cantidad FROM infinite_knowledge.usuario WHERE usuario.rol = rol_;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_usuario_buscar_correo_por_dni(
	IN dni_ CHAR(8)
)
BEGIN
    SELECT usuario.correo_electronico FROM infinite_knowledge.usuario WHERE usuario.dni = dni_;
END //
DELIMITER ;