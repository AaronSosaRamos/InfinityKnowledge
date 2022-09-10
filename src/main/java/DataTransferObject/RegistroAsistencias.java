package DataTransferObject;

import Utilities.Validator.ValidatorRegistro;
import Utilities.Validator.ValidatorTipoDatos;
import java.util.Date;


public class RegistroAsistencias extends Registro{
    
    private int nAsistenciasRealizadas;
    private int nFaltasRealizadas;
    private int nJustificacionesRealizadas;
    private int nTotalAsistencias;

    public RegistroAsistencias() {
        
    }

    public RegistroAsistencias(String docenteId, String estudianteId, String cursoId, String salonClases, Date fechaEmision,
            String nAsistenciasRealizadas, String nFaltasRealizadas, String nJustificacionesRealizadas, String nTotalAsistencias) throws Exception {
        super(docenteId, estudianteId, cursoId, salonClases, fechaEmision);
        this.setnAsistenciasRealizadas(nAsistenciasRealizadas);
        this.setnFaltasRealizadas(nFaltasRealizadas);
        this.setnJustificacionesRealizadas(nJustificacionesRealizadas);
        this.setnTotalAsistencias(nTotalAsistencias);
    }

    public int getnAsistenciasRealizadas() {
        return nAsistenciasRealizadas;
    }

    public void setnAsistenciasRealizadas(String nAsistenciasRealizadas) throws Exception {
        if((nAsistenciasRealizadas!=null)&&(!nAsistenciasRealizadas.isEmpty())){
            if(!ValidatorTipoDatos.isInteger(nAsistenciasRealizadas)){
                throw new Exception("El campo número de asistencias realizadas del Registro de Asistencias no es un número");
            }
            else{
                if(!ValidatorRegistro.isValorAsistencia(Integer.parseInt(nAsistenciasRealizadas))){
                    throw new Exception("El campo número de asistencias realizadas del Registro de Asistencias no posee un formato adecuado");
                }
            }
        }
        
        this.nAsistenciasRealizadas = Integer.parseInt(nAsistenciasRealizadas);
    }

    public int getnFaltasRealizadas() {
        return nFaltasRealizadas;
    }

    public void setnFaltasRealizadas(String nFaltasRealizadas){
        this.nFaltasRealizadas = Integer.parseInt(nFaltasRealizadas);
    }

    public int getnJustificacionesRealizadas() {
        return nJustificacionesRealizadas;
    }

    public void setnJustificacionesRealizadas(String nJustificacionesRealizadas) throws Exception {
        if((nJustificacionesRealizadas!=null)&&(!nJustificacionesRealizadas.isEmpty())){
            if(!ValidatorTipoDatos.isInteger(nJustificacionesRealizadas)){
                throw new Exception("El campo número de justificaciones realizadas del Registro de Asistencias no es un número");
            }
            else{
                if(!ValidatorRegistro.isValorAsistencia(Integer.parseInt(nJustificacionesRealizadas))){
                    throw new Exception("El campo número de justificaciones realizadas del Registro de Asistencias no posee un formato adecuado");
                }
            }
        }
        
        this.nJustificacionesRealizadas = Integer.parseInt(nJustificacionesRealizadas);
    }

    public int getnTotalAsistencias() {
        return nTotalAsistencias;
    }

    public void setnTotalAsistencias(String nTotalAsistencias) {
        this.nTotalAsistencias = Integer.parseInt(nTotalAsistencias);
    }
    
}