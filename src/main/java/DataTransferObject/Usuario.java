package DataTransferObject;

import Utilities.Validator.ValidatorTipoDatos;
import Utilities.Validator.ValidatorUsuario;

public class Usuario {
    
    private int usuarioId;
    private String dni;
    private String correoElectronico;
    private String contrasenia;

    public Usuario() {
    }

    public Usuario(int usuarioId, String dni, String correoElectronico, String contrasenia) {
        
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) throws Exception {
        if((dni!=null)&&(!dni.isEmpty())){
            if(!ValidatorTipoDatos.isStringNumerico(dni)){
                throw new Exception("El campo DNI del usuario no posee un formato adecuado");
            }
            if(dni.length()!=8){
                throw new Exception("El campo DNI del usuario no posee 8 dígitos");
            }
        }
        else{
            throw new Exception("El campo DNI del usuario no puede estar vacío");
        }
        
        this.dni = dni;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) throws Exception {
        if((dni!=null)&&(!dni.isEmpty())){
            if(!ValidatorUsuario.isEmail(correoElectronico)){
                throw new Exception("El campo correo electrónico del usuario no posee un formato adecuado");
            }
            if(correoElectronico.length()>100){
                throw new Exception("El campo correo electrónico del usuario excede el límite de caracteres establecido (100 carecteres)");
            }
        }
        else{
            throw new Exception("El campo correo electrónico del usuario no puede estar vacío");
        }
        
        this.correoElectronico = correoElectronico;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) throws Exception {
        if((dni!=null)&&(!dni.isEmpty())){
            if(!ValidatorUsuario.isPassword(contrasenia)){
                throw new Exception("El campo contraseña del usuario no posee un formato adecuado");
            }
            if(contrasenia.length()>50){
                throw new Exception("El campo contraseña del usuario excede el límite de caracteres establecido (50 carecteres)");
            }
        }
        else{
            throw new Exception("El campo contraseña del usuario no puede estar vacío");
        }
        
        this.contrasenia = contrasenia;
    }
    
}