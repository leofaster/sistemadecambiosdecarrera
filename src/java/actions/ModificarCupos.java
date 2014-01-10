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
    public String cambiarCupos() {
        String cohor = request.getParameter("cohorte");
        String carr = request.getParameter("carrera");
        Map session2 = ActionContext.getContext().getSession();
        System.out.println(carr);
        System.out.println(cohor);
        session2.put("carrera_aux", carr);
        session2.put("cohorte_aux", cohor);

        ResultSet rs = null, rs2 = null;
        Statement s = null;
        ConexionBD.establishConnection();
        String string = null;

        try {
            s = ConexionBD.getConnection().createStatement();
            System.out.println("Conecto2");

            rs = s.executeQuery("SELECT * FROM carrera WHERE codcarrera='" + carr + "'");
            if (rs.next()) {
                session2.put("carrera_aux_nombre", rs.getString("nombre"));
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
    public String actualizarCupos() throws Exception {
        
        if (cantCupos.length() < 1) {
            addFieldError("cantCupos", "Introduzca un número.");
            return "input";
        }
        for (int x = 0; x < cantCupos.length(); x++) {
            if (cantCupos.charAt(x) < '0' || cantCupos.charAt(x) > '9') {
                addFieldError("cantCupos", "Introduzca una cantidad de cupos válida.");
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
            String carrera1 = session2.get("carrera_aux").toString();
            String cohorte1 = session2.get("cohorte_aux").toString();

            s.executeUpdate("UPDATE contiene SET CUPOS='" + cantCupos + "' where codcarrera='" + carrera1 + "' and cohorte='" + cohorte1 + "'");
            addActionMessage("Cupos Cambiados");
            return "success";

        } catch (Exception e) {
            System.out.println("Problem in searching the database 100");
        }
        return "no success";
    }
    
    public String actualizarActivos() throws Exception {
        
        if (cantCupos.length() < 1) {
            addFieldError("cantCupos", "Introduzca un número.");
            return "input";
        }
        for (int x = 0; x < cantCupos.length(); x++) {
            if (cantCupos.charAt(x) < '0' || cantCupos.charAt(x) > '9') {
                addFieldError("cantCupos", "Introduzca una cantidad de cupos válida.");
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
            String carrera1 = session2.get("carrera_aux").toString();
            String cohorte1 = session2.get("cohorte_aux").toString();

            s.executeUpdate("UPDATE contiene SET ACTIVOS='" + cantCupos + "' where codcarrera='" + carrera1 + "' and cohorte='" + cohorte1 + "'");
            addActionMessage("Activos Cambiados");
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
        addFieldError("carrera", "Seleccione una carrera válida.");
        return "no success";
    }
}
