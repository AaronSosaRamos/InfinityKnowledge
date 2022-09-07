DROP PROCEDURE IF EXISTS sp_registro_asistencias_total_asistencias_c;

DELIMITER //
CREATE PROCEDURE sp_registro_asistencias_total_asistencias_c(
	n_total_asistencias_ SMALLINT
)
BEGIN
    DECLARE bandera BOOLEAN DEFAULT FALSE;
    DECLARE estudiante_id_ INT;
    DECLARE docente_id_ INT;
    DECLARE curso_id_ INT;
    DECLARE salon_clases_id_ INT;
    DECLARE c1 cursor FOR SELECT registro_asistencias.estudiante_id,registro_asistencias.docente_id,registro_asistencias.curso_id,registro_asistencias.salon_clases_id FROM infinite_knowledge.registro_asistencias;
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET bandera = TRUE;

    OPEN c1;
    c1_loop: LOOP
    FETCH c1 INTO estudiante_id_,docente_id_,curso_id_,salon_clases_id_;
    	IF bandera THEN LEAVE c1_loop;
		END IF;
        
	UPDATE infinite_knowledge.registro_asistencias SET registro_asistencias.n_total_asistencias = n_total_asistencias_ WHERE registro_asistencias.estudiante_id = estudiante_id_ AND registro_asistencias.docente_id = docente_id_ AND registro_asistencias.curso_id = curso_id_ AND registro_asistencias.salon_clases_id  = salon_clases_id_; 
	
	UPDATE infinite_knowledge.registro_asistencias SET registro_asistencias.n_faltas_realizadas =  registro_asistencias.n_total_asistencias-(registro_asistencias.n_asistencias_realizadas+registro_asistencias.n_justificaciones_realizadas);   

    END LOOP c1_loop;
    CLOSE c1;
END //
DELIMITER ;