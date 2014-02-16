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
public class ModificarPlazos extends ActionSupport implements ServletRequestAware {

    public String trimmin;
    public String trimmax;

    public String getTrimmin() {
        return trimmin;
    }

    public void setTrimmin(String trimmin) {
        this.trimmin = trimmin;
    }

    public String getTrimmax() {
        return trimmax;
    }

    public void setTrimmax(String trimmax) {
        this.trimmax = trimmax;
    }

    

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }
    
    /**
     *
     */
    public String cantCupos;
    /**
     *
     */
    public String carrera;
    /**
     *
     */
    public String cupos;
    /**
     *
     */
    public String cohorte;
    private static final long serialVersionUID = 1L;
    HttpServletRequest request;
    private int x;

    /**
     *
     * @param value
     */
    public void setCantCupos(String value) {
        cantCupos = value;
    }

    /**
     *
     * @return
     */
    public String getCantCupos() {
        return this.cantCupos;
    }

    /**
     *
     * @param request
     */
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

    /**
     *
     * @return
     */
    public String getCarrera() {
        return this.carrera;
    }

    /**
     *
     * @param c
     */
    public void setCarrera(String c) {
        this.carrera = c;
    }

    /**
     *
     * @return
     */
    public String getCupos() {
        return this.cupos;
    }

    /**
     *
     * @param cupo
     */
    public void setCupos(String cupo) {
        this.cupos = cupo;
    }

    /**
     *
     * @return
     */
    public String getCohorte() {
        return this.cohorte;
    }

    /**
     *
     * @return
     */
    public String cambiarPlazos() {
        String carr = request.getParameter("carrera");
        Map session2 = ActionContext.getContext().getSession();
        System.out.println(carr);
        session2.put("carrera_bux", carr);

        ResultSet rs = null, rs2 = null;
        Statement s = null;
        ConexionBD.establishConnection();
        String string = null;

        try {
            s = ConexionBD.getConnection().createStatement();
            System.out.println("Conecto2");

            rs = s.executeQuery("SELECT * FROM carrera WHERE codcarrera='" + carr + "'");
            if (rs.next()) {
                session2.put("carrera_bux_nombre", rs.getString("nombre"));
            }
        } catch (Exception e) {
            System.out.println("Problem in searching the database cambiarCupos");
            return "no sucess";
        }
        return SUCCESS;
    }

    /**
     *
     */
    

    /**
     *
     * @param aux
     */
    public void setCohorte(String aux) {
        this.cohorte = aux;
    }

    /**
     *
     * @return @throws Exception
     */
    public String actualizarPlazos() throws Exception {
        
        if (trimmin.length() < 1) {
            addActionError("Introduzca un número.");
           // addFieldError("trimmin", "Introduzca un número.");
            return "input";
        }
        for (int x = 0; x < trimmin.length(); x++) {
            if (trimmin.charAt(x) < '0' || trimmin.charAt(x) > '9') {
                addActionError("Introduzca un número válido.");
               // addFieldError("trimmin", "Introduzca un número válido.");
                return "input";
            }
            //System.out.println(cantCupos.charAt(x));
        }
        if (trimmax.length() < 1) {
            addActionError("Introduzca un número.");
           // addFieldError("trimmax", "Introduzca un número.");
            return "input";
        }
        for (int x = 0; x < trimmax.length(); x++) {
            if (trimmax.charAt(x) < '0' || trimmax.charAt(x) > '9') {
                addActionError("Introduzca un número válido.");
              //  addFieldError("trimmax", "Introduzca un número válido.");
                return "input";
            }
            //System.out.println(cantCupos.charAt(x));
        }
        ResultSet rs = null, rs2 = null;
        Statement s = null;
        ConexionBD.establishConnection();
        String string = null;
        try {

            s = ConexionBD.getConnection().createStatement();
            System.out.println("Conecto1023");
            Map session2 = ActionContext.getContext().getSession();
            String carrera1 = session2.get("carrera_bux").toString();

            s.executeUpdate("UPDATE plazos SET TRIMMIN='" + trimmin + "', TRIMMAX='" + trimmax + "' where codcarrera = '" + carrera1 + "'");
            addActionMessage("Plazos Cambiados");
            return "success";

        } catch (Exception e) {
            System.out.println("Problem in searching the database 100");
        }
        return "no success";
    }

    public String solicitarCupos() throws Exception {
        ResultSet rs = null;
        Statement st = null;
        ConexionBD.establishConnection();

        System.out.println(this.getCarrera());
        try {
            st = ConexionBD.getConnection().createStatement();
            System.out.println("Conecto");
            System.out.println(this.getCarrera());
            rs = st.executeQuery("SELECT * FROM contiene WHERE codcarrera='" + this.getCarrera().substring(0, 4) + "' order by cohorte");
            System.out.println("Ejecutar solicitar cupos");
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

            return SUCCESS;

        } catch (Exception e) {
            System.out.println("Problem in searching the database 1");
        }
        return "no success";
    }
}
