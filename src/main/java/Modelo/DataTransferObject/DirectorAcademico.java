package Modelo.DataTransferObject;

import Modelo.Utilities.Validator.ValidatorAtributosGenerales;
import Modelo.Utilities.Validator.ValidatorTipoDatos;
import java.util.Date;

public class DirectorAcademico extends Miembro{
    
    private int aniosLabor;
    private int gradoAcademicoId;

    public DirectorAcademico() {
    }

    public DirectorAcademico(int idMiembro, String dni, String nombre, String apellidoPaterno, String apellidoMaterno, Date fechaNacimiento, String numeroTelefonico, String generoId, String aniosLabor, String gradoAcademicoId) throws Exception {
        super(idMiembro, dni, nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento, numeroTelefonico, generoId);
        this.setAniosLabor(aniosLabor);
        this.setGradoAcademicoId(gradoAcademicoId);
        this.setTipoMiembro("director académico");
    }

    public int getAniosLabor() {
        return aniosLabor;
    }

    public void setAniosLabor(String aniosLabor) throws Exception {
        if((aniosLabor!=null)&&(!aniosLabor.isEmpty())){
            if(!ValidatorTipoDatos.isInteger(aniosLabor)){
                throw new Exception("El campo años de labor del "+this.tipoMiembro+" no es un número");
            }
            else{
                if(!ValidatorAtributosGenerales.isValorEnteroPositivo(Integer.parseInt(aniosLabor))){
                    throw new Exception("El campo años de labor del "+this.tipoMiembro+" no posee un formato adecuado");
                }
            }
        }
        else{
            throw new Exception("El campo años de labor del "+this.tipoMiembro+" no puede estar vacío");
        }     
        
        this.aniosLabor = Integer.parseInt(aniosLabor);
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
