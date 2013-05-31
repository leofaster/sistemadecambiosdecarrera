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

public class Reporte implements Serializable{
    private int codigo;
    private String descripcion;
    
    
    /**
     *
     */
    public Reporte(){}
    
    /**
     *
     * @param reporte
     */
    public Reporte(Reporte reporte){
        this.codigo = reporte.codigo;
        this.descripcion = reporte.descripcion;
    }
    
    /**
     *
     * @return
     */
    public int getCodigo(){
        return this.codigo;
    }
    
    /**
     *
     * @param identificador
     */
    public void setCodigo(int identificador){
        this.codigo = identificador;
    }
    
    /**
     *
     * @return
     */
    public String getDescripcion(){
        return this.descripcion;
    }
    
    /**
     *
     * @param descripcion
     */
    public void setDescripcion(String descripcion){
        this.descripcion = new String(descripcion);
    }
    
}
