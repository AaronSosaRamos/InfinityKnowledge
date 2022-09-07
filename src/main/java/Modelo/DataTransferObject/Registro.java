package Modelo.DataTransferObject;

import Modelo.Utilities.Validator.ValidatorAtributosGenerales;
import Modelo.Utilities.Validator.ValidatorTipoDatos;
import java.util.Date;

public abstract class Registro {
    
    private int docenteId;
    private int estudianteId;
    private int salonClasesId;
    private int cursoId;
    private Date fechaEmision;

    public Registro() {
    }

    public Registro(String docenteId, String estudianteId, String salonClasesId, String cursoId, Date fechaEmision) throws Exception {
        this.setDocenteId(docenteId);
        this.setEstudianteId(estudianteId);
        this.setSalonClasesId(salonClasesId);
        this.setCursoId(cursoId);
        this.setFechaEmision(fechaEmision);
    }

    public int getDocenteId() {
        return docenteId;
    }

    public void setDocenteId(String docenteId) throws Exception {
        if((docenteId!=null)&&(!docenteId.isEmpty())){
            if(!ValidatorTipoDatos.isInteger(docenteId)){
                throw new Exception("El campo id docente del Registro no es un número");
            }
            else{
                if(!ValidatorAtributosGenerales.isEntidadId(Integer.parseInt(docenteId))){
                    throw new Exception("El campo id docente no posee un formato adecuado");
                }
            }
        }
        else{
            throw new Exception("El campo id docente no puede estar vacío");
        }
        
        this.docenteId = Integer.parseInt(docenteId);
    }

    public int getEstudianteId() {
        return estudianteId;
    }

    public void setEstudianteId(String estudianteId) throws Exception {
        if((estudianteId!=null)&&(!estudianteId.isEmpty())){
            if(!ValidatorTipoDatos.isInteger(estudianteId)){
                throw new Exception("El campo id estudiante del Registro no es un número");
            }
            else{
                if(!ValidatorAtributosGenerales.isEntidadId(Integer.parseInt(estudianteId))){
                    throw new Exception("El campo id estudiante no posee un formato adecuado");
                }
            }
        }
        else{
            throw new Exception("El campo id estudiante no puede estar vacío");
        }
        
        this.estudianteId = Integer.parseInt(estudianteId);
    }

    public int getSalonClasesId() {
        return salonClasesId;
    }

    public void setSalonClasesId(String salonClasesId) throws Exception {
        if((salonClasesId!=null)&&(!salonClasesId.isEmpty())){
            if(!ValidatorTipoDatos.isInteger(salonClasesId)){
                throw new Exception("El campo id salón de clases del Registro no es un número");
            }
            else{
                if(!ValidatorAtributosGenerales.isEntidadId(Integer.parseInt(salonClasesId))){
                    throw new Exception("El campo id salón de clases no posee un formato adecuado");
                }
            }
        }
        else{
            throw new Exception("El campo id salón de clases no puede estar vacío");
        }
        
        this.salonClasesId = Integer.parseInt(salonClasesId);
    }

    public int getCursoId() {
        return cursoId;
    }

    public void setCursoId(String cursoId) throws Exception {
        if((cursoId!=null)&&(!cursoId.isEmpty())){
            if(!ValidatorTipoDatos.isInteger(cursoId)){
                throw new Exception("El campo id curso del Registro no es un número");
            }
            else{
                if(!ValidatorAtributosGenerales.isEntidadId(Integer.parseInt(cursoId))){
                    throw new Exception("El campo id curso no posee un formato adecuado");
                }
            }
        }
        else{
            throw new Exception("El campo id curso no puede estar vacío");
        }
        
        this.cursoId = Integer.parseInt(cursoId);
    }
    
    public Date getFechaEmision() {
        return fechaEmision;
    }

    public void setFechaEmision(Date fechaEmision) throws Exception {
        if(fechaEmision==null){
            throw new Exception("El campo fecha de emisión del Registro de Asistencias no puede estar vacío");
        }
        
        this.fechaEmision = fechaEmision;
    }
    
}
