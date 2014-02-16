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
public class GestionCupos extends ActionSupport implements ServletRequestAware {

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
        return SUCCESS;
    }

    /**
     *
     */
    @Override
    public void validate() {
        if (this.getCarrera().equals("-1")) {
             addActionError("Seleccione una carrera válida");
            //addFieldError("carrera", "Seleccione una carrera válida");
        }
    }

    /**
     *
     * @param aux
     */
    public void setCohorte(String aux) {
        this.cohorte = aux;
    }
        
    
    /**
     *
     * @return
     * @throws Exception
     */
    public String execute() throws Exception {
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
                mb.setCarrera(this.getCarrera().substring(0, 4));
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
