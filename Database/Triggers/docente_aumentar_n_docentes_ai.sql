DROP TRIGGER IF EXISTS t_docente_aumentar_n_docentes_ai;

DELIMITER //
CREATE TRIGGER t_docente_aumentar_n_docentes_ai AFTER INSERT ON infinite_knowledge.docente FOR EACH ROW
BEGIN 
	UPDATE infinite_knowledge.auxiliar_academico SET auxiliar_academico.n_docentes_a_cargo = auxiliar_academico.n_docentes_a_cargo+1;
END //
DELIMITER ;