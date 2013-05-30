/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;
import java.util.*;
import java.io.Serializable;
/**
 *
 * @author CHANGE Gate
 */
public class Estudiante extends Usuario implements Serializable{
    
    private String usbid;
    private double indice;
    private Carrera carreraOrigen;
    private boolean cbAprobado;
    // Listade asignaturas que cursa el estudiante
    private LinkedList<AsignaturaConNota> asignaturas;

    public double getIndice() {
        return indice;
    }

    public void setIndice(double indice) {
        this.indice = indice;
    }

    public Carrera getCarreraOrigen() {
        return carreraOrigen;
    }

    public void setCarreraOrigen(Carrera carreraOrigen) {
        this.carreraOrigen = carreraOrigen;
    }

    public boolean isCbAprobado() {
        return cbAprobado;
    }

    public void setCbAprobado(boolean cbAprobado) {
        this.cbAprobado = cbAprobado;
    }

    public LinkedList<AsignaturaConNota> getAsignaturas() {
        return asignaturas;
    }

    public void setAsignaturas(LinkedList<AsignaturaConNota> asignaturas) {
        this.asignaturas = asignaturas;
    }    
}
