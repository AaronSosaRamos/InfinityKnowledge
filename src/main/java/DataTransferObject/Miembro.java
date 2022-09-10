package DataTransferObject;

import Utilities.Validator.ValidatorTipoDatos;
import java.util.Date;

public abstract class Miembro {
    
    private int idMiembro;
    private String dni;
    private String nombre;
    private String apellidoPaterno;
    private String apellidoMaterno;
    private Date fechaNacimiento;
    private String numeroTelefonico;
    private String genero;
    
    private String tipoMiembro;
    private String nombreCompleto;

    public Miembro() {
        
    }

    public Miembro(int idMiembro, String dni, String nombre, String apellidoPaterno, String apellidoMaterno, Date fechaNacimiento, String numeroTelefonico, String genero) throws Exception {
        this.setIdMiembro(idMiembro);
        this.setDni(dni);
        this.setNombre(nombre);
        this.setApellidoPaterno(apellidoPaterno);
        this.setApellidoMaterno(apellidoMaterno);
        this.setFechaNacimiento(fechaNacimiento);
        this.setNumeroTelefonico(numeroTelefonico);
        this.setGenero(genero);
    }

    
    public int getIdMiembro() {
        return idMiembro;
    }

    public void setIdMiembro(int idMiembro){
        this.idMiembro = idMiembro;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) throws Exception {
        if((dni!=null)&&(!dni.isEmpty())){
            if(!ValidatorTipoDatos.isStringNumerico(dni)){
                throw new Exception("El campo DNI del "+this.getTipoMiembro()+" no posee un formato adecuado");
            }
            if(dni.length()!=8){
                throw new Exception("El campo DNI del "+this.getTipoMiembro()+" no posee 8 dígitos");
            }
        }
        else{
            throw new Exception("El campo DNI del "+this.getTipoMiembro()+" no puede estar vacío");
        }
        
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) throws Exception {
        if((nombre!=null)&&(!nombre.isEmpty())){
            if(ValidatorTipoDatos.isStringNumerico(nombre)){
                throw new Exception("El campo nombre del "+this.getTipoMiembro()+" no posee un formato adecuado");
            }
            if(nombre.length()>50){
                throw new Exception("El campo nombre del "+this.getTipoMiembro()+" excede el límite de caracteres establecido (50 carecteres)");
            }
        }
        else{
            throw new Exception("El campo nombre del "+this.getTipoMiembro()+" no puede estar vacío");
        }
        
        this.nombre = nombre;
    }

    public String getApellidoPaterno() {
        return apellidoPaterno;
    }

    public void setApellidoPaterno(String apellidoPaterno) throws Exception {
        if((apellidoPaterno!=null)&&(!apellidoPaterno.isEmpty())){
            if(ValidatorTipoDatos.isStringNumerico(apellidoPaterno)){
                throw new Exception("El campo apellido paterno del "+this.getTipoMiembro()+" no posee un formato adecuado");
            }
            if(apellidoPaterno.length()>50){
                throw new Exception("El campo apellido paterno del "+this.getTipoMiembro()+" excede el límite de caracteres establecido (50 carecteres)");
            }
        }
        else{
            throw new Exception("El campo apellido paterno del "+this.getTipoMiembro()+" no puede estar vacío");
        }
        
        this.apellidoPaterno = apellidoPaterno;
    }

    public String getApellidoMaterno() {
        return apellidoMaterno;
    }

    public void setApellidoMaterno(String apellidoMaterno) throws Exception {
        if((apellidoMaterno!=null)&&(!apellidoMaterno.isEmpty())){
            if(ValidatorTipoDatos.isStringNumerico(apellidoMaterno)){
                throw new Exception("El campo apellido materno del "+this.getTipoMiembro()+" no posee un formato adecuado");
            }
            if(apellidoMaterno.length()>50){
                throw new Exception("El campo apellido materno del "+this.getTipoMiembro()+" excede el límite de caracteres establecido (50 carecteres)");
            }
        }
        else{
            throw new Exception("El campo apellido materno del "+this.getTipoMiembro()+" no puede estar vacío");
        }
        
        this.apellidoMaterno = apellidoMaterno;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) throws Exception {
        if(fechaNacimiento==null){
            throw new Exception("El campo fecha de nacimiento del "+this.getTipoMiembro()+" no puede estar vacío");
        }
        
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getNumeroTelefonico() {
        return numeroTelefonico;
    }

    public void setNumeroTelefonico(String numeroTelefonico) throws Exception {
        if((numeroTelefonico!=null)&&(!numeroTelefonico.isEmpty())){
            if(!ValidatorTipoDatos.isStringNumerico(numeroTelefonico)){
                throw new Exception("El campo número telefónico del "+this.getTipoMiembro()+" no posee un formato adecuado");
            }
            if(numeroTelefonico.length()!=9){
                throw new Exception("El campo número telefónico del "+this.getTipoMiembro()+" no posee 9 dígitos");
            }
        }
        else{
            throw new Exception("El campo número telefónico del "+this.getTipoMiembro()+" no puede estar vacío");
        }
        
        this.numeroTelefonico = numeroTelefonico;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) throws Exception {
        if((genero!=null)&&(!genero.isEmpty())){
            if(ValidatorTipoDatos.isStringNumerico(genero)){
                throw new Exception("El campo género del "+this.getTipoMiembro()+" no puede un formato adecuado");
            }
            if(genero.length()>6){
                throw new Exception("El campo género del "+this.getTipoMiembro()+" excede el límite de caracteres establecido (6 carecteres)");
            }
        }
        else{
            throw new Exception("El campo género del "+this.getTipoMiembro()+" no puede estar vacío");
        }
        
        this.genero = genero;
    }

    public String getTipoMiembro() {
        return tipoMiembro;
    }

    public void setTipoMiembro(String tipoMiembro) {
        this.tipoMiembro = tipoMiembro;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }
        
}