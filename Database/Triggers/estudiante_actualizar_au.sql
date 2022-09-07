DROP TRIGGER IF EXISTS estudiante_actualizar_au;

DELIMITER //
CREATE TRIGGER estudiante_actualizar_au AFTER UPDATE ON infinite_knowledge.estudiante FOR EACH ROW
BEGIN 
	UPDATE infinite_knowledge.usuario SET usuario.dni = NEW.dni WHERE usuario.dni = OLD.dni;
END //
DELIMITER ;