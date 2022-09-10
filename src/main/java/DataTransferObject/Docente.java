package DataTransferObject;

import Utilities.Validator.ValidatorTipoDatos;
import java.util.Date;

public class Docente extends Miembro{
    
    private String gradoAcademico;
    private String especialidadAcademica;

    public Docente() {
    }

    public Docente(int idMiembro, String dni, String nombre, String apellidoPaterno, String apellidoMaterno, Date fechaNacimiento, String numeroTelefonico, String genero, String gradoAcademico, String especialidadAcademica) throws Exception {
        super(idMiembro, dni, nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento, numeroTelefonico, genero);
        this.setGradoAcademico(gradoAcademico);
        this.setEspecialidadAcademica(especialidadAcademica);
        this.setTipoMiembro("docente");
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

    public String getEspecialidadAcademica() {
        return especialidadAcademica;
    }

    public void setEspecialidadAcademica(String especialidadAcademica) throws Exception {
        if((especialidadAcademica!=null)&&(!especialidadAcademica.isEmpty())){
            if(ValidatorTipoDatos.isStringNumerico(especialidadAcademica)){
                throw new Exception("El campo especialidad académica del "+this.getTipoMiembro()+" no puede un formato adecuado");
            }
            if(gradoAcademico.length()>40){
                throw new Exception("El campo especialidad académica del "+this.getTipoMiembro()+" excede el límite de caracteres establecido (6 carecteres)");
            }
        }
        else{
            throw new Exception("El campo especialidad académica del "+this.getTipoMiembro()+" no puede estar vacío");
        }
        
        this.especialidadAcademica = especialidadAcademica;
    }
    
}
