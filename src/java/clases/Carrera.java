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
public class Carrera implements Serializable{
    
    private int codigo,cupos;
    private double indiceMinimo;
    private String nombre;
    
    
    public int getCupos(){
        return this.cupos;
    }
    
    public void serCupos(int cupos){
        this.cupos=cupos;
    }    
    
    public int getCodigo(){
        return this.codigo;
    }
    
    public void serCodigo(int codigo_carrera){
        this.codigo=codigo_carrera;
    }
    
    public String getNombre(){
        return this.nombre;
    }
    
    public void setNombre(String nombre_carrera){
        this.nombre = nombre_carrera;
    }
    
    public double getIndiceMinimo(){
        return this.indiceMinimo;
    }
    
    public void setIndiceMinimo(double indice){
        this.indiceMinimo = indice;
    }
    
    
}
