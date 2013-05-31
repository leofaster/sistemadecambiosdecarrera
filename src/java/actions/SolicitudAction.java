/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import clases.ConexionBD;
import clases.Estudiante;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author CHANGE Gate
 */
public class SolicitudAction extends ActionSupport {
    
    private Estudiante estudiante;
    private int codigoCarrera;
    private String advertencia;
    private boolean solAceptada = false;
    private boolean ccAprobado;
    private String motivacion;

    public Estudiante getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(Estudiante estudiante) {
        this.estudiante = estudiante;
    }

    public int getCodigoCarrera() {
        return codigoCarrera;
    }

    public void setCodigoCarrera(int codigoCarrera) {
        this.codigoCarrera = codigoCarrera;
    }

    public String getAdvertencia() {
        return advertencia;
    }

    public void setAdvertencia(String advertencia) {
        this.advertencia = advertencia;
    }

    public boolean isSolAceptada() {
        return solAceptada;
    }

    public void setSolAceptada(boolean solAceptada) {
        this.solAceptada = solAceptada;
    }

    public boolean isCcAprobado() {
        return ccAprobado;
    }

    public void setCcAprobado(boolean ccAprobado) {
        this.ccAprobado = ccAprobado;
    }

    public String getMotivacion() {
        return motivacion;
    }

    public void setMotivacion(String motivacion) {
        this.motivacion = motivacion;
    }
    
    public String mostrarSolicitud() throws Exception {
        
        ResultSet rs = null;
        Statement s = null;
        ConexionBD.establishConnection();
        
        try {
            s = ConexionBD.getConnection().createStatement();
            rs = s.executeQuery("SELECT * FROM estudiante NATURAL JOIN usuario WHERE usbid='10-10406'");
            if (rs.next()) {
                estudiante = new Estudiante();
                estudiante.setUsbid(rs.getString("usbid"));
                estudiante.setCedula(rs.getInt("cedula"));
                estudiante.setNombre(rs.getString("nombre"));
                estudiante.setApellido(rs.getString("apellido"));
                estudiante.setIndice(rs.getDouble("indice"));
                estudiante.setCbAprobado(rs.getString("cb_aprobado").equals("true"));
            }
        } catch(Exception e) {
            System.out.println("Problem in searching the database 1");
        }
        
        
        return SUCCESS;
    }
}
