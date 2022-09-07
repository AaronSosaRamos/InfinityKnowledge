DROP PROCEDURE IF EXISTS sp_registro_calificaciones_actualizar_datos_c;

DELIMITER //
CREATE PROCEDURE sp_registro_calificaciones_actualizar_datos_c(
	
)
BEGIN
    DECLARE bandera BOOLEAN DEFAULT FALSE;
    DECLARE estudiante_id_ INT;
    DECLARE docente_id_ INT;
    DECLARE curso_id_ INT;
    DECLARE salon_clases_id_ INT;
    DECLARE estado_aprobacion_id_ INT;
    DECLARE c1 cursor FOR SELECT registro_calificaciones.estudiante_id,registro_calificaciones.docente_id,registro_calificaciones.curso_id,
    registro_calificaciones.salon_clases_id FROM infinite_knowledge.registro_calificaciones;
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET bandera = TRUE;

    OPEN c1;
    c1_loop: LOOP
    FETCH c1 INTO estudiante_id_,docente_id_,curso_id_,salon_clases_id_;
    	IF bandera THEN LEAVE c1_loop;
		END IF;
        
        UPDATE infinite_knowledge.registro_calificaciones SET registro_calificaciones.promedio_final = CAST(((registro_calificaciones.calif1+registro_calificaciones.calif2+
        registro_calificaciones.calif3)/3) AS SIGNED) WHERE registro_calificaciones.estudiante_id = estudiante_id_ AND registro_calificaciones.docente_id = docente_id_ AND 
        registro_calificaciones.curso_id = curso_id_ AND registro_calificaciones.salon_clases_id = salon_clases_id_;
        
        IF (CAST(((registro_calificaciones.calif1+registro_calificaciones.calif2+registro_calificaciones.calif3)/3) AS SIGNED) < 11) THEN 
        	UPDATE infinite_knowledge.registro_calificaciones SET registro_calificaciones.estado_aprobacion_id = 1 WHERE registro_calificaciones.estudiante_id = 
            estudiante_id_ AND registro_calificaciones.docente_id = docente_id_ AND registro_calificaciones.curso_id = curso_id_ AND registro_calificaciones.salon_clases_id = 
            salon_clases_id_;
        
        ELSEIF ((CAST(((registro_calificaciones.calif1+registro_calificaciones.calif2+registro_calificaciones.calif3)/3) AS SIGNED) > 11) AND 
        (CAST(((registro_calificaciones.calif1+registro_calificaciones.calif2+registro_calificaciones.calif3)/3) AS SIGNED) < 18)) THEN 
        	UPDATE infinite_knowledge.registro_calificaciones SET registro_calificaciones.estado_aprobacion_id = 2 WHERE registro_calificaciones.estudiante_id = estudiante_id_ 
            AND registro_calificaciones.docente_id = docente_id_ AND registro_calificaciones.curso_id = curso_id_ AND registro_calificaciones.salon_clases_id = salon_clases_id_;
        
        ELSE
        	UPDATE infinite_knowledge.registro_calificaciones SET registro_calificaciones.estado_aprobacion_id = 3 WHERE registro_calificaciones.estudiante_id = estudiante_id_
            AND registro_calificaciones.docente_id = docente_id_ AND registro_calificaciones.curso_id = curso_id_ AND registro_calificaciones.salon_clases_id = salon_clases_id_;
        END IF;    
        
    END LOOP c1_loop;
    CLOSE c1;
END //
DELIMITER ;