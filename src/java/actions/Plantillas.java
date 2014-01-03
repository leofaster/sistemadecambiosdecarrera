/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

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
import org.apache.struts2.interceptor.ApplicationAware;

/**
 *
 * @author CHANGE Gate
 */
public class Plantillas extends ActionSupport implements ServletRequestAware, ApplicationAware {

    HttpServletRequest request;
    Map m;
    String nombre;
    String listaMaterias;
    String coordinador;

    public String getCoordinador() {
        return coordinador;
    }

    public void setCoordinador(String coordinador) {
        this.coordinador = coordinador;
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

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getListaMaterias() {
        return listaMaterias;
    }

    public void setListaMaterias(String listaMaterias) {
        this.listaMaterias = listaMaterias;
    }

    
    @Override
    public String execute() throws Exception {
        ResultSet rs = null;
        Statement st = null;

        try {
            ConexionBD.establishConnection();
            st = ConexionBD.getConnection().createStatement();

            List<Asignatura> li = null;
            li = new ArrayList<Asignatura>();
            Asignatura mb = null;
            
            rs = st.executeQuery("select * from asignatura order by codasignatura");

            while (rs.next()) {
                mb = new Asignatura();
                mb.setCodigoS(rs.getString("codasignatura"));
                mb.setNombre(rs.getString("nombre"));
                li.add(mb);
            }

            request.setAttribute("lista_materias", li);
            rs.close();
            st.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return SUCCESS;
    }

    public String crearPlantilla() throws Exception {
        
        ResultSet rs = null;
        Statement st = null;
        
        listaMaterias = request.getParameter("lista");
        nombre = request.getParameter("nombre");
        
        if (listaMaterias.length() < 1 || nombre.length() < 1) {
            addActionError("Por favor seleccione al menos una asignatura e introduzca un nombre.");
            execute();
            return "input";
        }
        
        
        String materias[] = listaMaterias.split(",");
        
        Map session2 = ActionContext.getContext().getSession();
        coordinador = session2.get("usbid").toString();

        try {
            
            ConexionBD.establishConnection();
            st = ConexionBD.getConnection().createStatement();

            rs = st.executeQuery("select * from plantilla where nombre='"+nombre+"' and usbid='"+coordinador+"'");
            
            if (rs.next()) {
            addActionError("El nombre de la plantilla ya existe");
            execute();
            return "input";
        }
            
            st.executeUpdate("INSERT INTO PLANTILLA VALUES('"
                        + nombre
                        + "','"
                        + coordinador
                        + "')");
            
            for (int i = 0; i < materias.length; i++ ) {
                System.out.println(materias[i]);
                st.executeUpdate("INSERT INTO CONTEMPLA VALUES('"
                        + nombre
                        + "','"
                        + coordinador
                        + "','"
                        + materias[i]
                        + "')");
            }
            
            st.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return SUCCESS;
    }
}
