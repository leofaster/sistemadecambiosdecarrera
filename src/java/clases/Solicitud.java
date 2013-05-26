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
public class Solicitud implements Serializable{
    private int numero;
    private boolean ccAprobado,solAceptada;
    private String advertencia, motivacion;
    private LinkedList<Reporte> lista;
    
    public int getNumero(){
        return this.numero;
    }
    public void setNumero(int numero){
        this.numero = numero;
    }
    
    public boolean getCcAprobado(){
        return this.ccAprobado;
    }
    
    public void setCcAprobado(boolean aprobado){
        this.ccAprobado = aprobado;
    }
    
    public boolean getSolAceptada(){
        return this.solAceptada;
    }
    
    public void setSolAceptada(boolean aceptada){
        this.solAceptada = aceptada;
    }
    
    public String getAdvertencia(){
        return this.advertencia;
    }
    
    public void setAdvertencia(String advertencia){
        this.advertencia = new String(advertencia);
    }
    
    public String getMotivacion(){
        return this.motivacion;
    }
    
    public void setMotivacion(String motivacion){
        this.motivacion = new String(motivacion);
    }
    
    public void addLista(Reporte reporte){
        lista.add(new Reporte(reporte));
    }
    
    public LinkedList<Reporte> getLista(){
        return this.lista;
    }
}
