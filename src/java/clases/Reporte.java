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
    
    
    public Reporte(){}
    
    public Reporte(Reporte reporte){
        this.codigo = reporte.codigo;
        this.descripcion = reporte.descripcion;
    }
    
    public int getCodigo(){
        return this.codigo;
    }
    
    public void setCodigo(int identificador){
        this.codigo = identificador;
    }
    
    public String getDescripcion(){
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion){
        this.descripcion = descripcion;
    }
    
}
