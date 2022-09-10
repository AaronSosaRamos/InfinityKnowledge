package DataTransferObject;

import Utilities.Validator.ValidatorAtributosGenerales;
import Utilities.Validator.ValidatorTipoDatos;
import java.util.Date;

public class AuxiliarAcademico extends Miembro{
    
    private int nDocentesACargo;
    private String gradoAcademico;

    public AuxiliarAcademico() {
    }

    public AuxiliarAcademico(int idMiembro, String dni, String nombre, String apellidoPaterno, String apellidoMaterno, Date fechaNacimiento, String numeroTelefonico, String genero, String nDocentesACargo, String gradoAcademico) throws Exception {
        super(idMiembro, dni, nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento, numeroTelefonico, genero);
        this.setnDocentesACargo(nDocentesACargo);
        this.setGradoAcademico(gradoAcademico);
        this.setTipoMiembro("auxiliar académico");
    }

    public int getnDocentesACargo() {
        return nDocentesACargo;
    }

    public void setnDocentesACargo(String nDocentesACargo) throws Exception {
        if((nDocentesACargo!=null)&&(!nDocentesACargo.isEmpty())){
            if(!ValidatorTipoDatos.isInteger(nDocentesACargo)){
                throw new Exception("El campo número de docentes a cargo del "+this.getTipoMiembro()+" no es un número");
            }
            else{
                if(!ValidatorAtributosGenerales.isValorEnteroPositivo(Integer.parseInt(nDocentesACargo))){
                    throw new Exception("El campo número de docentes a cargo del "+this.getTipoMiembro()+" no posee un formato adecuado");
                }
            }
        }
        else{
            throw new Exception("El campo número de docentes a cargo del "+this.getTipoMiembro()+" no puede estar vacío");
        }
        
        this.nDocentesACargo = Integer.parseInt(nDocentesACargo);
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
    }
    
}
