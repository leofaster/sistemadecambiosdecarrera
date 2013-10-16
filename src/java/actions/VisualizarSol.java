/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

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

/**
 *
 * @author CHANGE Gate
 */
public class VisualizarSol extends ActionSupport implements ServletRequestAware{
    private static final long serialVersionUID = 1L;
    HttpServletRequest request;
    
    public void setServletRequest(HttpServletRequest request) {
        this.request = request;
    }
    
    
    public String verPendientes() throws Exception {
        ResultSet rs = null;
        Statement st = null;
        ConexionBD.establishConnection();
        String string = null;
        //for(int i =0 ;i<this.cohorte.length();i++) 
        //  if(this.cohorte.charAt(i)<'0' ||this.cohorte.charAt(i)>'9') return "no success";
        
        try {
            st = ConexionBD.getConnection().createStatement();
            System.out.println("Conecto");
            Map session2 = ActionContext.getContext().getSession();
            String uscoor = session2.get("usbid").toString();
            System.out.println(uscoor);
            rs = st.executeQuery("SELECT * FROM COORDINADOR WHERE USBID='"+uscoor+"'");
            rs.next();
            String carr = rs.getString("codcarrera");
            
            System.out.println(carr);
            rs = st.executeQuery("SELECT USUARIO.NOMBRE,SOLICITUD.USBID,SOLICITUD.CODCARRERA "
                    + "FROM SOLICITUD JOIN USUARIO ON SOLICITUD.USBID=USUARIO.USBID"
                    + " WHERE SOL_ACEPTADA='F' AND MOTIVACION!='' AND "
                    + "SOLICITUD.CODCARRERA='"+carr+"'");
            
            System.out.println("Ejecutar BUSQUEDA DE SOLICITUDES");
            
            
            List<Solicitud> li = null;
            li = new ArrayList<Solicitud>();
            Solicitud mb = null;

            while (rs.next()) {
                mb = new Solicitud();
                Estudiante tmp = new Estudiante();
                tmp.setUsbid(rs.getString("usbid"));
                tmp.setNombre(rs.getString("nombre"));
                mb.setEstudiante(tmp);
                
               
                li.add(mb);

            }
            System.out.println(li.size());
            request.setAttribute("disp3", li);

            rs.close();
            st.close();
            Map session3 = ActionContext.getContext().getSession();
            if (session3.get("rol").toString().equals("Coordinador")) {
                return SUCCESS;
            }
            

        } catch (Exception e) {
            System.out.println("Problem in searching the database 1");
        }
        return "no success";
    }
    
    
    
}
