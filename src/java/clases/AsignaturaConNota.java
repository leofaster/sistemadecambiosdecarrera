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
    
    
    /**
     *
     */
    public AsignaturaConNota(){}
    
    
    /**
     *
     * @param asignatura
     * @param nota
     */
    public AsignaturaConNota(Asignatura asignatura, int nota){
        this.asignatura = new Asignatura(asignatura);
        this.nota = nota;
    }
    
    /**
     *
     * @return
     */
    public int getNota(){
        return this.nota;
    }
    
    /**
     *
     * @param nota
     */
    public void setnota(int nota){
        this.nota= nota;
    }
    
    /**
     *
     * @return
     */
    public Asignatura getAsignatura(){
        return this.asignatura;
    }
    
    /**
     *
     * @param asignatura
     */
    public void setAsignatura(Asignatura asignatura){
        this.asignatura = new Asignatura(asignatura);
    }
    
    
}
