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
public class Asignatura implements Serializable {

    private String nombre;
    private int codigo;
    private String codigoS;

    /**
     *
     */
    public Asignatura() {
        this.nombre = "";
        this.codigo = -1;
    }
    
    /**
     *
     * @return
     */
    public String getCodigoS(){
       return this.codigoS;
    }
    /**
     *
     * @param value
     */
    public void setCodigoS(String value){
       this.codigoS=value;
    }

    /**
     *
     * @param asign
     */
    public Asignatura(Asignatura asign) {

        this.nombre = asign.getNombre();
        this.codigo = asign.getCodigo();
        this.codigoS = asign.getCodigoS();
    }

    /**
     *
     * @param nombre_asignatura
     */
    public void setNombre(String nombre_asignatura) {
        this.nombre = new String(nombre_asignatura);
    }

    /**
     *
     * @return
     */
    public String getNombre() {
        return this.nombre;
    }

    /**
     *
     * @param codigo_asignatura
     */
    public void setCodigo(int codigo_asignatura) {
        this.codigo = codigo_asignatura;
    }

    /**
     *
     * @return
     */
    public int getCodigo() {
        return this.codigo;
    }
}
