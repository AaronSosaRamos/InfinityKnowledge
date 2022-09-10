package DataTransferObject;

import Utilities.Validator.ValidatorRegistro;
import Utilities.Validator.ValidatorTipoDatos;
import java.util.Date;

public class RegistroCalificaciones extends Registro{
    
    private String estadoAprobacion;
    private int calif1;
    private int calif2;
    private int calif3;
    private int promedioFInal;

    public RegistroCalificaciones() {
        
    }

    public RegistroCalificaciones(String docenteId, String estudianteId, String cursoId, String salonClases,  Date fechaEmision, String estadoAprobacion,
            String calif1, String calif2, String calif3, String promedioFInal) throws Exception {
        super(docenteId, estudianteId, cursoId, salonClases, fechaEmision);
        this.setEstadoAprobacion(estadoAprobacion);
        this.setCalif1(calif1);
        this.setCalif2(calif2);
        this.setCalif3(calif3);
        this.setPromedioFInal(promedioFInal);
    }

    public String getEstadoAprobacion() {
        return estadoAprobacion;
    }

    public void setEstadoAprobacion(String estadoAprobacion) {
        this.estadoAprobacion = estadoAprobacion;
    }

    public int getCalif1() {
        return calif1;
    }

    public void setCalif1(String calif1) throws Exception {
        if((calif1!=null)&&(!calif1.isEmpty())){
            if(!ValidatorTipoDatos.isInteger(calif1)){
                throw new Exception("El campo calificación 1 del Registro de Asistencias no es un número");
            }
            else{
                if(!ValidatorRegistro.isValorAsistencia(Integer.parseInt(calif1))){
                    throw new Exception("El campo calificación 1 del Registro de Asistencias no posee un formato adecuado");
                }
            }
        }
        
        this.calif1 = Integer.parseInt(calif1);
    }

    public int getCalif2() {
        return calif2;
    }

    public void setCalif2(String calif2) throws Exception {
        if((calif2!=null)&&(!calif2.isEmpty())){
            if(!ValidatorTipoDatos.isInteger(calif2)){
                throw new Exception("El campo calificación 2 del Registro de Asistencias no es un número");
            }
            else{
                if(!ValidatorRegistro.isValorAsistencia(Integer.parseInt(calif2))){
                    throw new Exception("El campo calificación 2 del Registro de Asistencias no posee un formato adecuado");
                }
            }
        }
        
        this.calif2 = Integer.parseInt(calif2);
    }

    public int getCalif3() {
        return calif3;
    }

    public void setCalif3(String calif3) throws Exception {
        if((calif3!=null)&&(!calif3.isEmpty())){
            if(!ValidatorTipoDatos.isInteger(calif3)){
                throw new Exception("El campo calificación 3 del Registro de Asistencias no es un número");
            }
            else{
                if(!ValidatorRegistro.isValorAsistencia(Integer.parseInt(calif3))){
                    throw new Exception("El campo calificación 3 del Registro de Asistencias no posee un formato adecuado");
                }
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