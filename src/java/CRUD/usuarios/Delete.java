package CRUD.usuarios;

import clases.ConexionBD;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author CHANGE Gate
 */
public class Delete extends ActionSupport implements ServletRequestAware {

    private static final long serialVersionUID = 1L;
    HttpServletRequest request;

    /**
     *
     * @return
     */
    public String execute() {

        ConexionBD.establishConnection();
        try {



            PreparedStatement ps = null;

            String cv[] = request.getParameterValues("rdel");

            for (int i = 0; i < cv.length; i++) {
                ps = ConexionBD.getConnection().prepareStatement("delete from usuario where usbid=?");
                String k = cv[i];
                System.out.println("Lo que se quiere eliminar es " + k);
                ps.setString(1, k);
                ps.executeUpdate();

            }

            ps.close();


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
