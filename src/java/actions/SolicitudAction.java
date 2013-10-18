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
        if (this.carrera_dest!=null && this.carrera_dest.equals("-1")) {
            addFieldError("carrera_dest", "Seleccione una carrera válida");
            return "input";
        }
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
        System.out.println("aqu0");
        try {
            System.out.println("aqu10");
            s = ConexionBD.getConnection().createStatement();
            System.out.println("aqu11");
            rs = s.executeQuery("SELECT * FROM solicitud WHERE usbid='" + usbidSol + "' AND ADVERTENCIA!='-1'");

            if (!rs.next()) {
                System.out.println("aq1");
                rs = s.executeQuery("SELECT * FROM estudiante WHERE usbid='" + usbidSol + "'");
                System.out.println("aq0");
                rs.next();
                System.out.println("aqu6");
                System.out.println(rs.getString("codcarrera"));
                int carreraest = Integer.parseInt(rs.getString("codcarrera"));
                System.out.println(carreraest);
                System.out.println("aqui1");
                if (carreraest == codigoCarrera) {
                    addFieldError("carrera_dest", "No puedes enviar una solicitud a tu misma carrera.");
                    return "input";
                }
                System.out.println("aqui2");
                motivacion = motivacion.replace("\'","");
                
                String advertencia = "";
                boolean aprobado_cb = Estudiante.verificarCicloBasicoAprobado(usbidSol);
                if (!aprobado_cb) {
                    advertencia = "El estudiante no ha aprobado ciclo básico.\n";
                }
                
                int cohorte;
                
                cohorte = Integer.parseInt(usbidSol.substring(0,2));
                System.out.println(cohorte);
                boolean cohortebuena = (cohorte >= 10);
                
                if (!cohortebuena) {
                    advertencia = advertencia + "El estudiante lleva más de 3 años en la carrera.";
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
                System.out.println("aqui3");
                mensaje = "Tu solicitud fue enviada, ¡éxito!";
                
            } else {
                mensaje = "Ya habías enviado una solicitud de cambio.";
               System.out.println("aqui8");
            }
            System.out.println("aqui4");
        } catch (Exception e) {
            System.out.println("Problem in searching the database crearSolicitud");
        }
        return SUCCESS;
    }

    public String listarSolicitudes() throws Exception {

        ResultSet rs = null,rs2=null;
        Statement s = null;
        ConexionBD.establishConnection();

        Map session2 = ActionContext.getContext().getSession();
        String usbido = session2.get("usbid").toString();

        try {
            s = ConexionBD.getConnection().createStatement();
            
            rs= s.executeQuery("SELECT * FROM solicitud natural join carrera WHERE usbid='" + usbido + "' AND ADVERTENCIA='-1' AND SOL_ACEPTADA='T'");
            System.out.println("PP1");
            if(rs.next()){
                mensaje = "Ya se le ha aceptado una solicitud de cambio de carrera en la carrera "+rs.getString("nombre")+".";
                return SUCCESS;
            }
            rs = s.executeQuery("SELECT * FROM solicitud NATURAL JOIN carrera WHERE usbid='" + usbido + "' ORDER BY FECHA");
            System.out.println("PP2");
            if (rs.next()) {
                mensaje = rs.getString("fecha") + "\nHas realizado una solicitud para cambiarte a\n" + rs.getString("nombre");
                if(rs.getString("advertencia").equals("-1")){
                        mensaje += ". Solicitud rechazada.";
                    }
                else{
                    mensaje += ". Solicitud pendiente.";
                }
                while (rs.next()) {
                    mensaje = mensaje + "\n\n" + rs.getString("fecha") + "\nHas realizado una solicitud para cambiarte a\n" + rs.getString("nombre");
                    System.out.println(rs.getString("advertencia"));
                    if(rs.getString("advertencia").equals("-1")){
                        mensaje += ". Solicitud rechazada.";
                    }
                    else{
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
