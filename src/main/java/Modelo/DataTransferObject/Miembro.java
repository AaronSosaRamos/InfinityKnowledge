package Modelo.DataTransferObject;


import Modelo.Utilities.Validator.ValidatorAtributosGenerales;
import Modelo.Utilities.Validator.ValidatorMiembro;
import Modelo.Utilities.Validator.ValidatorTipoDatos;
import java.util.Date;

public abstract class Miembro {
    
    private int idMiembro;
    private String dni;
    private String nombre;
    private String apellidoPaterno;
    private String apellidoMaterno;
    private Date fechaNacimiento;
    private String numeroTelefonico;
    private int generoId;
    
    String tipoMiembro;
    private String nombreCompleto;

    public Miembro() {
        
    }

    public Miembro(int idMiembro, String dni, String nombre, String apellidoPaterno, String apellidoMaterno, Date fechaNacimiento, String numeroTelefonico, String generoId) throws Exception {
         this.setIdMiembro(idMiembro);
         this.setDni(dni);
         this.setNombre(nombre);
         this.setApellidoPaterno(apellidoPaterno);
         this.setApellidoMaterno(apellidoMaterno);
         this.setFechaNacimiento(fechaNacimiento);
         this.setNumeroTelefonico(numeroTelefonico);
         this.setGeneroId(generoId);
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
            if(!ValidatorMiembro.isValorNumericoFijo(dni)){
                throw new Exception("El campo DNI del "+this.tipoMiembro+" no posee un formato adecuado");
            }
            if(dni.length()!=8){
                throw new Exception("El campo DNI del "+this.tipoMiembro+" no posee 8 dígitos");
            }
        }
        else{
            throw new Exception("El campo DNI del "+this.tipoMiembro+" no puede estar vacío");
        }
        
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) throws Exception {
        if((nombre!=null)&&(!nombre.isEmpty())){
            if(!ValidatorMiembro.isNombreOApellido(nombre)){
                throw new Exception("El campo nombre del "+this.tipoMiembro+" no posee un formato adecuado");
            }
            if(nombre.length()>50){
                throw new Exception("El campo nombre del "+this.tipoMiembro+" excede el límite de caracteres establecido (50 carecteres)");
            }
        }
        else{
            throw new Exception("El campo nombre del "+this.tipoMiembro+" no puede estar vacío");
        }
        
        this.nombre = nombre;
    }

    public String getApellidoPaterno() {
        return apellidoPaterno;
    }

    public void setApellidoPaterno(String apellidoPaterno) throws Exception {
        if((apellidoPaterno!=null)&&(!apellidoPaterno.isEmpty())){
            if(!ValidatorMiembro.isNombreOApellido(apellidoPaterno)){
                throw new Exception("El campo apellido paterno del "+this.tipoMiembro+" no posee un formato adecuado");
            }
            if(apellidoPaterno.length()>50){
                throw new Exception("El campo apellido paterno del "+this.tipoMiembro+" excede el límite de caracteres establecido (50 carecteres)");
            }
        }
        else{
            throw new Exception("El campo apellido paterno del "+this.tipoMiembro+" no puede estar vacío");
        }
        
        this.apellidoPaterno = apellidoPaterno;
    }

    public String getApellidoMaterno() {
        return apellidoMaterno;
    }

    public void setApellidoMaterno(String apellidoMaterno) throws Exception {
        if((apellidoMaterno!=null)&&(!apellidoMaterno.isEmpty())){
            if(!ValidatorMiembro.isNombreOApellido(apellidoMaterno)){
                throw new Exception("El campo apellido materno del "+this.tipoMiembro+" no posee un formato adecuado");
            }
            if(apellidoMaterno.length()>50){
                throw new Exception("El campo apellido materno del "+this.tipoMiembro+" excede el límite de caracteres establecido (50 carecteres)");
            }
        }
        else{
            throw new Exception("El campo apellido materno del "+this.tipoMiembro+" no puede estar vacío");
        }
        
        this.apellidoMaterno = apellidoMaterno;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) throws Exception {
        if(fechaNacimiento==null){
            throw new Exception("El campo fecha de nacimiento del "+this.tipoMiembro+" no puede estar vacío");
        }
        
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getNumeroTelefonico() {
        return numeroTelefonico;
    }

    public void setNumeroTelefonico(String numeroTelefonico) throws Exception {
        if((numeroTelefonico!=null)&&(!numeroTelefonico.isEmpty())){
            if(!ValidatorMiembro.isValorNumericoFijo(numeroTelefonico)){
                throw new Exception("El campo número telefónico del "+this.tipoMiembro+" no posee un formato adecuado");
            }
            if(numeroTelefonico.length()!=9){
                throw new Exception("El campo número telefónico del "+this.tipoMiembro+" no posee 9 dígitos");
            }
        }
        else{
            throw new Exception("El campo número telefónico del "+this.tipoMiembro+" no puede estar vacío");
        }
        
        this.numeroTelefonico = numeroTelefonico;
    }

    public int getGeneroId() {
        return generoId;
    }

    public void setGeneroId(String generoId) throws Exception {
        if((generoId!=null)&&(!generoId.isEmpty())){
            if(!ValidatorTipoDatos.isInteger(generoId)){
                throw new Exception("El campo id género del "+this.tipoMiembro+" no es un número");
            }
            else{
                if(!ValidatorAtributosGenerales.isEntidadId(Integer.parseInt(generoId))){
                    throw new Exception("El campo id género del "+this.tipoMiembro+" no posee un formato adecuado");
                }
            }
        }
        else{
            throw new Exception("El campo id género del "+this.tipoMiembro+" no puede estar vacío");
        }
        
        this.generoId = Integer.parseInt(generoId);
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