package Modelo.Utilities.Validator;

//Clase para validar tipos de dato a manejar en el sistema
public class ValidatorTipoDatos {
    
    
    public static boolean isInteger(String integer){
        try{
            Integer.parseInt(integer);
            return true;
        }
        catch(NumberFormatException e){
            return false;
        }
    }
    
    public static boolean isStringNumerico(String string){
        return string.matches("[+-]?\\d*(\\.\\d+)?");
    }
    
}
