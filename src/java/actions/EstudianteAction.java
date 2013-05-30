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
public class EstudianteAction extends UsuarioAction {
    
    private double indice;
    private boolean cbAprobado;

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
            rs = s.executeQuery("SELECT * FROM estudiante NATURAL JOIN usuario WHERE usbid='10-10406'");
            if (rs.next()) {
                setUsbid(rs.getString("usbid"));
                setCi(rs.getString("ci"));
                setNombre(rs.getString("nombre"));
                setApellido(rs.getString("apellido"));
                indice = Double.parseDouble(rs.getString("indice"));
                cbAprobado = rs.getString("cb_aprobado").equals("true");
            }
        } catch(Exception e) {
            System.out.println("Problem in searching the database 1");
        }
//        ConexionBD.closeConnection();
        return SUCCESS;
    }
}
