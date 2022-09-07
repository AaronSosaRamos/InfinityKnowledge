package Modelo.DataTransferObject;

import Modelo.Utilities.Validator.ValidatorAtributosGenerales;
import Modelo.Utilities.Validator.ValidatorMiembro;
import Modelo.Utilities.Validator.ValidatorTipoDatos;

public class Curso {
    
    private int cursoId;
    private String nombre;
    private int nHoras;
    private int dificultadCursoId;
    private int enfoqueCursoId;

    public Curso() {
    }

    public Curso(int cursoId, String nombre, String nHoras, String dificultadCursoId, String enfoqueCursoId) throws Exception {
        this.setCursoId(cursoId);
        this.setNombre(nombre);
        this.setnHoras(nHoras);
        this.setDificultadCursoId(dificultadCursoId);
        this.setEnfoqueCursoId(enfoqueCursoId);
    }

    public int getCursoId() {
        return cursoId;
    }

    public void setCursoId(int cursoId) {
        this.cursoId = cursoId;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) throws Exception {
        if((nombre!=null)&&(!nombre.isEmpty())){
            if(!ValidatorMiembro.isNombreOApellido(nombre)){
                throw new Exception("El campo nombre del curso no posee un formato adecuado");
            }
            if(nombre.length()>45){
                throw new Exception("El campo nombre del curso excede el límite de caracteres establecido (45 carecteres)");
            }
        }
        else{
            throw new Exception("El campo nombre del curso no puede estar vacío");
        }
        
        this.nombre = nombre;
    }

    public int getnHoras() {
        return nHoras;
    }

    public void setnHoras(String nHoras) throws Exception {
        if((nHoras!=null)&&(!nHoras.isEmpty())){
            if(!ValidatorTipoDatos.isInteger(nHoras)){
                throw new Exception("El campo número de horas no es un número");
            }
            else{
                if(!ValidatorAtributosGenerales.isValorEnteroPositivo(Integer.parseInt(nHoras))){
                    throw new Exception("El campo número de horas no posee un formato adecuado");
                }
            }
        }
        else{
            throw new Exception("El campo número de horas del curso no puede estar vacío");
        }
        
        this.nHoras = Integer.parseInt(nHoras);
    }

    public int getDificultadCursoId() {
        return dificultadCursoId;
    }

    public void setDificultadCursoId(String dificultadCursoId) throws Exception {
        if((dificultadCursoId!=null)&&(!dificultadCursoId.isEmpty())){
            if(!ValidatorTipoDatos.isInteger(dificultadCursoId)){
                throw new Exception("El campo id dificultad de curso no es un número");
            }
            else{
                if(!ValidatorAtributosGenerales.isEntidadId(Integer.parseInt(dificultadCursoId))){
                    throw new Exception("El campo id dificultad de curso no posee un formato adecuado");
                }
            }
        }
        else{
            throw new Exception("El campo id dificultad de curso no puede estar vacío");
        }
        
        this.dificultadCursoId = Integer.parseInt(dificultadCursoId);
    }

    public int getEnfoqueCursoId() {
        return enfoqueCursoId;
    }

    public void setEnfoqueCursoId(String enfoqueCursoId) throws Exception {
        if((enfoqueCursoId!=null)&&(!enfoqueCursoId.isEmpty())){
            if(!ValidatorTipoDatos.isInteger(enfoqueCursoId)){
                throw new Exception("El campo id enfoque de curso no es un número");
            }
            else{
                if(!ValidatorAtributosGenerales.isEntidadId(Integer.parseInt(enfoqueCursoId))){
                    throw new Exception("El campo id enfoque de curso no posee un formato adecuado");
                }
            }
        }
        else{
            throw new Exception("El campo id enfoque de curso no puede estar vacío");
        }
        
        this.enfoqueCursoId = Integer.parseInt(enfoqueCursoId);
    }

}
