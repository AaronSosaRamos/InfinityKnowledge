package DataTransferObject;

import Utilities.Validator.ValidatorAtributosGenerales;
import Utilities.Validator.ValidatorTipoDatos;
import java.util.Date;

public class DirectorAcademico extends Miembro{
    
    private int aniosLabor;
    private String gradoAcademico;

    public DirectorAcademico() {
    }

    public DirectorAcademico(int idMiembro, String dni, String nombre, String apellidoPaterno, String apellidoMaterno, Date fechaNacimiento, String numeroTelefonico, String genero, String aniosLabor, String gradoAcademico) throws Exception {
        super(idMiembro, dni, nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento, numeroTelefonico, genero);
        this.setAniosLabor(aniosLabor);
        this.setGenero(genero);
        this.setTipoMiembro("director académico");
    }

    public int getAniosLabor() {
        return aniosLabor;
    }

    public void setAniosLabor(String aniosLabor) throws Exception {
        if((aniosLabor!=null)&&(!aniosLabor.isEmpty())){
            if(!ValidatorTipoDatos.isInteger(aniosLabor)){
                throw new Exception("El campo años de labor del "+this.getTipoMiembro()+" no es un número");
            }
            else{
                if(!ValidatorAtributosGenerales.isValorEnteroPositivo(Integer.parseInt(aniosLabor))){
                    throw new Exception("El campo años de labor del "+this.getTipoMiembro()+" no posee un formato adecuado");
                }
            }
        }
        else{
            throw new Exception("El campo años de labor del "+this.getTipoMiembro()+" no puede estar vacío");
        }     
        
        this.aniosLabor = Integer.parseInt(aniosLabor);
    }

    public String getGradoAcademico() {
        return gradoAcademico;
    }

    public void setGradoAcademico(String gradoAcademico) throws Exception {
        if((gradoAcademico!=null)&&(!gradoAcademico.isEmpty())){
            if(ValidatorTipoDatos.isStringNumerico(gradoAcademico)){
                throw new Exception("El campo grado académico del "+this.getTipoMiembro()+" no puede un formato adecuado");
            }
            if(gradoAcademico.length()>40){
                throw new Exception("El campo grado académico del "+this.getTipoMiembro()+" excede el límite de caracteres establecido (6 carecteres)");
            }
        }
        else{
            throw new Exception("El campo grado académico del "+this.getTipoMiembro()+" no puede estar vacío");
        }
        
        this.gradoAcademico = gradoAcademico;
        
        this.gradoAcademico = gradoAcademico;
    }
    
}
