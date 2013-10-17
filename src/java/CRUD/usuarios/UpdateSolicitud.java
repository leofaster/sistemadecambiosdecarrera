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
import java.util.Date;

/**
 *
 * @author CHANGE Gate
 */
public class UpdateSolicitud extends ActionSupport implements ServletRequestAware, ApplicationAware{
    private static final long serialVersionUID = 1L;
    HttpServletRequest request;
    Map m;
    String motivacion;

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
            AsignaturaConNota mb2= null;

            Map session2 = ActionContext.getContext().getSession();
            String usbido = session2.get("usbid").toString();
            
            String carn = request.getParameter("carnet");
            String nombre = request.getParameter("nombre");
            session2.put("carnet_aux", carn);
            System.out.println(carn);
            rs = st.executeQuery("select * from solicitud where usbid='"+carn+"'");
            rs.next();
            motivacion = rs.getString("motivacion");
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
    
    public String Aceptar(){
        ResultSet rs = null;
        Statement st = null;
        String string = null;
        ConexionBD.establishConnection();
        try{
            st = ConexionBD.getConnection().createStatement();
            Map session2 = ActionContext.getContext().getSession();
            
            String carnet =  session2.get("carnet_aux").toString();
            System.out.println(carnet);
            Solicitud sol = new Solicitud();
            rs = st.executeQuery("select * from solicitud where usbid='"+carnet+"' AND advertencia!='-1'");
            if(rs.next()){
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
                    String  ccS;
                    if(cc) ccS="t";
                    else ccS="f";
                    System.out.println("PP1");
                    
                    
                    st.executeUpdate("delete from solicitud where usbid='"+carnet+"' and advertencia!='-1'");
                    st.executeUpdate("insert into solicitud values"
                            + "('"
                            + carnet+"','"
                            + cod+"',"
                            + "now(),"
                            + "'-1','"
                            + "t','"
                            + ccS+"','"
                            + mot+"'"
                            + ")");
                       System.out.println("PP3");
            }
            
        }
        catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error modificando solicitudes");
        }
        
        return SUCCESS;
    }
    
    public String Negar(){
        ResultSet rs = null;
        Statement st = null;
        String string = null;
        ConexionBD.establishConnection();
        try{
            st = ConexionBD.getConnection().createStatement();
            Map session2 = ActionContext.getContext().getSession();
            
            String carnet =  session2.get("carnet_aux").toString();
            System.out.println(carnet);
            Solicitud sol = new Solicitud();
            rs = st.executeQuery("select * from solicitud where usbid='"+carnet+"' AND advertencia!='-1'");
            if(rs.next()){
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
                    String  ccS;
                    if(cc) ccS="t";
                    else ccS="f";
                    System.out.println("PP1");
                    
                    
                    st.executeUpdate("delete from solicitud where usbid='"+carnet+"' and advertencia!='-1'");
                    st.executeUpdate("insert into solicitud values"
                            + "('"
                            + carnet+"','"
                            + cod+"',"
                            + "now(),"
                            + "'-1','"
                            + "f','"
                            + ccS+"','"
                            + mot+"'"
                            + ")");
                       System.out.println("PP3");
            }
            
        }
        catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error modificando solicitudes");
        }
        
        return SUCCESS;
    }
   
    
    
    
}
