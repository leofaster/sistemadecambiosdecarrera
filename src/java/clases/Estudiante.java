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
    
    private double indice;
    private int codCarrera;
    private boolean cbAprobado;
    
    //Listade asignaturas que cursa el estudiante
    private LinkedList<AsignaturaConNota> lista_asignaturas;
    
    
    public Estudiante(){}
    
    public Estudiante(double indice, int cod_carrera, boolean cb_aprobado){
        
        this.indice = indice;
        this.codCarrera = cod_carrera;
        this.cbAprobado = cb_aprobado;
        this.lista_asignaturas = new LinkedList();
    }
    
    
    public double getIndice(){
        return this.indice;
    }
    
    
    public void setIndice(double indice){
        this.indice = indice;
    }
    
    
    public int getCodCarrera(){
        return this.codCarrera;
    }
    
    
    public void setCodCarrera( int cod_carrera){
        this.codCarrera = cod_carrera;
    }
    
    public boolean getCbAprovado(){
        return this.cbAprobado;
    }
    
    public void setCbAprobado(boolean aprobado){
        this.cbAprobado = aprobado;
    }
    
    public void addListaAsignaturas(Asignatura asignatura, int nota){
        lista_asignaturas.add(new AsignaturaConNota(asignatura,nota));
    }
    
    
    public List<AsignaturaConNota> getListaAsignaturas(){
        return this.lista_asignaturas;
    }
    
    
}
