package DataTransferObject;

import java.util.Date;

public class Estudiante extends Miembro{

    public Estudiante() {
    }

    public Estudiante(int idMiembro, String dni, String nombre, String apellidoPaterno, String apellidoMaterno, Date fechaNacimiento, String numeroTelefonico, String genero) throws Exception {
        super(idMiembro, dni, nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento, numeroTelefonico, genero);
        this.setTipoMiembro("estudiante");
    }
    
}
