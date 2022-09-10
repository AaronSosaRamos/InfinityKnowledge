package Utilities.Validator;

//Importar clases para manejo de expresiones regulares
import java.util.regex.Matcher;
import java.util.regex.Pattern;

//Clase para validar atributos exclusivos de la entidad Usuario
public class ValidatorUsuario {
    
    public static boolean isEmail(String email){
        Pattern patron = Pattern.compile("([a-z0-9]+(\\.?[a-z0-9])*)+@(([a-z]+)\\.([a-z]+))+");
        Matcher mat = patron.matcher(email);
        return mat.matches();
    }
    
    public static boolean isPassword(String password){
        Pattern patron = Pattern.compile("^(?=.*\\d)(?=.*[\\u0021-\\u002b\\u003c-\\u0040])(?=.*[A-Z])(?=.*[a-z])\\S{8,50}$");
        Matcher mat = patron.matcher(password);
        return mat.matches();
    }
    
    public static boolean isRol(int rol){
        boolean bandera = true;
        if((rol<1)||(rol>4)){
            bandera = false;
        }
        return bandera;
    }
}
