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
public class Cohorte implements Serializable {
    private String cohorte;
    private String cupos;
    private String cuposa;
    
    
    public String getCupos(){
        return this.cupos;
    }
    
    public void setCupos(String cupos){
       this.cupos = cupos;
    }
    
    public String getCuposa(){
        return this.cuposa;
    }
    
    public void setCuposa(String cupos){
       this.cuposa = cupos;
    }
    
    public String getCohorte(){
        return this.cohorte;
    }
    
    public void setCohorte(String cohorte){
       this.cohorte = cohorte;
    }
    
}
