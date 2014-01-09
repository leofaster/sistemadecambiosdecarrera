package CRUD.carreras;

import clases.ConexionBD;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author CHANGE Gate
 */
public class Update extends ActionSupport implements ServletRequestAware, ApplicationAware {

    private static final long serialVersionUID = 1L;
    HttpServletRequest request;
    Map m;

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
     * @param m
     */
    public void setApplication(Map m) {
        this.m = m;
    }

    /**
     *
     * @return
     */
    public String execute() {
        try {
            ConexionBD.establishConnection();
            PreparedStatement ps = null;


            ps = ConexionBD.getConnection().prepareStatement("select * from carrera where codcarrera=?");
            String a = request.getParameter("fid");
            int k = Integer.parseInt(a);
            ps.setInt(1, k);
            //System.out.println("This is" +k);

            ResultSet res = ps.executeQuery();
            List l = new ArrayList();

            while (res.next()) {
                m.put("a", res.getInt("codcarrera"));
                m.put("b", res.getString("nombre"));
                m.put("c", res.getInt("cupos"));
                m.put("d", res.getDouble("INDICE_MIN"));

            }

            ps.close();


        } catch (Exception e) {
            e.printStackTrace();
        }


        return SUCCESS;

    }
}
