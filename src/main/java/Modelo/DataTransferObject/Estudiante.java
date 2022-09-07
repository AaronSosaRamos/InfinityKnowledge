package Modelo.DataTransferObject;

import java.util.Date;

public class Estudiante extends Miembro{

    public Estudiante() {
    }

    public Estudiante(int idMiembro, String dni, String nombre, String apellidoPaterno, String apellidoMaterno, Date fechaNacimiento, String numeroTelefonico, String generoId) throws Exception {
        super(idMiembro, dni, nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento, numeroTelefonico, generoId);
        this.setTipoMiembro("estudiante");
    }
    
}
