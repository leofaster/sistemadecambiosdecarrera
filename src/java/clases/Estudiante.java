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

    /**
     *
     * @return
     */
    public double getIndice() {
        return indice;
    }

    /**
     *
     * @param indice
     */
    public void setIndice(double indice) {
        this.indice = indice;
    }

    /**
     *
     * @return
     */
    public Carrera getCarreraOrigen() {
        return carreraOrigen;
    }

    /**
     *
     * @param carreraOrigen
     */
    public void setCarreraOrigen(Carrera carreraOrigen) {
        this.carreraOrigen = carreraOrigen;
    }

    /**
     *
     * @return
     */
    public boolean isCbAprobado() {
        return cbAprobado;
    }

    /**
     *
     * @param cbAprobado
     */
    public void setCbAprobado(boolean cbAprobado) {
        this.cbAprobado = cbAprobado;
    }

    /**
     *
     * @return
     */
    public LinkedList<AsignaturaConNota> getAsignaturas() {
        return asignaturas;
    }

    /**
     *
     * @param asignaturas
     */
    public void setAsignaturas(LinkedList<AsignaturaConNota> asignaturas) {
        this.asignaturas = asignaturas;
    }    
}
