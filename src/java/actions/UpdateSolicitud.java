/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import clases.ConexionBD;
import clases.AsignaturaConNota;
import clases.Asignatura;
import clases.Solicitud;
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
import java.util.Date;

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
            AsignaturaConNota mb2 = null;

            Map session2 = ActionContext.getContext().getSession();
            String usbido = session2.get("usbid").toString();

            String carn = request.getParameter("carnet");
            String nombre = request.getParameter("nombre");
            System.out.println(carn);
            if (carn != null) {
                session2.put("carnet_aux", carn);
            }
            if (nombre != null) {
                session2.put("nombre_aux", nombre);
            }
            carn = session2.get("carnet_aux").toString();
            nombre = session2.get("nombre_aux").toString();
            System.out.println(carn);
            rs = st.executeQuery("select * from solicitud where usbid='" + carn + "' AND ADVERTENCIA!='-1'");
            rs.next();
            motivacion = rs.getString("motivacion");
            advertencia = rs.getString("advertencia");
            rs = st.executeQuery("select * from calificacion natural join asignatura"
                    + " where usbid='" + carn
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


            nombre_est = nombre;
            this.carnet_est = carn;


            rs = st.executeQuery("select * from estudiante natural join carrera where usbid='" + carn + "'");
            rs.next();
            this.indice_sol = rs.getString("indice");
            this.carreraOrigen_sol = rs.getString("nombre");
            System.out.println(li.size());
//            request.setAttribute("carnet",carn);
//            request.setAttribute("nombre",nombre);
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
        String string = null;
        ConexionBD.establishConnection();
        try {
            st = ConexionBD.getConnection().createStatement();
            Map session2 = ActionContext.getContext().getSession();

            String carnet = session2.get("carnet_aux").toString();
            System.out.println(carnet);
            Solicitud sol = new Solicitud();
            rs = st.executeQuery("select * from solicitud where usbid='" + carnet + "' AND advertencia!='-1'");
            if (rs.next()) {
                String usbid = rs.getString("usbid");
                System.out.println("PP1");
                String cod = rs.getString("codcarrera");
                System.out.println("PP2");
                Date fecha = rs.getDate("fecha");
                System.out.println("PP3");
                boolean soli = rs.getBoolean("sol_aceptada");
                System.out.println("PP4");
                boolean cc = rs.getBoolean("cc_aprobado");
                System.out.println("PP5");
                String mot = rs.getString("motivacion");
                System.out.println("PP6");
                String ccS;
                if (cc) {
                    ccS = "t";
                } else {
                    ccS = "f";
                }
                System.out.println("PP1");


                st.executeUpdate("delete from solicitud where usbid='" + carnet + "' and advertencia!='-1'");
                st.executeUpdate("insert into solicitud values"
                        + "('"
                        + carnet + "','"
                        + cod + "',"
                        + "now(),"
                        + "'-1','"
                        + "t','"
                        + ccS + "','"
                        + mot + "'"
                        + ")");
                System.out.println("PP3");
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
        String string = null;
        ConexionBD.establishConnection();
        try {
            st = ConexionBD.getConnection().createStatement();
            Map session2 = ActionContext.getContext().getSession();

            String carnet = session2.get("carnet_aux").toString();
            System.out.println(carnet);
            Solicitud sol = new Solicitud();
            rs = st.executeQuery("select * from solicitud where usbid='" + carnet + "' AND advertencia!='-1'");
            if (rs.next()) {
                String usbid = rs.getString("usbid");
                System.out.println("PP1");
                String cod = rs.getString("codcarrera");
                System.out.println("PP2");
                Date fecha = rs.getDate("fecha");
                System.out.println("PP3");
                boolean soli = rs.getBoolean("sol_aceptada");
                System.out.println("PP4");
                boolean cc = rs.getBoolean("cc_aprobado");
                System.out.println("PP5");
                String mot = rs.getString("motivacion");
                String adver = rs.getString("advertencia");
                System.out.println("PP6");
                String ccS;
                if (cc) {
                    ccS = "t";
                } else {
                    ccS = "f";
                }
                System.out.println("PP1");
                String adverAux = "El estudiante ha sido recomendado por DIDE.\n" + adver;
                
                st.executeUpdate("update solicitud set advertencia='" + adverAux + "' where usbid='" + carnet + "'");
                st.executeUpdate("delete from recomendacion where usbid='" + carnet + "'");
                st.executeUpdate("insert into recomendacion values"
                        + "('"
                        + carnet + "',true,true)");
                System.out.println("PP3");
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
        String string = null;
        ConexionBD.establishConnection();
        try {
            st = ConexionBD.getConnection().createStatement();
            Map session2 = ActionContext.getContext().getSession();

            String carnet = session2.get("carnet_aux").toString();
            System.out.println(carnet);
            Solicitud sol = new Solicitud();
            rs = st.executeQuery("select * from solicitud where usbid='" + carnet + "' AND advertencia!='-1'");
            if (rs.next()) {
                String usbid = rs.getString("usbid");
                System.out.println("PP1");
                String cod = rs.getString("codcarrera");
                System.out.println("PP2");
                Date fecha = rs.getDate("fecha");
                System.out.println("PP3");
                boolean soli = rs.getBoolean("sol_aceptada");
                System.out.println("PP4");
                boolean cc = rs.getBoolean("cc_aprobado");
                System.out.println("PP5");
                String mot = rs.getString("motivacion");
                System.out.println("PP6");
                String ccS;
                if (cc) {
                    ccS = "t";
                } else {
                    ccS = "f";
                }
                System.out.println("PP1");


                st.executeUpdate("delete from solicitud where usbid='" + carnet + "' and advertencia!='-1'");
                st.executeUpdate("insert into solicitud values"
                        + "('"
                        + carnet + "','"
                        + cod + "',"
                        + "now(),"
                        + "'-1','"
                        + "f','"
                        + ccS + "','"
                        + mot + "'"
                        + ")");
                st.executeUpdate("delete from recomendacion where usbid='" + carnet + "'");
                System.out.println("PP3");
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
        String string = null;
        ConexionBD.establishConnection();
        try {
            st = ConexionBD.getConnection().createStatement();
            Map session2 = ActionContext.getContext().getSession();

            String carnet = session2.get("carnet_aux").toString();
            System.out.println(carnet);
            Solicitud sol = new Solicitud();
            rs = st.executeQuery("select * from solicitud where usbid='" + carnet + "' AND advertencia!='-1'");
            if (rs.next()) {
                String usbid = rs.getString("usbid");
                System.out.println("PP1");
                String cod = rs.getString("codcarrera");
                System.out.println("PP2");
                Date fecha = rs.getDate("fecha");
                System.out.println("PP3");
                boolean soli = rs.getBoolean("sol_aceptada");
                System.out.println("PP4");
                boolean cc = rs.getBoolean("cc_aprobado");
                System.out.println("PP5");
                String mot = rs.getString("motivacion");
                System.out.println("PP6");
                String adver = rs.getString("advertencia");
                String ccS;
                if (cc) {
                    ccS = "t";
                } else {
                    ccS = "f";
                }
                System.out.println("PP1");

                String adverAux = "DIDE no recomienda al estudiante.\n" + adver;
                
                st.executeUpdate("update solicitud set advertencia='" + adverAux + "' where usbid='" + carnet + "'");
                st.executeUpdate("delete from recomendacion where usbid='" + carnet + "'");
                st.executeUpdate("insert into recomendacion values"
                        + "('"
                        + carnet + "',false,true)");
                System.out.println("PP3");
                addActionMessage("La solicitud se ha procesado con éxito.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error modificando solicitudes");
        }

        return SUCCESS;
    }
}
