/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import clases.Carrera;
import clases.Cohorte;
import clases.ConexionBD;
import clases.EmailSender;
import clases.Estudiante;
import clases.Solicitud;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import java.io.Serializable;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author CHANGE Gate
 */
public class SolicitudAction extends ActionSupport implements ServletRequestAware {

    private String usbidSol;
    private Estudiante estudiante;
    private int codigoCarrera;
    private String advertencia;
    private boolean solAceptada = false;
    private boolean ccAprobado;
    private String motivacion;
    private String carrera_dest;
    private String mensaje;
    protected HttpServletRequest request;

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

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }
    
    @Override
    public void setServletRequest(HttpServletRequest request) {
        this.request = request;
    }
    /**
     *
     * @return @throws Exception
     * @throws Exception
     */
    public String crearSolicitud() throws Exception {

        if (this.carrera_dest != null && this.carrera_dest.equals("-1")) {
            addFieldError("carrera_dest", "Seleccione una carrera válida");
            addActionError("Error en la Solicitud.");
            return "input";
        }

        if (getMotivacion().length() == 0) {
            addFieldError("motivacion", "No puedes dejar este campo vacío.");
            addActionError("Error en la Solicitud.");
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

            // Pregunta si el estudiante no tiene solicitudes aceptadas
            rs = s.executeQuery("SELECT * FROM solicitud "
                    + "WHERE usbid='" + usbidSol + "' "
                    + "AND SOL_ACEPTADA='A'");
            if (rs.next()) { // Si las tiene, error
                addActionError("Error en la Solicitud.");
                mensaje = "Ya se le ha aceptado una solicitud.";
                return SUCCESS;
            }

            // Pregunta si el estudiante tiene solicitudes pendientes
            rs = s.executeQuery("SELECT * FROM solicitud "
                    + "WHERE usbid='" + usbidSol + "' "
                    + "AND SOL_ACEPTADA='P'");

            if (!rs.next()) { // Si no las tiene, la crea

                Estudiante est = new Estudiante();
                est.cargarDatos(usbidSol);

                // Si el estudiante trata de enviar una solicitud a su misma carrera
                if (est.getCarreraOrigen().getCodcarrera() == codigoCarrera) {
                    addActionError("Error en la Solicitud.");
                    addFieldError("carrera_dest", "No puedes enviar una solicitud a tu misma carrera.");
                    return "input";
                }

                // Evitando el SQL injection
                motivacion = motivacion.replace("\'", "");

                String advertencia = "";
                // Verificación de ciclo básico aprobado
                boolean aprobado_cb = est.verificarCicloBasicoAprobado();
                if (!aprobado_cb) {
                    advertencia = "El estudiante no ha aprobado ciclo básico.\n";
                }

                // Verificación de que el estudiante tenga más de 3 años en su carrera
                int cohorte;

                cohorte = Integer.parseInt(usbidSol.substring(0, 2));
                System.out.println(cohorte);
                boolean cohortebuena = (cohorte >= 11);

                if (!cohortebuena) {
                    advertencia = advertencia + "El estudiante lleva más de 3 años en la carrera.\n";
                }

                // Verificación de que el estudiante tenga el índice mínimo para 
                // cambiarse a esa carrera
                boolean indices = (est.getIndice() >= est.getCarreraOrigen().getIndiceMin());

                if (!indices) {
                    advertencia = advertencia + "El índice es menor que el requerido.";
                }

                System.out.println(advertencia);

                // Se crea la solicitud
                s.executeUpdate("INSERT INTO SOLICITUD VALUES('"
                        + usbidSol + "',"
                        + "CAST('" + codigoCarrera + "' AS INTEGER),"
                        + "NOW(),'"
                        + advertencia + "',"
                        + "'P',"
                        + "'P',"
                        + "'P',"
                        + "'" + motivacion + "')");

                mensaje = "Tu solicitud fue enviada, ¡éxito!";
                addActionMessage("Solicitud Exitosa.");

                String a = "rbmachado.g@gmail.com"; // Aqui se forma el correo del coordinador
                String asunto = "Solicitud de cambio de carrera de " + usbidSol;
                String cuerpo = "El estudiante con el carnet " + usbidSol + " desea cambiarse a su carrera. "
                        + "Ingrese al sistema para revisar su solicitud.";

//                EmailSender emailer = new EmailSender(a, asunto, cuerpo);
//                emailer.sendEmail();

                // Si ya tenía solicitudes enviadas
            } else {
                addActionError("Error en la Solicitud.");
                mensaje = "Ya habías enviado una solicitud de cambio.";
            }

        } catch (Exception e) {
            System.out.println("Problem in searching the database crearSolicitud");
        }
        return SUCCESS;
    }

    /**
     *
     * @return @throws Exception
     */
    public String listarSolicitudes() throws Exception {

        ResultSet rs;
        Statement s;
        ConexionBD.establishConnection();

        Map session2 = ActionContext.getContext().getSession();
        String usbido = session2.get("usbid").toString();

        try {
            s = ConexionBD.getConnection().createStatement();

            // Si ya se le aceptó una solicitud
            /*rs = s.executeQuery("SELECT * FROM solicitud "
             + "natural join carrera "
             + "WHERE usbid='" + usbido + "' "
             + "AND SOL_ACEPTADA='A'"
             + "ORDER BY  fecha");
            
             if (rs.next()) {
             mensaje = "Ya se le ha aceptado una solicitud de\ncambio de carrera a " + rs.getString("nombre") + ".";
             return SUCCESS;
             }*/

            // Lista el historial de solicitudes
            rs = s.executeQuery("SELECT * FROM solicitud "
                    + "NATURAL JOIN carrera "
                    + "WHERE usbid='" + usbido + "' ORDER BY FECHA");

            List<Solicitud> li = new ArrayList<Solicitud>();
            Solicitud solicitudAux;
            Carrera carreraAux;
            System.out.println("A listar solicitudes...");
            int i = 0;
            while (rs.next()){
                i = i + 1 ;

                solicitudAux = new Solicitud();
                carreraAux = new Carrera();
                
                solicitudAux.setFecha(rs.getString("FECHA"));
                solicitudAux.setCarrera(carreraAux);
                carreraAux.setNombre(rs.getString("NOMBRE"));
                if (rs.getString("SOL_ACEPTADA").equals("R")) {
                    solicitudAux.setPreAceptacion("Rechazada");
                } else if (rs.getString("SOL_ACEPTADA").equals("A")) {
                    solicitudAux.setPreAceptacion("Aceptada");
                } else {
                    solicitudAux.setPreAceptacion("En espera.");
                }
                li.add(solicitudAux);
            }
            
            request.setAttribute("listaSolicitudes", li);
            rs.close();
            s.close();
            System.out.println("Tamanho: " + li.size());
            return SUCCESS;
            
            /*if (rs.next()) {
                mensaje = rs.getString("fecha") + "\nHas realizado una solicitud para cambiarte a\n" + rs.getString("nombre");
                if (rs.getString("SOL_ACEPTADA").equals("R")) {
                    mensaje += ". Solicitud rechazada.";
                } else {
                    mensaje += ". Solicitud pendiente.";
                }

                while (rs.next()) {
                    mensaje = mensaje + "\n\n" + rs.getString("fecha") + "\nHas realizado una solicitud para cambiarte a\n" + rs.getString("nombre");
                    if (rs.getString("SOL_ACEPTADA").equals("R")) {
                        mensaje += ". Solicitud rechazada.";
                    } else {
                        mensaje += ". Solicitud pendiente.";
                    }
                }

            } else {
                mensaje = "No has enviado solicitudes";
            }
            */
        } catch (Exception e) {
            System.out.println("Problem in searching the database listarSolicitudes");
            return "no success";
        }

    }
}