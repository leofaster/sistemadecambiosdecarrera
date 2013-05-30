/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;
import java.io.Serializable;
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

    public Estudiante getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(Estudiante estudiante) {
        this.estudiante = estudiante;
    }

    public Carrera getCarrera() {
        return carrera;
    }

    public void setCarrera(Carrera carrera) {
        this.carrera = carrera;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
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

    public LinkedList<Reporte> getReportes() {
        return reportes;
    }

    public void setReportes(LinkedList<Reporte> reportes) {
        this.reportes = reportes;
    }    
}
