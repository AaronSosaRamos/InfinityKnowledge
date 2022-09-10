DROP TRIGGER IF EXISTS t_director_academico_eliminar_bd;

DELIMITER //
CREATE TRIGGER t_director_academico_eliminar_bd BEFORE DELETE ON infinite_knowledge.director_academico FOR EACH ROW
BEGIN 
	DELETE FROM infinite_knowledge.usuario WHERE usuario.dni = OLD.dni;
END //
DELIMITER ;