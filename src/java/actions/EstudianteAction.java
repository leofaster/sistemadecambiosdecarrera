/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import clases.Carrera;
import clases.ConexionBD;
import static com.opensymphony.xwork2.Action.SUCCESS;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author CHANGE Gate
 */
public class EstudianteAction extends UsuarioAction {
    
    private double indice;
    private Carrera carrera;
    private boolean cbAprobado;
    private String usbido;
    private String password;

    public String getUsbido() {
        return usbido;
    }

    public void setUsbido(String usbido) {
        this.usbido = usbido;
    }

    

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Carrera getCarrera() {
        return carrera;
    }

    public void setCarrera(Carrera carrera) {
        this.carrera = carrera;
    }

    public double getIndice() {
        return indice;
    }

    public void setIndice(double indice) {
        this.indice = indice;
    }

    public boolean isCbAprobado() {
        return cbAprobado;
    }

    public void setCbAprobado(boolean cbAprobado) {
        this.cbAprobado = cbAprobado;
    }
    
    public String buscarEstudiante() throws Exception {
        
        ResultSet rs = null;
        Statement s = null;
        ConexionBD.establishConnection();
        
        try {
            s = ConexionBD.getConnection().createStatement();
            rs = s.executeQuery("SELECT * FROM estudiante NATURAL JOIN usuario WHERE usbid='"+usbido+"' AND contrasena='"+password+"'");
     
            if (rs.next()) {
                setUsbid(rs.getString("usbid"));
                setCedula(rs.getInt("cedula"));
                setNombre(rs.getString("nombre"));
                setApellido(rs.getString("apellido"));
                indice = (rs.getDouble("indice"));
                cbAprobado = rs.getString("cb_aprobado").equals("true");
            }
            else return "no success"; 
            
        } catch(Exception e) {
            System.out.println("Problem in searching the database 1");
        }
//        ConexionBD.closeConnection();
        return SUCCESS;
    }
}
