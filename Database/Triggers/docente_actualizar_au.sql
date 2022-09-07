DROP TRIGGER IF EXISTS docente_actualizar_au;

DELIMITER //
CREATE TRIGGER docente_actualizar_au AFTER UPDATE ON infinite_knowledge.docente FOR EACH ROW
BEGIN 
	UPDATE infinite_knowledge.usuario SET usuario.dni = NEW.dni WHERE usuario.dni = OLD.dni;
END //
DELIMITER ;