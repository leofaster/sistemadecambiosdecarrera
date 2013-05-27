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
public class Asignatura implements Serializable{
    private String nombre;
    private int codigo;
    
    
    public Asignatura(){
        this.nombre = "";
        this.codigo = -1;
    }
    
    public Asignatura( Asignatura asign ){
        
        this.nombre = asign.getNombre();
        this.codigo = asign.getCodigo();
    }
    
    public void setNombre(String nombre_asignatura){
        this.nombre = new String(nombre_asignatura);
    }
    
    public String getNombre(){
        return this.nombre;
    }
    
    public void setCodigo(int codigo_asignatura){
        this.codigo = codigo_asignatura;
    }
    
    public int getCodigo(){
        return this.codigo;
    }
    
    
}
