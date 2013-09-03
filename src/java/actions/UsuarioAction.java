/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
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
        return SUCCESS;
    }
    
    /**
     *
     */
    @Override
    public void validate() {
        if (getUsbid().length() == 0) {
            addFieldError("userName", getText("username.required"));
        } else if (!getUsbid().equals("Shiva")) {
            addFieldError("userName", getText("username.wrong"));
        }
        if (getContrasena().length() == 0) {
            addFieldError("password", getText("password.required"));
        }
        session.put("usbid", getUsbid());
        session.put("constrasena", getContrasena());
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
