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
public class AsignaturaConNota implements Serializable{
    
    private Asignatura asignatura;
    private int nota;
    
    
    public AsignaturaConNota(){}
    
    
    public AsignaturaConNota(Asignatura asignatura, int nota){
        this.asignatura = new Asignatura(asignatura);
        this.nota = nota;
    }
    
    public int getNota(){
        return this.nota;
    }
    
    public void setnota(int nota){
        this.nota= nota;
    }
    
    public Asignatura getAsignatura(){
        return this.asignatura;
    }
    
    public void setAsignatura(Asignatura asignatura){
        this.asignatura = new Asignatura(asignatura);
    }
    
    
}
