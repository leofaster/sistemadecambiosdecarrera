/**
 *
 * @author CHANGE Gate
 */

package actions;

import clases.Cohorte;
import clases.ConexionBD;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;


/**
 *
 * @author Becca
 */
public class VerCupos extends ActionSupport implements ServletRequestAware {
    
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

    
    public String getCantCupos() {
        return cantCupos;
    }

    public void setCantCupos(String cantCupos) {
        this.cantCupos = cantCupos;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getCupos() {
        return cupos;
    }

    public void setCupos(String cupos) {
        this.cupos = cupos;
    }

    public String getCohorte() {
        return cohorte;
    }

    public void setCohorte(String cohorte) {
        this.cohorte = cohorte;
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }
    
    @Override
    public void validate() {
        
    }
    
    /**
     *
     * @return
     * @throws Exception
     */
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

    public void setServletRequest(HttpServletRequest hsr) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
