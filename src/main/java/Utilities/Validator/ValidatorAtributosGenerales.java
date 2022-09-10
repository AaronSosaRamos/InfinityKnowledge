package Utilities.Validator;

//Clase para validar atributos generales entre todas las entidades y objetos del sistema
public class ValidatorAtributosGenerales {
    
    public static boolean isEntidadId(int entidadId){
        boolean bandera = true;
        if(entidadId<1){
            bandera = false;
        }
        return bandera;
    }
    
    public static boolean isValorEnteroPositivo(int valorEnteroPositivo){
        boolean bandera = true;
        if(valorEnteroPositivo<0){
            bandera = false;
        }
        return bandera;
    }
    
}
