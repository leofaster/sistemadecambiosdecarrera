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
public class Carrera implements Serializable {

    private int codcarrera;
    private int cupos;
    private String nombre;
    private Double indice_min;
    private LinkedList<Requisito> lista;

    /**
     *
     * @return
     */
    public int getCodcarrera() {
        return codcarrera;
    }

    /**
     *
     * @param codcarrera
     */
    public void setCodcarrera(int codcarrera) {
        this.codcarrera = codcarrera;
    }

    /**
     *
     * @return
     */
    public int getCupos() {
        return cupos;
    }

    /**
     *
     * @param cupos
     */
    public void setCupos(int cupos) {
        this.cupos = cupos;
    }

    /**
     *
     * @return
     */
    public String getNombre() {
        return nombre;
    }

    /**
     *
     * @param nombre
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     *
     * @return
     */
    public Double getIndice_min() {
        return indice_min;
    }

    /**
     *
     * @param indice_min
     */
    public void setIndice_min(Double indice_min) {
        this.indice_min = indice_min;
    }

    /**
     *
     * @return
     */
    public LinkedList<Requisito> getLista() {
        return lista;
    }

    /**
     *
     * @param lista
     */
    public void setLista(LinkedList<Requisito> lista) {
        this.lista = lista;
    }
}