DROP TRIGGER IF EXISTS t_director_academico_actualizar_au;

DELIMITER //
CREATE TRIGGER t_director_academico_actualizar_au AFTER UPDATE ON infinite_knowledge.director_academico FOR EACH ROW
BEGIN 
	UPDATE infinite_knowledge.usuario SET usuario.dni = NEW.dni WHERE usuario.dni = OLD.dni;
END //
DELIMITER ;