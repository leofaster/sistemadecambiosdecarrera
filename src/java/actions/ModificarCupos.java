/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import clases.ConexionBD;
import clases.Usuario;
import clases.Cohorte;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author CHANGE Gate
 */
public class ModificarCupos extends ActionSupport implements ServletRequestAware {

    public String cantCupos;
    public String carrera;
    public String cupos;
    public String cohorte;
    private static final long serialVersionUID = 1L;
    HttpServletRequest request;
    private int x;

    public void setCantCupos(String value) {
        cantCupos = value;
    }

    public String getCantCupos() {
        return this.cantCupos;
    }

    public void setServletRequest(HttpServletRequest request) {
        this.request = request;
    }

    /**
     *
     * @return
     */
    public HttpServletRequest getServletRequest() {
        return request;
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

    public String getCohorte() {
        return this.cohorte;
    }

    public String cambiarCupos() {
        return SUCCESS;
    }

    @Override
    public void validate() {
       
        ResultSet rs = null, rs2 = null;
        Statement s = null;
        ConexionBD.establishConnection();
        //String string = null;
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
                rs2 = s.executeQuery("SELECT * FROM contiene WHERE cohorte='" + this.cohorte + "' AND "
                        + " codcarrera='" + carrera + "'");
                if (!rs2.next()) {
                    addFieldError("cohorte", "Introduzca una cohorte válida.");
                }
                
                if (cantCupos.length() < 1) {
                    addFieldError("cantCupos","Introduzca un número.");
                }
                for (int x = 0; x < cantCupos.length(); x++) {
                    if (cantCupos.charAt(x) < '0' || cantCupos.charAt(x) > '9') {
                        addFieldError("cantCupos", "Introduzca una cantidad de cupos válida.");
                    }
                    System.out.println(cantCupos.charAt(x));
                }

                System.out.println("Bien");
                s.executeUpdate("UPDATE contiene SET CUPOS='" + cantCupos + "' where codcarrera='" + carrera + "' and cohorte='" + this.cohorte + "'");

  

            } else {
                addFieldError("cohorte", "Cohorte introducida inválida.");
            }


        } catch (Exception e) {
            System.out.println("Problem in searching the database 1");
        }
        
    }

    public void setCohorte(String aux) {
        this.cohorte = aux;
    }

    public String actualizarCupos() throws Exception {
        ResultSet rs = null, rs2 = null;
        Statement s = null;
        ConexionBD.establishConnection();
        //String string = null;
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
                rs2 = s.executeQuery("SELECT * FROM contiene WHERE cohorte='" + this.cohorte + "' AND "
                        + " codcarrera='" + carrera + "'");
                if (!rs2.next()) {
                    return "no success";
                }

                for (int x = 0; x < cantCupos.length(); x++) {
                    if (cantCupos.charAt(x) < '0' || cantCupos.charAt(x) > '9') {
                        return "no success";
                    }
     
                 System.out.println(cantCupos.charAt(x));
                }

                System.out.println("Bien");
                s.executeUpdate("UPDATE contiene SET CUPOS='" + cantCupos + "' where codcarrera='" + carrera + "' and cohorte='" + this.cohorte + "'");

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
        Statement st = null;
        ConexionBD.establishConnection();
        String string = null;
        //for(int i =0 ;i<this.cohorte.length();i++) 
        //  if(this.cohorte.charAt(i)<'0' ||this.cohorte.charAt(i)>'9') return "no success";
        try {
            st = ConexionBD.getConnection().createStatement();
            System.out.println("Conecto");
            System.out.println(this.getCarrera().substring(0, 4));
            rs = st.executeQuery("SELECT * FROM contiene WHERE codcarrera='" + this.getCarrera().substring(0, 4) + "' order by cohorte");
            System.out.println("Ejecuto");
            String cupos;
            System.out.println("hey1");
            List<Cohorte> li = null;
            li = new ArrayList<Cohorte>();
            Cohorte mb = null;

            while (rs.next()) {
                mb = new Cohorte();

                mb.setCohorte(rs.getString("cohorte"));
                mb.setCupos(rs.getString("cupos"));
                mb.setCuposa(rs.getString("activos"));
                li.add(mb);
                if (li.size() >= 4) {
                    li.remove(0);
                }

            }
            System.out.println(li.size());
            request.setAttribute("disp2", li);

            rs.close();
            st.close();
            Map session2 = ActionContext.getContext().getSession();
            if (session2.get("rol").toString().equals("Coordinador")) {
                return "Coordinador";
            }
            return SUCCESS;

        } catch (Exception e) {
            System.out.println("Problem in searching the database 1");
        }
        return "no success";
    }
}
