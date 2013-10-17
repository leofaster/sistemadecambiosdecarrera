/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CRUD.usuarios;
import clases.ConexionBD;
import clases.Usuario;
import clases.Cohorte;
import clases.AsignaturaConNota;
import clases.Asignatura;
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

            
            List<AsignaturaConNota> li = null;
            li = new ArrayList<AsignaturaConNota>();
            Asignatura mb = null;
            AsignaturaConNota mb2= null;

            String carn = request.getParameter("carnet");
            String nombre = request.getParameter("nombre");
            System.out.println(carn);
            rs = st.executeQuery("select * from calificacion natural join asignatura"
                    + " where usbid='"+carn
                    + "' order by codasignatura");
            
            while (rs.next()) {
                mb = new Asignatura();
                mb.setCodigoS(rs.getString("codasignatura"));
                System.out.println(mb.getCodigoS());
                mb.setNombre(rs.getString("nombre"));
                mb2 = new AsignaturaConNota();
                mb2.setAsignatura(mb);
                mb2.setnota(rs.getInt("nota"));
                li.add(mb2);
            }
            System.out.println(li.size());
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
