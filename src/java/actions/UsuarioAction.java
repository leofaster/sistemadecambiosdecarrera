/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import clases.ConexionBD;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author CHANGE Gate
 */
public class UsuarioAction extends ActionSupport implements SessionAware {

    private String usbid;
    private int cedula;
    private String nombre;
    private String apellido;
    private String contrasena;
    private String rol;
    private Map session;

    /**
     *
     * @return
     */
    @Override
    public String execute() {
        Map session2 = ActionContext.getContext().getSession();
        return session2.get("rol").toString();
    }

    /**
     *
     */
    @Override
    public void validate() {

        if (getUsbid().length() == 0) {
            addFieldError("usbid", getText("usbid.required"));
        }
        if (getContrasena().length() == 0) {
            addFieldError("contrasena", getText("contrasena.required"));
        }

        if (getUsbid().equals("admin") && getContrasena().equals("admin")) {
            session.put("usbid", getUsbid());
            session.put("rol", "admin");
            return;
        }

        ResultSet rs = null;
        Statement s = null;
        ConexionBD.establishConnection();
        
        try {
            s = ConexionBD.getConnection().createStatement();
            rs = s.executeQuery("SELECT * FROM usuario WHERE usbid='" + getUsbid() + "' AND contrasena='" + getContrasena() + "'");
            
            if (rs.next()) {
                System.out.println("si se consiguio algo");
                System.out.println("rol" + rs.getString("rol"));
                session.put("usbid", rs.getString("usbid"));
                session.put("cedula", rs.getString("cedula"));
                session.put("nombre", rs.getString("nombre"));
                session.put("apellido", rs.getString("apellido"));
                session.put("rol", rs.getString("rol"));
            } else {
                System.out.println("NO se consiguio algo");
                addActionError("Usuario o contraseña inválido.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioAction.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     *
     * @return
     */
    public Map getSession() {
        return session;
    }

    /**
     *
     * @param session
     */
    public void setSession(Map session) {
        this.session = session;
    }

    /**
     *
     * @return
     */
    public String getUsbid() {
        return usbid;
    }

    /**
     *
     * @param usbid
     */
    public void setUsbid(String usbid) {
        this.usbid = usbid;
    }

    /**
     *
     * @return
     */
    public int getCedula() {
        return cedula;
    }

    /**
     *
     * @param cedula
     */
    public void setCedula(int cedula) {
        this.cedula = cedula;
    }

    /**
     *
     * @return
     */
    public String getNombre() {
        return nombre;
    }

    /**
     *
     * @param nombre
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     *
     * @return
     */
    public String getApellido() {
        return apellido;
    }

    /**
     *
     * @param apellido
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    /**
     *
     * @return
     */
    public String getContrasena() {
        return contrasena;
    }

    /**
     *
     * @param contrasena
     */
    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    /**
     *
     * @return
     */
    public String getRol() {
        return rol;
    }

    /**
     *
     * @param rol
     */
    public void setRol(String rol) {
        this.rol = rol;
    }
}
