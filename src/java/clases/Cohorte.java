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
    
    
    public String getCupos(){
        return this.cupos;
    }
    
    public void setCupos(String cupos){
       this.cupos = cupos;
    }
    
    public String getCohorte(){
        return this.cohorte;
    }
    
    public void setCohorte(String cohorte){
       this.cohorte = cohorte;
    }
    
}
