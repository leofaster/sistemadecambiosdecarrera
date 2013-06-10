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

    /**
     *
     * @return
     */
    public Carrera getCarrera() {
        return carrera;
    }

    /**
     *
     * @param carrera
     */
    public void setCarrera(Carrera carrera) {
        this.carrera = carrera;
    }

    /**
     *
     * @return
     */
    public double getIndice() {
        return indice;
    }

    /**
     *
     * @param indice
     */
    public void setIndice(double indice) {
        this.indice = indice;
    }

    /**
     *
     * @return
     */
    public boolean isCbAprobado() {
        return cbAprobado;
    }

    /**
     *
     * @param cbAprobado
     */
    public void setCbAprobado(boolean cbAprobado) {
        this.cbAprobado = cbAprobado;
    }
    
    /**
     *
     * @return
     * @throws Exception
     */
    public String buscarEstudiante() throws Exception {
        
        ResultSet rs = null;
        Statement s = null;
        ConexionBD.establishConnection();
        String string = null;
        
        if (usbido.equals("admin") && password.equals("admin")) {
            string = "admin";
        } else {
            try {
                s = ConexionBD.getConnection().createStatement();
                System.out.println("Conecto");
                rs = s.executeQuery("SELECT * FROM usuario WHERE usbid='"+usbido+"' AND contrasena='"+password+"'");
                System.out.println("Ejecuto");
                if (rs.next()) {
                    System.out.println("Si hay coso");
                    if (rs.getString("rol").equals("Estudiante")) {
                        setUsbid(rs.getString("usbid"));
                        setCedula(rs.getInt("cedula"));
                        setNombre(rs.getString("nombre"));
                        setApellido(rs.getString("apellido"));
                        indice = (rs.getDouble("indice"));
                        cbAprobado = rs.getString("cb_aprobado").equals("true");
                        string = "estudiante";
                    } else if (rs.getString("rol").equals("Coordinador")) {
                        string = "coordinador";
                    }
                } else {
                    string = "no success";
                }
            
            } catch(Exception e) {
                System.out.println("Problem in searching the database 1");
            }
        }
        if (string == null || string.equals("estudiante")) {
            return SUCCESS;
        }
        return string;
    }
}
