package DataTransferObject;

import Utilities.Validator.ValidatorAtributosGenerales;
import Utilities.Validator.ValidatorTipoDatos;
import java.util.Date;

public abstract class Registro {
    
    private int docenteId;
    private int estudianteId;
    private int cursoId;
    private String salonClases;
    private Date fechaEmision;

    public Registro() {
    }

    public Registro(String docenteId, String estudianteId, String cursoId, String salonClases, Date fechaEmision) throws Exception {
        this.setDocenteId(docenteId);
        this.setEstudianteId(estudianteId);
        this.setCursoId(cursoId);
        this.setSalonClases(salonClases);
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

    public String getSalonClases() {
        return salonClases;
    }

    public void setSalonClases(String salonClases) throws Exception {
        if((salonClases!=null)&&(!salonClases.isEmpty())){
            if(ValidatorTipoDatos.isStringNumerico(salonClases)){
                throw new Exception("El campo grado académico del Registro no puede un formato adecuado");
            }
            if(salonClases.length()>2){
                throw new Exception("El campo grado académico del Registro excede el límite de caracteres establecido (2 carecteres)");
            }
        }
        else{
            throw new Exception("El campo grado académico del del Registro no puede estar vacío");
        }
        
        this.salonClases = salonClases;
    }
    
    public Date getFechaEmision() {
        return fechaEmision;
    }

    public void setFechaEmision(Date fechaEmision) throws Exception {
        this.fechaEmision = fechaEmision;
    }
    
}
