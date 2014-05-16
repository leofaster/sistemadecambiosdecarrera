/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import actions.*;
import clases.ConexionBD;
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
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Iterator;
import org.apache.struts2.interceptor.ApplicationAware;

/**
 *
 * @author CHANGE Gate
 */
public class Recomienda extends ActionSupport implements ServletRequestAware {

    HttpServletRequest request;
    ArrayList notas = new ArrayList();
    public Estudiante e;

    public Estudiante getE() {
        return e;
    }

    public void setE(Estudiante e) {
        this.e = e;
    }

    public ArrayList getNotas() {
        return notas;
    }

    public void setNotas(ArrayList<AsignaturaConNota> notas) {
        this.notas = notas;
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
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
    
    @Override
    public String execute() throws Exception {
        
        Iterator<AsignaturaConNota> iter = notas.iterator();
        Map sesion = ActionContext.getContext().getSession();
        String estudiante = sesion.get("rec_usbid").toString();
        
        Statement st;
        ResultSet rs;

        try {
            ConexionBD.establishConnection();
            st = ConexionBD.getConnection().createStatement();
            // ojo esto es provicional, posiblemente.
            /*st.executeUpdate("DELETE FROM RECOMIENTA WHERE usbid='"
                        + estudiante + "'"); */
            rs = st.executeQuery("SELECT * "
                    + "FROM SOLICITUD "
                    + "WHERE usbid='"+estudiante+"' "
                      + "AND sol_aceptada='A'"
                );
            
            rs.next();
            int carrera = rs.getInt("codcarrera");
            java.util.Date date = new java.util.Date();
            Timestamp ts = new Timestamp(date.getTime());
            Timestamp fecha_sol = rs.getTimestamp("fecha");
            while(iter.hasNext()) {
                AsignaturaConNota materia = iter.next();
                st.executeUpdate("INSERT INTO RECOMIENDA VALUES('"
                        + estudiante + "',"
                        + carrera + ",'"
                        + fecha_sol + "','"
                        + materia.getCodigo() + "','"
                        + materia.getNota() + "','"
                        + ts + "')");
            }
            e = new Estudiante();
            request.setAttribute("carnet",estudiante);
            e.setRequest(request);
            String result = e.visualizarDatosCambio();
            this.setRequest(e.getRequest());
            this.setServletRequest(e.getRequest());
            return result;
            
            
        } catch (Exception f) {
            addActionError("Una de las materias seleccionadas ya ha sido asignada al estudiante.");
            e = new Estudiante();
            request.setAttribute("carnet",estudiante);
            e.setRequest(request);
            String result = e.visualizarDatosCambio();
            this.setRequest(e.getRequest());
            this.setServletRequest(e.getRequest());
            return result;
        }
    }
    
    public String eliminarAsignatura() throws Exception {
        
        String codigo = request.getParameter("codigo");
        Map sesion = ActionContext.getContext().getSession();
        String estudiante = sesion.get("carnet_aux").toString();
        
        Statement st;
        ResultSet rs;

        try {
            ConexionBD.establishConnection();
            st = ConexionBD.getConnection().createStatement();
          
            rs = st.executeQuery("SELECT * "
                    + "FROM SOLICITUD "
                    + "WHERE usbid='"+estudiante+"' "
                      + "AND sol_aceptada='A'"
                );
            
            rs.next();
            int carrera = rs.getInt("codcarrera");
            Timestamp fecha_sol = rs.getTimestamp("fecha");
            
            st.executeUpdate("DELETE "
                    + "FROM RECOMIENDA "
                    + "WHERE usbid='"+estudiante+"' "
                      + "AND codcarrera='"+carrera+"' "
                      + "AND fecha_sol='"+fecha_sol+"' "
                      + "AND codasignatura='"+codigo+"'"
                );
            
            st.close();
            addActionMessage("La asignatura se eliminó correctamente.");
            e = new Estudiante();
            request.setAttribute("carnet",estudiante);
            e.setRequest(request);
            String result = e.visualizarDatosCambio();
            this.setRequest(e.getRequest());
            this.setServletRequest(e.getRequest());
            return result;
            
        } catch (Exception e) {
            return "no success";
        }
    }
}
