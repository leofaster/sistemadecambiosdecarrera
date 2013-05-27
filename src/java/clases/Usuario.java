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
public class Usuario implements Serializable{
    private int usbid,cedula;
    private String nombre,apellido,contrasena;
       
    public int getUsbid(){
         return usbid;
    }
    
    public void setUsbid(int numero){
        this.usbid = numero;
    }
    
    public int getCedula(){
         return cedula;
    }
    
    public void setCedula(int numero){
        this.cedula = numero;
    }
    
    public String getNombre(){
           return this.nombre;
    }
    
    public void setNombre(String nombre){
        this.nombre = new String(nombre);
    }
    
    public String getApellido(){
           return this.apellido;
    }
    
    public void setApellido(String nombre){
        this.apellido = new String(nombre);
    }
   
    
    public String getContrasena(){
        return this.contrasena;
    }
    
    public void setContrasena(String passwd){
        this.contrasena = new String(passwd);
    }
}
