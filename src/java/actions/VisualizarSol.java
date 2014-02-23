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
    public boolean recomendada;

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public boolean isRecomendada() {
        return recomendada;
    }

    public void setRecomendada(boolean recomendada) {
        this.recomendada = recomendada;
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
     * @throws Exception
     */
    public String verPendientes() throws Exception {
        ResultSet rs = null;
        Statement st = null;
        ConexionBD.establishConnection();
        
        try {
            st = ConexionBD.getConnection().createStatement();
            Map session2 = ActionContext.getContext().getSession();
            String uscoor = session2.get("usbid").toString();

            rs = st.executeQuery("SELECT * FROM COORDINADOR WHERE USBID='"+uscoor+"'");
            rs.next();
            String carr = rs.getString("codcarrera");
            
            // Todas las solicitudes a esa carrera
            rs = st.executeQuery("SELECT * FROM SOLICITUD NATURAL JOIN USUARIO "
                    + "WHERE SOL_ACEPTADA='P' "
                    + "AND CODCARRERA='" + carr + "'");
            
            List<Solicitud> li = null;
            li = new ArrayList<Solicitud>();
            Solicitud mb = null;

            while (rs.next()) {
                mb = new Solicitud();
                Estudiante tmp = new Estudiante();
                tmp.setUsbid(rs.getString("usbid"));
                tmp.setNombre(rs.getString("nombre")+" "+rs.getString("apellido"));
                mb.setEstudiante(tmp);

                li.add(mb);

            }
            request.setAttribute("disp3", li);

            rs.close();
            st.close();
            Map session3 = ActionContext.getContext().getSession();
            if (session3.get("rol").toString().equals("Coordinador")) {
                return SUCCESS;
            }

        } catch (Exception e) {
            System.out.println("Problem in searching the database verPendientes");
        }
        return "no success";
    }
    
    public String verSolicitudesPendientes() throws Exception {
        ResultSet rs = null;
        Statement st = null;
        ConexionBD.establishConnection();
        
        try {
            st = ConexionBD.getConnection().createStatement();
            rs = st.executeQuery("SELECT * FROM SOLICITUD NATURAL JOIN USUARIO "
                    + "WHERE SOL_ACEPTADA='P' AND SOL_RECOMENDADA='P'");
            
            List<Solicitud> li = null;
            li = new ArrayList<Solicitud>();
            Solicitud mb = null;

            while (rs.next()) {
                mb = new Solicitud();
                Estudiante tmp = new Estudiante();
                tmp.setUsbid(rs.getString("usbid"));
                tmp.setNombre(rs.getString("nombre")+" "+rs.getString("apellido"));
                mb.setEstudiante(tmp);
               
                li.add(mb);
            }
            
            request.setAttribute("disp3", li);

            rs.close();
            st.close();
            Map session3 = ActionContext.getContext().getSession();
            if (session3.get("rol").toString().equals("DIDE")) {
                return SUCCESS;
            }
            
        } catch (Exception e) {
            System.out.println("Problem in searching the database 1");
        }
        return "no success";
    }
    
    /**
     *
     * @return
     * @throws Exception
     */
    public String verYaGestionados() throws Exception {
        ResultSet rs = null;
        Statement st = null;
        ConexionBD.establishConnection();
        
        try {
            st = ConexionBD.getConnection().createStatement();
            Map session2 = ActionContext.getContext().getSession();
            String uscoor = session2.get("usbid").toString();

            rs = st.executeQuery("SELECT * FROM COORDINADOR WHERE USBID='"+uscoor+"'");
            rs.next();
            String carr = rs.getString("codcarrera");
            
            rs = st.executeQuery("SELECT * FROM SOLICITUD NATURAL JOIN USUARIO "
                    + "WHERE SOL_ACEPTADA!='P' "
                    + "AND CODCARRERA='" + carr + "'");
            
            List<Solicitud> li = null;
            li = new ArrayList<Solicitud>();
            Solicitud mb = null;

            while (rs.next()) {
                mb = new Solicitud();
                Estudiante tmp = new Estudiante();
                tmp.setUsbid(rs.getString("usbid"));
                tmp.setNombre(rs.getString("nombre")+" "+rs.getString("apellido"));
                mb.setEstudiante(tmp);
                mb.setSolAceptada(rs.getString("sol_aceptada").equals("A"));
               
                li.add(mb);
            }
            
            request.setAttribute("disp4", li);

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
    
    public String verDIDEHistorial() throws Exception {
        ResultSet rs = null;
        Statement st = null;
        ConexionBD.establishConnection();
        
        try {
            st = ConexionBD.getConnection().createStatement();
            rs = st.executeQuery("SELECT * FROM SOLICITUD NATURAL JOIN USUARIO "
                    + "WHERE SOL_RECOMENDADA!='P'");
            
            List<Solicitud> li = null;
            li = new ArrayList<Solicitud>();
            Solicitud mb = null;

            while (rs.next()) {
                mb = new Solicitud();
                Estudiante tmp = new Estudiante();
                tmp.setUsbid(rs.getString("usbid"));
                tmp.setNombre(rs.getString("nombre")+" "+rs.getString("apellido"));
                mb.setEstudiante(tmp);
                mb.setRecomendada(rs.getString("SOL_RECOMENDADA").equals("A"));
               
                li.add(mb);
            }

            request.setAttribute("disp40", li);

            rs.close();
            st.close();
            return SUCCESS;

        } catch (Exception e) {
            System.out.println("Problem in searching the database verYaGestionados2");
        }
        return "no success";
    }
}