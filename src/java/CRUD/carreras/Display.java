package CRUD.carreras;

import clases.Carrera;
import clases.ConexionBD;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author CHANGE Gate
 */
public class Display extends ActionSupport implements ServletRequestAware {

    private static final long serialVersionUID = 1L;
    HttpServletRequest request;

    /**
     *
     * @return
     */
    public String execute() {

        try {
            ConexionBD.establishConnection();
            Statement st = ConexionBD.getConnection().createStatement();
            ResultSet rs = st.executeQuery("select * from carrera order by codcarrera");

            List<Carrera> li = null;
            li = new ArrayList<Carrera>();
            Carrera mb = null;

            while (rs.next()) {
                mb = new Carrera();

                mb.setCodcarrera(rs.getInt("codcarrera"));
                mb.setNombre(rs.getString("nombre"));
                mb.setCupos(rs.getInt("cupos"));
                mb.setIndice_min(rs.getDouble("indice_min"));


                li.add(mb);

            }

            request.setAttribute("disp", li);

            rs.close();
            st.close();


        } catch (Exception e) {
            e.printStackTrace();
        }


        return SUCCESS;

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
}
