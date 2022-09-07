package Modelo.DataTransferObject;

import Modelo.Utilities.Validator.ValidatorAtributosGenerales;
import Modelo.Utilities.Validator.ValidatorTipoDatos;
import java.util.Date;

public class AuxiliarAcademico extends Miembro{
    
    private int nDocentesACargo;
    private int gradoAcademicoId;

    public AuxiliarAcademico() {
    }

    public AuxiliarAcademico(int idMiembro, String dni, String nombre, String apellidoPaterno, String apellidoMaterno, Date fechaNacimiento, String numeroTelefonico, String generoId, String nDocentesACargo, String gradoAcademicoId) throws Exception {
        super(idMiembro, dni, nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento, numeroTelefonico, generoId);
        this.setnDocentesACargo(nDocentesACargo);
        this.setGradoAcademicoId(gradoAcademicoId);
        this.setTipoMiembro("auxiliar académico");
    }

    public int getnDocentesACargo() {
        return nDocentesACargo;
    }

    public void setnDocentesACargo(String nDocentesACargo) throws Exception {
        if((nDocentesACargo!=null)&&(!nDocentesACargo.isEmpty())){
            if(!ValidatorTipoDatos.isInteger(nDocentesACargo)){
                throw new Exception("El campo número de docentes a cargo del "+this.tipoMiembro+" no es un número");
            }
            else{
                if(!ValidatorAtributosGenerales.isValorEnteroPositivo(Integer.parseInt(nDocentesACargo))){
                    throw new Exception("El campo número de docentes a cargo del "+this.tipoMiembro+" no posee un formato adecuado");
                }
            }
        }
        else{
            throw new Exception("El campo número de docentes a cargo del "+this.tipoMiembro+" no puede estar vacío");
        }
        
        this.nDocentesACargo = Integer.parseInt(nDocentesACargo);
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
    
}
