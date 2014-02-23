/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import clases.Carrera;
import clases.ConexionBD;
import clases.EmailSender;
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
public class Cambio extends ActionSupport {

    private String usbidSol;
    private Estudiante estudiante;
    private int codigoCarrera;
    private String advertencia;
    private boolean solAceptada = false;
    private boolean ccAprobado;
    private String motivacion;
    private String carrera_dest;
    private String mensaje;

    /**
     *
     * @return
     */
    public String getMensaje() {
        return mensaje;
    }

    /**
     *
     * @param mensaje
     */
    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    /**
     *
     * @return
     */
    public String getCarrera_dest() {
        return carrera_dest;
    }

    /**
     *
     * @param carrera_dest
     */
    public void setCarrera_dest(String carrera_dest) {
        this.carrera_dest = carrera_dest;
    }

    /**
     *
     * @return
     */
    public String getUsbidSol() {
        return usbidSol;
    }

    /**
     *
     * @param usbidSol
     */
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

    /**
     *
     * @return
     */
    public String solicitarCambio() {
        return SUCCESS;
    }

    /**
     *
     * @return @throws Exception
     */
    public String listarSolicitudes() throws Exception {

        ResultSet rs = null, rs2 = null;
        Statement s = null;
        ConexionBD.establishConnection();

        Map session2 = ActionContext.getContext().getSession();
        String usbido = session2.get("usbid").toString();

        try {
            s = ConexionBD.getConnection().createStatement();

            rs = s.executeQuery("SELECT * FROM solicitud natural join carrera WHERE usbid='" + usbido + "' AND ADVERTENCIA='-1' AND SOL_ACEPTADA='T'");
            System.out.println("PP1");
            if (rs.next()) {
                 addActionError("Error en la Solicitud.");
                mensaje = "Ya se le ha aceptado una solicitud de\ncambio de carrera a " + rs.getString("nombre") + ".";
                return SUCCESS;
            }
            rs = s.executeQuery("SELECT * FROM solicitud NATURAL JOIN carrera WHERE usbid='" + usbido + "' ORDER BY FECHA");
            System.out.println("PP2");
            if (rs.next()) {
                mensaje = rs.getString("fecha") + "\nHas realizado una solicitud para cambiarte a\n" + rs.getString("nombre");
                if (rs.getString("advertencia").equals("-1")) {
                    mensaje += ". Solicitud rechazada.";
                } else {
                    mensaje += ". Solicitud pendiente.";
                }
                while (rs.next()) {
                    mensaje = mensaje + "\n\n" + rs.getString("fecha") + "\nHas realizado una solicitud para cambiarte a\n" + rs.getString("nombre");
                    System.out.println(rs.getString("advertencia"));
                    if (rs.getString("advertencia").equals("-1")) {
                        mensaje += ". Solicitud rechazada.";
                    } else {
                        mensaje += ". Solicitud pendiente.";
                    }
                }
            } else {
                mensaje = "No has enviado solicitudes";
            }

        } catch (Exception e) {
            System.out.println("Problem in searching the database listarSolicitudes");
        }
        return SUCCESS;
    }
}
