package CRUD.usuarios;

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


            ps = ConexionBD.getConnection().prepareStatement("select * from usuario where usbid=?");
            String a = request.getParameter("fid");
            String k = a;
            ps.setString(1, k);
            //System.out.println("This is" +k);

            ResultSet res = ps.executeQuery();
            List l = new ArrayList();

            while (res.next()) {
                m.put("a", res.getString("usbid"));
                m.put("b", res.getInt("cedula"));
                m.put("c", res.getString("Nombre"));
                m.put("d", res.getString("Apellido"));
                m.put("f", res.getString("rol"));

            }

            ps.close();


        } catch (Exception e) {
            e.printStackTrace();
        }


        return SUCCESS;

    }
}
