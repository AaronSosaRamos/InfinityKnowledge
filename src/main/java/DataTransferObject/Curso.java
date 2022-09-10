package DataTransferObject;

import Utilities.Validator.ValidatorAtributosGenerales;
import Utilities.Validator.ValidatorTipoDatos;

public class Curso {
    
    private int cursoId;
    private String nombre;
    private int nHoras;
    private String enfoqueCurso;

    public Curso() {
    }

    public Curso(int cursoId, String nombre, String nHoras, String enfoqueCurso) throws Exception {
        this.setCursoId(cursoId);
        this.setNombre(nombre);
        this.setnHoras(nHoras);
        this.setEnfoqueCurso(enfoqueCurso);
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
            if(ValidatorTipoDatos.isStringNumerico(nombre)){
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

    public String getEnfoqueCurso() {
        return enfoqueCurso;
    }

    public void setEnfoqueCurso(String enfoqueCurso) throws Exception {
        if((enfoqueCurso!=null)&&(!enfoqueCurso.isEmpty())){
            if(ValidatorTipoDatos.isStringNumerico(enfoqueCurso)){
                throw new Exception("El campo enfoque del curso no posee un formato adecuado");
            }
            if(enfoqueCurso.length()>50){
                throw new Exception("El campo enfoque del curso excede el límite de caracteres establecido (50 carecteres)");
            }
        }
        else{
            throw new Exception("El campo nombre del curso no puede estar vacío");
        }
        
        this.enfoqueCurso = enfoqueCurso;
    }

}
