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
    
    
    /**
     *
     * @return
     */
    public String getCupos(){
        return this.cupos;
    }
    
    /**
     *
     * @param cupos
     */
    public void setCupos(String cupos){
       this.cupos = cupos;
    }
    
    /**
     *
     * @return
     */
    public String getCuposa(){
        return this.cuposa;
    }
    
    /**
     *
     * @param cupos
     */
    public void setCuposa(String cupos){
       this.cuposa = cupos;
    }
    
    /**
     *
     * @return
     */
    public String getCohorte(){
        return this.cohorte;
    }
    
    /**
     *
     * @param cohorte
     */
    public void setCohorte(String cohorte){
       this.cohorte = cohorte;
    }
    
}
