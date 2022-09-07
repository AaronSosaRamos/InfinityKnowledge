package Modelo.Utilities.Validator;

//Clase para validar atributos exclusivos de las entidades de los miembros del COAR (Director académico, auxiliar académico, docente y estudiante)
public class ValidatorMiembro {
    
    public static boolean isValorNumericoFijo(String valorNumericoFijo){
        boolean bandera = true;
        if(!ValidatorTipoDatos.isStringNumerico(valorNumericoFijo)){
            bandera = false;
        }
        return bandera;
    }
    
    public static boolean isNombreOApellido(String nombreOApellido){
        boolean bandera = true;
        if(ValidatorTipoDatos.isStringNumerico(nombreOApellido)){
            bandera = false;
        }
        return bandera;
    } 
    
}