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
     * @throws Exception
     */
    public String crearSolicitud() throws Exception {

        if (this.carrera_dest != null && this.carrera_dest.equals("-1")) {
            addFieldError("carrera_dest", "Seleccione una carrera válida");
            return "input";
        }
        if (getMotivacion().length() == 0) {
            addFieldError("motivacion", "No puedes dejar este campo vacío.");
            return "input";
        }

        ResultSet rs;
        Statement s;

        mensaje = null;
        Map session2 = ActionContext.getContext().getSession();
        usbidSol = session2.get("usbid").toString();

        this.setCodigoCarrera(Integer.parseInt(carrera_dest.substring(0, 4)));
        ConexionBD.establishConnection();

        try {
            s = ConexionBD.getConnection().createStatement();
            rs = s.executeQuery("SELECT * FROM solicitud WHERE usbid='" + usbidSol + "' AND ADVERTENCIA='-1' AND SOL_ACEPTADA='T'");
            if (rs.next()) {
                mensaje = "Ya se le ha aceptado una solicitud.";
                return SUCCESS;
            }
            rs = s.executeQuery("SELECT * FROM solicitud WHERE usbid='" + usbidSol + "' AND ADVERTENCIA!='-1'");

            if (!rs.next()) {

                Estudiante est = new Estudiante(usbidSol);

                if (est.getCarreraOrigen().getCodcarrera() == codigoCarrera) {
                    addFieldError("carrera_dest", "No puedes enviar una solicitud a tu misma carrera.");
                    return "input";
                }

                motivacion = motivacion.replace("\'", "");

                String advertencia = "";
                boolean aprobado_cb = est.verificarCicloBasicoAprobado();
                if (!aprobado_cb) {
                    advertencia = "El estudiante no ha aprobado ciclo básico.\n";
                }

                int cohorte;

                cohorte = Integer.parseInt(usbidSol.substring(0, 2));
                System.out.println(cohorte);
                boolean cohortebuena = (cohorte >= 10);

                if (!cohortebuena) {
                    advertencia = advertencia + "El estudiante lleva más de 3 años en la carrera.\n";
                }

                boolean indices = (est.getIndice() >= est.getCarreraOrigen().getIndiceMin());

                if (!indices) {
                    advertencia = advertencia + "El índice es menor que el requerido.";
                }

                System.out.println(advertencia);

                s.executeUpdate("INSERT INTO SOLICITUD VALUES('"
                        + usbidSol
                        + "',"
                        + "CAST('" + codigoCarrera + "' AS INTEGER),"
                        + "NOW(),'"
                        + advertencia + "',"
                        + "false,"
                        + "false" + ","
                        + "'" + motivacion + "')");
                mensaje = "Tu solicitud fue enviada, ¡éxito!";

                String a = "rbmachado.g@gmail.com"; // Aqui se forma el correo del coordinador
                String asunto = "Solicitud de cambio de carrera de " + usbidSol;
                String cuerpo = "El estudiante con el carnet " + usbidSol + " desea cambiarse a su carrera. "
                        + "Ingrese al sistema para revisar su solicitud.";

                EmailSender emailer = new EmailSender(a, asunto, cuerpo);
                emailer.sendEmail();

            } else {

                mensaje = "Ya habías enviado una solicitud de cambio.";
            }
        } catch (Exception e) {
            System.out.println("Problem in searching the database crearSolicitud");
        }
        return SUCCESS;
    }

    /**
     *
     * @return
     * @throws Exception
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
