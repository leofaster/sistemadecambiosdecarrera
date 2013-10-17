/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CRUD.usuarios;
import clases.ConexionBD;
import clases.Usuario;
import clases.Cohorte;
import clases.Solicitud;
import clases.Estudiante;
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
import org.apache.struts2.interceptor.ApplicationAware;

/**
 *
 * @author CHANGE Gate
 */
public class UpdateSolicitud extends ActionSupport implements ServletRequestAware, ApplicationAware{
    private static final long serialVersionUID = 1L;
    HttpServletRequest request;
    Map m;
    
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
    
    public String execute() {
        //la linea de abajo esta solo de prueba
        ResultSet rs = null;
        Statement st = null;
        String string = null;
        
        
        
        
        try {
            ConexionBD.establishConnection();
            st = ConexionBD.getConnection().createStatement();
            
            
            //System.out.println("This is" +k);

            
            List<Solicitud> li = null;
            li = new ArrayList<Solicitud>();
            Solicitud mb = null;

            String carn = request.getParameter("carnet");
            String nombre = request.getParameter("nombre");
            
            rs = st.executeQuery("select * from estudiante");
            
            while (rs.next()) {
                

            }
            
            request.setAttribute("carnet",carn);
            request.setAttribute("nombre",nombre);
            request.setAttribute("disp5", li);
            rs.close();
            st.close();


        } catch (Exception e) {
            e.printStackTrace();
        }


        return SUCCESS;

    }
    
    
    
}
