DROP TRIGGER IF EXISTS docente_eliminar_bd;

DELIMITER //
CREATE TRIGGER docente_eliminar_bd BEFORE DELETE ON infinite_knowledge.docente FOR EACH ROW
BEGIN 
	DELETE FROM infinite_knowledge.usuario WHERE usuario.dni = OLD.dni;
END //
DELIMITER ;