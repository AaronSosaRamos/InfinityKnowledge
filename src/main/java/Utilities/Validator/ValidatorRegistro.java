package Utilities.Validator;

//Clase para validar atributos exclusivos de las entidades del Registro de Calificaciones y Asistencias estudiantiles
public class ValidatorRegistro {
    
    public static boolean isCalificacion(int calificacion){
        boolean bandera = true;
        if((calificacion<0)||(calificacion>20)){
            bandera = false;
        }
        return bandera;
    }
    
    public static boolean isValorAsistencia(int valorAsistencia){
        boolean bandera = true;
        if((valorAsistencia<0)||(valorAsistencia>365)){
            bandera = false;
        }
        return bandera;
    }
    
}