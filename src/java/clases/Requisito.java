/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.io.Serializable;

/**
 *
 * @author CHANGE Gate
 */
public class Requisito implements Serializable {

    private int codigo;
    private String descripcion;

    /**
     *
     */
    public Requisito() {
    }

    /**
     *
     * @param requisito
     */
    public Requisito(Requisito requisito) {
        this.codigo = requisito.getCodigo();
        this.descripcion = new String(requisito.getDescripcion());
    }

    /**
     *
     * @return
     */
    public int getCodigo() {
        return this.codigo;
    }

    /**
     *
     * @param codigo
     */
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    /**
     *
     * @return
     */
    public String getDescripcion() {
        return this.descripcion;
    }

    /**
     *
     * @param descripcion
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = new String(descripcion);
    }
}
