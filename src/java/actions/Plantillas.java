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
import java.sql.Date;
import java.sql.Timestamp;
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
    String nombreAux = null;

    public String getNombreAux() {
        return nombreAux;
    }

    public void setNombreAux(String nombreAux) {
        this.nombreAux = nombreAux;
    }
    
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
    
    public String modificarPlantilla() throws Exception {
        ResultSet rs = null;
        Statement st = null;
        ResultSet rs2 = null;
        Statement st2 = null;

        try {
            ConexionBD.establishConnection();
            st = ConexionBD.getConnection().createStatement();
            st2 = ConexionBD.getConnection().createStatement();

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
            nombre = request.getParameter("nombre");
            if (nombreAux != null) {
                System.out.println("El nombre es null " + nombre);
                System.out.println("El nombreAux es " + nombreAux);
                nombre = nombreAux;
            }
            System.out.println("Entro en modificar con " + nombre);
            
            Map session2 = ActionContext.getContext().getSession();
            coordinador = session2.get("usbid").toString();
            
            List<Asignatura> listita = null;
            listita = new ArrayList<Asignatura>();
            
            rs2 = st2.executeQuery("select a.codasignatura from contempla c, asignatura a where c.usbid='"
                        + coordinador
                        + "' and c.nombre='"
                        + nombre
                        + "' and c.codasignatura=a.codasignatura order by a.codasignatura");

            while (rs2.next()) {
                mb = new Asignatura();
                mb.setCodigoS(rs2.getString("codasignatura"));
                listita.add(mb);
            }

            request.setAttribute("lista_materias_plantilla", listita);
            
            rs.close();
            st.close();
            rs2.close();
            st2.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return SUCCESS;
    }
    
    public String listarPlantillas() throws Exception {
        ResultSet rs = null;
        ResultSet rs2 = null;
        Statement st = null;
        Statement st2 = null;
        String listaAux = "";

        try {
            ConexionBD.establishConnection();
            st = ConexionBD.getConnection().createStatement();
            st2 = ConexionBD.getConnection().createStatement();
            
            Map session2 = ActionContext.getContext().getSession();
            coordinador = session2.get("usbid").toString();
            System.out.println("Este es " + coordinador);
            
            List<Plantillas> li = null;
            li = new ArrayList<Plantillas>();
            Plantillas mb = null;
            
            rs = st.executeQuery("select * from plantilla where usbid='"+ coordinador +"' order by nombre");

            while (rs.next()) {
                System.out.println("Si tiene plantillas");
                listaAux = "";
                mb = new Plantillas();
                mb.setNombre(rs.getString("nombre"));
                rs2 = st2.executeQuery("select a.nombre from contempla c, asignatura a where c.usbid='"
                        + coordinador
                        + "' and c.nombre='"
                        + mb.getNombre()
                        + "' and c.codasignatura=a.codasignatura order by a.nombre");
                if (rs2.next()) {
                    listaAux = listaAux + rs2.getString("nombre");
                    while (rs2.next()) {
                        listaAux = listaAux + ", " + rs2.getString("nombre");
                    }
                    System.out.println(listaAux);
                }
                mb.setListaMaterias(listaAux);
                li.add(mb);
            }
            
            if (request != null) {
                request.setAttribute("lista_plantillas", li);
            } else {
                session2.put("rec_plantillas",li);
            }
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
        System.out.println(nombre);
        
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
        
        addActionMessage("La plantilla se creó correctamente.");
        return SUCCESS;
    }
    
    public String updatePlantilla() throws Exception {                     
        ResultSet rs = null;
        Statement st = null;
        String nombre2;
        nombreAux = request.getParameter("nombre");
        System.out.println("El nombre viejo es " + nombreAux);
        
        listaMaterias = request.getParameter("lista");
        nombre2 = request.getParameter("nombreNuevo");
        System.out.println("El nombre nuevo es " + nombre2);
        
        if (listaMaterias.length() < 1 || nombre2.length() < 1) {
            addActionError("Por favor seleccione al menos una asignatura e introduzca un nombre.");
            System.out.println("Antes de mod " + request.getParameter("nombre"));
            modificarPlantilla();
            System.out.println("Despues de mod " + request.getParameter("nombre"));
            return "input";
        }
        
        String materias[] = listaMaterias.split(",");
        
        Map session2 = ActionContext.getContext().getSession();
        coordinador = session2.get("usbid").toString();

        try {
            
            ConexionBD.establishConnection();
            st = ConexionBD.getConnection().createStatement();

            rs = st.executeQuery("select * from plantilla where nombre='"+nombre2+"' and nombre!='"+nombreAux+"'and usbid='"+coordinador+"'");
            
            if (rs.next()) {
                addActionError("El nombre de la plantilla ya existe");
                System.out.println("Ya existe " + nombre2);
                modificarPlantilla();
                return "input";
            }
            
            System.out.println("Se va a borrar " + request.getParameter("nombre"));
            eliminarPlantillaAux();
            
            st.executeUpdate("INSERT INTO PLANTILLA VALUES('"
                        + nombre2
                        + "','"
                        + coordinador
                        + "')");
            
            for (int i = 0; i < materias.length; i++ ) {
                System.out.println(materias[i]);
                st.executeUpdate("INSERT INTO CONTEMPLA VALUES('"
                        + nombre2
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
        
        addActionMessage("La plantilla se modificó correctamente.");
        return SUCCESS;
    }
    
    public String eliminarPlantilla() throws Exception {
        
        Statement st = null;
        
        Map session2 = ActionContext.getContext().getSession();
        coordinador = session2.get("usbid").toString();
        nombre = request.getParameter("nombre");
        
        try {
            
            ConexionBD.establishConnection();
            st = ConexionBD.getConnection().createStatement();
            
            st.executeUpdate("DELETE FROM CONTEMPLA WHERE nombre='"
                        + nombre
                        + "' and usbid='"
                        + coordinador
                        + "'");
            
            st.executeUpdate("DELETE FROM PLANTILLA WHERE nombre='"
                        + nombre
                        + "' and usbid='"
                        + coordinador
                        + "'");
            
            st.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        addActionMessage("La plantilla se eliminó correctamente.");
        return SUCCESS;
    }
    
    public String eliminarPlantillaAux() throws Exception {
        
        Statement st = null;
        
        Map session2 = ActionContext.getContext().getSession();
        coordinador = session2.get("usbid").toString();
        nombre = request.getParameter("nombre");
        
        try {
            
            ConexionBD.establishConnection();
            st = ConexionBD.getConnection().createStatement();
            
            st.executeUpdate("DELETE FROM CONTEMPLA WHERE nombre='"
                        + nombre
                        + "' and usbid='"
                        + coordinador
                        + "'");
            
            st.executeUpdate("DELETE FROM PLANTILLA WHERE nombre='"
                        + nombre
                        + "' and usbid='"
                        + coordinador
                        + "'");
            
            st.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return SUCCESS;
    }
    
    public String guardarPlan() throws Exception {
        
        ResultSet rs = null;
        Statement st = null;
        
        listaMaterias = request.getParameter("lista");
        
        if (listaMaterias.length() < 1) {
            addActionError("Por favor seleccione al menos una asignatura e introduzca un nombre.");
            execute();
            return "input";
        }
        
        String materias[] = listaMaterias.split(",");
        
        

        try {
            
            ConexionBD.establishConnection();
            st = ConexionBD.getConnection().createStatement();
            
            List<Asignatura> li = null;
            li = new ArrayList<Asignatura>();
            Asignatura mb = null;
            
            for (int i = 0; i < materias.length; i++ ) {
                rs = st.executeQuery("select * from asignatura where codasignatura='"+materias[i]+"'");
                rs.next();
                mb = new Asignatura();
                mb.setCodigoS(rs.getString("codasignatura"));
                mb.setNombre(rs.getString("nombre"));
                li.add(mb);
            }
            
            request.setAttribute("lista_materias", li);
            st.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        addActionMessage("La plantilla se creó correctamente.");
        return SUCCESS;
    }
}
