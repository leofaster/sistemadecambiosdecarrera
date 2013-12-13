/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

/**
 *
 * @author CHANGE Gate
 */
public class Solicitud implements Serializable {

    private Estudiante estudiante;
    private Carrera carrera;
    private Date fecha;
    private String advertencia;
    private boolean solAceptada;
    private boolean ccAprobado;
    private String motivacion;
    private LinkedList<Reporte> reportes;
    private boolean recomendada;

    public boolean isRecomendada() {
        return recomendada;
    }

    public void setRecomendada(boolean recomendada) {
        this.recomendada = recomendada;
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
    public Carrera getCarrera() {
        return carrera;
    }

    /**
     *
     * @param carrera
     */
    public void setCarrera(Carrera carrera) {
        this.carrera = carrera;
    }

    /**
     *
     * @return
     */
    public Date getFecha() {
        return fecha;
    }

    /**
     *
     * @param fecha
     */
    public void setFecha(Date fecha) {
        this.fecha = fecha;
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
    public LinkedList<Reporte> getReportes() {
        return reportes;
    }

    /**
     *
     * @param reportes
     */
    public void setReportes(LinkedList<Reporte> reportes) {
        this.reportes = reportes;
    }

    /**
     *
     * @param usbido
     * @return
     * @throws Exception
     */
    public static String verificarSolicitudes(String usbido) throws Exception {

        String mensaje = null;
        ResultSet rs = null;
        Statement s = null;
        ConexionBD.establishConnection();

        try {
            s = ConexionBD.getConnection().createStatement();
            System.out.println("Conecto");
            rs = s.executeQuery("SELECT * FROM solicitud NATURAL JOIN carrera WHERE usbid='" + usbido + "'");
            System.out.println("Ejecuto");

            if (rs.next()) {
                mensaje = rs.getString("fecha") + "\nHas realizado una solicitud para cambiarte a " + rs.getString("nombre");
            } else {
                mensaje = "No has enviado solcitudes";
            }

        } catch (Exception e) {
            System.out.println("Problem in searching the database 1");
        }

        System.out.println(mensaje);
        return mensaje;
    }
}
