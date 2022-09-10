DROP TRIGGER IF EXISTS t_auxiliar_academico_eliminar_bd;

DELIMITER //
CREATE TRIGGER t_auxiliar_academico_eliminar_bd BEFORE DELETE ON infinite_knowledge.auxiliar_academico FOR EACH ROW
BEGIN 
	DELETE FROM infinite_knowledge.usuario WHERE usuario.dni = OLD.dni;
END //
DELIMITER ;