/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import clases.ConexionBD;
import clases.Estudiante;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Map;

/**
 *
 * @author CHANGE Gate
 */
public class SolicitudAction extends ActionSupport {

    private String usbidSol;
    private Estudiante estudiante;
    private int codigoCarrera;
    private String advertencia;
    private boolean solAceptada = false;
    private boolean ccAprobado;
    private String motivacion;
    private String carrera_dest;
    private String mensaje;

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getCarrera_dest() {
        return carrera_dest;
    }

    public void setCarrera_dest(String carrera_dest) {
        this.carrera_dest = carrera_dest;
    }

    public String getUsbidSol() {
        return usbidSol;
    }

    public void setUsbidSol(String usbidSol) {
        this.usbidSol = usbidSol;
    }

    /**
     *
     * @return
     */
    public Estudiante getEstudiante() {
        return estudiante;
    }

    /**
     *
     * @param estudiante
     */
    public void setEstudiante(Estudiante estudiante) {
        this.estudiante = estudiante;
    }

    /**
     *
     * @return
     */
    public int getCodigoCarrera() {
        return codigoCarrera;
    }

    /**
     *
     * @param codigoCarrera
     */
    public void setCodigoCarrera(int codigoCarrera) {
        this.codigoCarrera = codigoCarrera;
    }

    /**
     *
     * @return
     */
    public String getAdvertencia() {
        return advertencia;
    }

    /**
     *
     * @param advertencia
     */
    public void setAdvertencia(String advertencia) {
        this.advertencia = advertencia;
    }

    /**
     *
     * @return
     */
    public boolean isSolAceptada() {
        return solAceptada;
    }

    /**
     *
     * @param solAceptada
     */
    public void setSolAceptada(boolean solAceptada) {
        this.solAceptada = solAceptada;
    }

    /**
     *
     * @return
     */
    public boolean isCcAprobado() {
        return ccAprobado;
    }

    /**
     *
     * @param ccAprobado
     */
    public void setCcAprobado(boolean ccAprobado) {
        this.ccAprobado = ccAprobado;
    }

    /**
     *
     * @return
     */
    public String getMotivacion() {
        return motivacion;
    }

    /**
     *
     * @param motivacion
     */
    public void setMotivacion(String motivacion) {
        this.motivacion = motivacion;
    }
    
    public String solicitarCambio() {
        return SUCCESS;
    }

    /**
     *
     * @return @throws Exception
     */
    public String crearSolicitud() throws Exception {

        if (getMotivacion().length() == 0) {
            addFieldError("motivacion", "No puedes dejar este campo vacío.");
            return "input";
        }

        ResultSet rs = null;
        Statement s = null;

        mensaje = null;
        Map session2 = ActionContext.getContext().getSession();
        usbidSol = session2.get("usbid").toString();

        this.setCodigoCarrera(Integer.parseInt(carrera_dest.substring(0, 4)));
        ConexionBD.establishConnection();

        try {
            s = ConexionBD.getConnection().createStatement();
            rs = s.executeQuery("SELECT * FROM solicitud WHERE usbid='" + usbidSol + "'");

            if (!rs.next()) {

                rs = s.executeQuery("SELECT * FROM estudiante WHERE usbid='" + usbidSol + "'");
                rs.next();

                int carreraest = Integer.parseInt(rs.getString("codcarrera"));

                if (carreraest == codigoCarrera) {
                    addFieldError("carrera_dest", "No puedes enviar una solicitud a tu misma carrera.");
                    return "input";
                }
                
                motivacion = motivacion.replace("\'","");
                
                s.executeUpdate("INSERT INTO SOLICITUD VALUES('"
                        + usbidSol
                        + "',"
                        + "CAST('" + codigoCarrera + "' AS INTEGER),"
                        + "NOW(),"
                        + "'',"
                        + "false,"
                        + "false" + ","
                        + "'" + motivacion + "')");

                mensaje = "Tu solicitud fue enviada, ¡éxito!";
            } else {
                mensaje = "Ya habías enviado una solicitud de cambio.";
            }
        } catch (Exception e) {
            System.out.println("Problem in searching the database crearSolicitud");
        }
        return SUCCESS;
    }

    public String listarSolicitudes() throws Exception {

        ResultSet rs = null;
        Statement s = null;
        ConexionBD.establishConnection();

        Map session2 = ActionContext.getContext().getSession();
        String usbido = session2.get("usbid").toString();

        try {
            s = ConexionBD.getConnection().createStatement();
            rs = s.executeQuery("SELECT * FROM solicitud NATURAL JOIN carrera WHERE usbid='" + usbido + "'");

            if (rs.next()) {
                mensaje = rs.getString("fecha") + "\nHas realizado una solicitud para cambiarte a " + rs.getString("nombre");
            } else {
                mensaje = "No has enviado solicitudes";
            }

        } catch (Exception e) {
            System.out.println("Problem in searching the database listarSolicitudes");
        }
        return SUCCESS;
    }
}
