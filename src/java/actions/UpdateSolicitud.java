/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import clases.ConexionBD;
import clases.AsignaturaConNota;
import clases.Asignatura;
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
public class UpdateSolicitud extends ActionSupport implements ServletRequestAware, ApplicationAware {

    private static final long serialVersionUID = 1L;
    HttpServletRequest request;
    Map m;
    String motivacion;
    String advertencia;
    String indice_sol;
    String carreraOrigen_sol;
    String nombre_est;
    String carnet_est;
    private List<AsignaturaConNota> lista;

    public String getIndice_sol() {
        return indice_sol;
    }

    public void setIndice_sol(String indice_sol) {
        this.indice_sol = indice_sol;
    }

    public String getCarreraOrigen_sol() {
        return carreraOrigen_sol;
    }

    public void setCarreraOrigen_sol(String carreraOrigen_sol) {
        this.carreraOrigen_sol = carreraOrigen_sol;
    }

    public String getNombre_est() {
        return nombre_est;
    }

    public void setNombre_est(String nombre_est) {
        this.nombre_est = nombre_est;
    }

    public String getCarnet_est() {
        return carnet_est;
    }

    public void setCarnet_est(String carnet_est) {
        this.carnet_est = carnet_est;
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public Map getM() {
        return m;
    }

    public void setM(Map m) {
        this.m = m;
    }

    public String getAdvertencia() {
        return advertencia;
    }

    public void setAdvertencia(String advertencia) {
        this.advertencia = advertencia;
    }

    public String getMotivacion() {
        return motivacion;
    }

    public void setMotivacion(String motivacion) {
        this.motivacion = motivacion;
    }

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

    @Override
    public String execute() {
        ResultSet rs = null;
        Statement st = null;

        try {
            ConexionBD.establishConnection();
            st = ConexionBD.getConnection().createStatement();

            List<AsignaturaConNota> li = null;
            li = new ArrayList<AsignaturaConNota>();
            Asignatura mb = null;
            AsignaturaConNota mb2 = null;

            Map session2 = ActionContext.getContext().getSession();

            String carn = request.getParameter("carnet");
            String nombre = request.getParameter("nombre");

            if (carn != null) {
                session2.put("carnet_aux", carn);
            }
            if (nombre != null) {
                session2.put("nombre_aux", nombre);
            }
            carn = session2.get("carnet_aux").toString();
            nombre = session2.get("nombre_aux").toString();

            rs = st.executeQuery("select * from solicitud where usbid='" + carn + "' AND SOL_ACEPTADA='P'");
            rs.next();
            
            motivacion = rs.getString("motivacion");
            advertencia = rs.getString("advertencia");
            
            rs = st.executeQuery("select * from calificacion natural join asignatura"
                    + " where usbid='" + carn
                    + "' order by codasignatura");

            while (rs.next()) {
                mb = new Asignatura();
                mb.setCodigoS(rs.getString("codasignatura"));
                mb.setNombre(rs.getString("nombre"));

                mb2 = new AsignaturaConNota();
                mb2.setAsignatura(mb);
                mb2.setNota(rs.getInt("nota"));
                
                li.add(mb2);
            }

            nombre_est = nombre;
            this.carnet_est = carn;

            rs = st.executeQuery("select * from estudiante natural join carrera where usbid='" + carn + "'");
            rs.next();

            this.indice_sol = rs.getString("indice");
            this.carreraOrigen_sol = rs.getString("nombre");

            request.setAttribute("disp5", li);
            rs.close();
            st.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        Map session2 = ActionContext.getContext().getSession();
        return session2.get("rol").toString();
    }

    public String Aceptar() {
        ResultSet rs = null;
        Statement st = null;
        ConexionBD.establishConnection();

        try {
            st = ConexionBD.getConnection().createStatement();
            Map session2 = ActionContext.getContext().getSession();
            String carnet = session2.get("carnet_aux").toString();
            
            rs = st.executeQuery("select * from solicitud where usbid='" + carnet + "' AND sol_aceptada='P'");
            if (rs.next()) {
                st.executeUpdate("UPDATE solicitud SET sol_aceptada='A' "
                                + "where usbid='" + carnet + "' and sol_aceptada='P'");
                addActionMessage("La solicitud se ha procesado con éxito.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error modificando solicitudes");
        }

        return SUCCESS;
    }
    
    public String Recomendar() {
        ResultSet rs = null;
        Statement st = null;
        ConexionBD.establishConnection();

        try {
            st = ConexionBD.getConnection().createStatement();
            Map session2 = ActionContext.getContext().getSession();
            String carnet = session2.get("carnet_aux").toString();
            
            rs = st.executeQuery("select * from solicitud "
                                + "where usbid='" + carnet + "' "
                                + "AND sol_aceptada='P'");
            
            if (rs.next()) {
                String adver = rs.getString("advertencia");
                String adverAux = "El estudiante ha sido recomendado por DIDE.\n" + adver;
                
                st.executeUpdate("UPDATE solicitud "
                                + "set advertencia='" + adverAux + "', sol_recomendada='A' "
                                + "where sol_aceptada='P' "
                                + "AND usbid='" + carnet + "'");
                addActionMessage("La solicitud se ha procesado con éxito.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error modificando solicitudes");
        }

        return SUCCESS;
    }

    public String Negar() {
        ResultSet rs = null;
        Statement st = null;
        ConexionBD.establishConnection();

        try {
            st = ConexionBD.getConnection().createStatement();
            Map session2 = ActionContext.getContext().getSession();
            String carnet = session2.get("carnet_aux").toString();
            
            rs = st.executeQuery("select * from solicitud where usbid='" + carnet + "' AND sol_aceptada='P'");
            if (rs.next()) {
                st.executeUpdate("UPDATE solicitud SET sol_aceptada='R' "
                                + "where usbid='" + carnet + "' and sol_aceptada='P'");
                addActionMessage("La solicitud se ha procesado con éxito.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error modificando solicitudes");
        }

        return SUCCESS;
    }
    
    public String NoRecomendar() {
        ResultSet rs = null;
        Statement st = null;
        ConexionBD.establishConnection();

        try {
            st = ConexionBD.getConnection().createStatement();
            Map session2 = ActionContext.getContext().getSession();
            String carnet = session2.get("carnet_aux").toString();
            
            rs = st.executeQuery("select * from solicitud "
                                + "where usbid='" + carnet + "' "
                                + "AND sol_aceptada='P'");
            
            if (rs.next()) {
                String adver = rs.getString("advertencia");
                String adverAux = "DIDE no recomienda al estudiante.\n" + adver;
                
                st.executeUpdate("UPDATE solicitud "
                                + "set advertencia='" + adverAux + "', sol_recomendada='R' "
                                + "where sol_aceptada='P' "
                                + "AND usbid='" + carnet + "'");
                addActionMessage("La solicitud se ha procesado con éxito.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error modificando solicitudes");
        }

        return SUCCESS;
    }
}