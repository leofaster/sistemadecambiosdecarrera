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
    private String usbidSol;
    private Estudiante estudiante;
    private int codigoCarrera;
    private String advertencia;
    private boolean solAceptada = false;
    private boolean ccAprobado;
    private String motivacion;
    String carrera_dest;

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
    
    /**
     *
     * @return
     * @throws Exception
     */
    public String mostrarSolicitud() throws Exception {
        
        ResultSet rs = null;
        Statement s = null;

//        ConexionBD.establishConnection();
            System.out.println(usbidSol);
            System.out.println(carrera_dest);
            System.out.println(ccAprobado);
            System.out.println(motivacion);
            this.setCodigoCarrera(Integer.parseInt(carrera_dest.substring(0,4)));
            System.out.println(this.codigoCarrera);

        ConexionBD.establishConnection();
        

        try {
            s = ConexionBD.getConnection().createStatement();
            
            rs = s.executeQuery("SELECT * FROM solicitud WHERE usbid='"+usbidSol+"'");// AND "
                    //+"codCarrera=CAST('"+codigoCarrera+"' AS INTEGER)");
            if (!rs.next()) {
                s.executeUpdate("INSERT INTO SOLICITUD VALUES('"
                + usbidSol
                +"',"
                +"CAST('"+codigoCarrera+"' AS INTEGER),"
                +"NOW(),"
                +"'',"
                +"false,"
                +"false"+","
                +"'"+motivacion+"')"
                 );
                addActionMessage("Tu solicitud fue enviada.");
                return SUCCESS;
            }
            else
               return "no success";
        } catch(Exception e) {
            System.out.println("Problem in searching the database 2");
        }
        
        
        return SUCCESS;
       
    }
}
