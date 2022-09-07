package Modelo.DataTransferObject;

import Modelo.Utilities.Validator.ValidatorAtributosGenerales;
import Modelo.Utilities.Validator.ValidatorTipoDatos;
import java.util.Date;

public class Docente extends Miembro{
    
    private int gradoAcademicoId;
    private int especialidadAcademicaId;

    public Docente() {
    }

    public Docente(int idMiembro, String dni, String nombre, String apellidoPaterno, String apellidoMaterno, Date fechaNacimiento, String numeroTelefonico, String generoId, String gradoAcademicoId, String especialidadAcademicaId) throws Exception {
        super(idMiembro, dni, nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento, numeroTelefonico, generoId);
        this.setGradoAcademicoId(gradoAcademicoId);
        this.setEspecialidadAcademicaId(especialidadAcademicaId);
        this.setTipoMiembro("docente");
    }

    public int getGradoAcademicoId() {
        return gradoAcademicoId;
    }

    public void setGradoAcademicoId(String gradoAcademicoId) throws Exception {
        if((gradoAcademicoId!=null)&&(!gradoAcademicoId.isEmpty())){
            if(!ValidatorTipoDatos.isInteger(gradoAcademicoId)){
                throw new Exception("El campo id grado académico del "+this.getTipoMiembro()+" no es un número");
            }
            else{
                if(!ValidatorAtributosGenerales.isEntidadId(Integer.parseInt(gradoAcademicoId))){
                    throw new Exception("El campo id grado académico del "+this.getTipoMiembro()+" no posee un formato adecuado");
                }
            }
        }
        else{
            throw new Exception("El campo id grado académico del "+this.tipoMiembro+" no puede estar vacío");
        }
        
        this.gradoAcademicoId = Integer.parseInt(gradoAcademicoId);
    }

    public int getEspecialidadAcademicaId() {
        return especialidadAcademicaId;
    }

    public void setEspecialidadAcademicaId(String especialidadAcademicaId) throws Exception {
        if((especialidadAcademicaId!=null)&&(!especialidadAcademicaId.isEmpty())){
            if(!ValidatorTipoDatos.isInteger(especialidadAcademicaId)){
                throw new Exception("El campo id especialidad académica del "+this.getTipoMiembro()+" no es un número");
            }
            else{
                if(!ValidatorAtributosGenerales.isEntidadId(Integer.parseInt(especialidadAcademicaId))){
                    throw new Exception("El campo id especialidad académica del "+this.getTipoMiembro()+" no posee un formato adecuado");
                }
            }
        }
        else{
            throw new Exception("El campo id especialidad académica del "+this.tipoMiembro+" no puede estar vacío");
        }
        
        this.especialidadAcademicaId = Integer.parseInt(especialidadAcademicaId);
    }
    
    
    
}
