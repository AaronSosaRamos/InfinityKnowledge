DROP TRIGGER IF EXISTS estudiante_eliminar_bd;

DELIMITER //
CREATE TRIGGER estudiante_eliminar_bd BEFORE DELETE ON infinite_knowledge.estudiante FOR EACH ROW
BEGIN 
	DELETE FROM infinite_knowledge.usuario WHERE usuario.dni = OLD.dni;
END //
DELIMITER ;