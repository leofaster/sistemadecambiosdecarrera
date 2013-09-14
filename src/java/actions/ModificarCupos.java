/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import clases.ConexionBD;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Map;

/**
 *
 * @author CHANGE Gate
 */
public class ModificarCupos {

    public String cantCupos;
    public String carrera;
    public String cupos;

    public void setCantCupos(String value) {
        cantCupos = value;
    }

    public String getCantCupos() {
        return this.cantCupos;
    }

    public String getCarrera() {
        return this.carrera;
    }

    public void setCarrera(String c) {
        this.carrera = c;
    }

    public String getCupos() {
        return this.cupos;
    }

    public void setCupos(String cupo) {
        this.cupos = cupo;
    }

    public String actualizarCupos() throws Exception {
        ResultSet rs = null;
        Statement s = null;
        ConexionBD.establishConnection();
        String string = null;
        try {
            s = ConexionBD.getConnection().createStatement();
            System.out.println("Conecto");
            Map session2 = ActionContext.getContext().getSession();
            String usbid = session2.get("usbid").toString();
            rs = s.executeQuery("SELECT * FROM coordinador WHERE usbid='" + usbid + "'");
            System.out.println("Ejecuto");
            String carrera;

            if (rs.next()) {

                carrera = rs.getString("codcarrera");
                System.out.println(carrera);

                for (int x = 0; x < cantCupos.length(); x++) {
                    if (cantCupos.charAt(x) < '0' || cantCupos.charAt(x) > '9') {
                        return "no success";
                    }
                    System.out.println(cantCupos.charAt(x));
                }

                System.out.println("Bien");
                s.executeUpdate("UPDATE carrera SET CUPOS='" + cantCupos + "' where codcarrera='" + carrera + "'");


                return "success";

            } else {
                return "no success";
            }


        } catch (Exception e) {
            System.out.println("Problem in searching the database 1");
        }
        return "no success";
    }

    public String solicitarCupos() throws Exception {
        ResultSet rs = null;
        Statement s = null;
        ConexionBD.establishConnection();
        String string = null;
        try {
            s = ConexionBD.getConnection().createStatement();
            System.out.println("Conecto");
            System.out.println(this.getCarrera().substring(7));
            rs = s.executeQuery("SELECT * FROM carrera WHERE nombre='" + this.getCarrera().substring(7) + "'");
            System.out.println("Ejecuto");
            String cupos;

            if (rs.next()) {

                this.setCupos(rs.getString("cupos"));


                System.out.println("Bien");



                return "success";

            } else {
                return "no success";
            }


        } catch (Exception e) {
            System.out.println("Problem in searching the database 1");
        }
        return "no success";
    }
}
