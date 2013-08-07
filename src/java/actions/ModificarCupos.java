/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import clases.ConexionBD;
import static com.opensymphony.xwork2.Action.SUCCESS;
import java.sql.ResultSet;
import java.sql.Statement;


/**
 *
 * @author CHANGE Gate
 */
public class ModificarCupos {
    
    public String cantCupos;
    
   
    public void setCantCupos(String value){
        cantCupos = value;
    }
    
    public String getCantCupos(){
            return this.cantCupos;
    }
    
    public String actualizarCupos() throws Exception {
        ResultSet rs = null;
        Statement s = null;
        ConexionBD.establishConnection();
        String string = null;
        try{
            s = ConexionBD.getConnection().createStatement();
            System.out.println("Conecto");
            rs = s.executeQuery("SELECT * FROM coordinador WHERE usbid='"+"10-10055"+"'");
            System.out.println("Ejecuto");
            String usbid;
            String carrera;
            
            if (rs.next()) {
                    
                    usbid=rs.getString("usbid");
                    carrera=rs.getString("codcarrera");
                    System.out.println(carrera);
                    
                    for(int x=0;x<cantCupos.length();x++){
                        if(cantCupos.charAt(x)<'0' ||cantCupos.charAt(x)>'9') return "no success";
                        System.out.println(cantCupos.charAt(x));
                    }
                    
                    System.out.println("Bien");
                    s.executeUpdate("UPDATE carrera SET CUPOS='"+cantCupos+"' where codcarrera='"+carrera+"'");
                    
                    
                    return "success";
                    
                } else {
                    return "no success";
                }
            
            
        }
        catch(Exception e) {
                System.out.println("Problem in searching the database 1");
            }
        return "no success";
    }
    
}
