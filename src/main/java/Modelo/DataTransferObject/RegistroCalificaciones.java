package Modelo.DataTransferObject;

import Modelo.Utilities.Validator.ValidatorAtributosGenerales;
import Modelo.Utilities.Validator.ValidatorRegistro;
import Modelo.Utilities.Validator.ValidatorTipoDatos;
import java.util.Date;

public class RegistroCalificaciones extends Registro{
    
    private int estadoAprobacionId;
    private int calif1;
    private int calif2;
    private int calif3;
    private int promedioFInal;

    public RegistroCalificaciones() {
        
    }

    public RegistroCalificaciones(String docenteId, String estudianteId, String salonClasesId, String cursoId, Date fechaEmision, String estadoAprobacionId,
            String calif1, String calif2, String calif3, String promedioFInal) throws Exception {
        super(docenteId, estudianteId, salonClasesId, cursoId, fechaEmision);
        this.setEstadoAprobacionId(estadoAprobacionId);
        this.setCalif1(calif1);
        this.setCalif2(calif2);
        this.setCalif3(calif3);
        this.setPromedioFInal(promedioFInal);
    }

    public int getEstadoAprobacionId() {
        return estadoAprobacionId;
    }

    public void setEstadoAprobacionId(String estadoAprobacionId) throws Exception {
       if((estadoAprobacionId!=null)&&(!estadoAprobacionId.isEmpty())){
            if(!ValidatorTipoDatos.isInteger(estadoAprobacionId)){
                throw new Exception("El campo id estado de aprobación del Registro de Calificaciones no es un número");
            }
            else{
                if(!ValidatorAtributosGenerales.isEntidadId(Integer.parseInt(estadoAprobacionId))){
                    throw new Exception("El campo id estado de aprobación del Registro de Calificaciones no posee un formato adecuado");
                }
            }
        }
        else{
            throw new Exception("El campo id estado de aprobación del Registro de Calificaciones no puede estar vacío");
        }
       
        this.estadoAprobacionId = Integer.parseInt(estadoAprobacionId);
    }

    public int getCalif1() {
        return calif1;
    }

    public void setCalif1(String calif1) throws Exception {
        if(!ValidatorTipoDatos.isInteger(calif1)){
            throw new Exception("El campo calificación 1 del Registro de Asistencias no es un número");
        }
        else{
            if(!ValidatorRegistro.isValorAsistencia(Integer.parseInt(calif1))){
                throw new Exception("El campo calificación 1 del Registro de Asistencias no posee un formato adecuado");
            }
        }
        
        this.calif1 = Integer.parseInt(calif1);
    }

    public int getCalif2() {
        return calif2;
    }

    public void setCalif2(String calif2) throws Exception {
        if(!ValidatorTipoDatos.isInteger(calif2)){
            throw new Exception("El campo calificación 2 del Registro de Asistencias no es un número");
        }
        else{
            if(!ValidatorRegistro.isValorAsistencia(Integer.parseInt(calif2))){
                throw new Exception("El campo calificación 2 del Registro de Asistencias no posee un formato adecuado");
            }
        }
        
        this.calif2 = Integer.parseInt(calif2);
    }

    public int getCalif3() {
        return calif3;
    }

    public void setCalif3(String calif3) throws Exception {
        if(!ValidatorTipoDatos.isInteger(calif3)){
            throw new Exception("El campo calificación 3 del Registro de Asistencias no es un número");
        }
        else{
            if(!ValidatorRegistro.isValorAsistencia(Integer.parseInt(calif3))){
                throw new Exception("El campo calificación 3 del Registro de Asistencias no posee un formato adecuado");
            }
        }
        
        this.calif3 = Integer.parseInt(calif3);
    }

    public int getPromedioFInal() {
        return promedioFInal;
    }

    public void setPromedioFInal(String promedioFInal) {
        
        this.promedioFInal = Integer.parseInt(promedioFInal);
    }
    
}