/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.io.Serializable;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author CHANGE Gate
 */
public class Usuario implements ServletRequestAware {

    /**
     *
     */
    protected HttpServletRequest request;

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }
    protected String usbid;
    /**
     *
     */
    protected int cedula;
    /**
     *
     */
    protected String nombre;
    /**
     *
     */
    protected String apellido;
    private String contrasena;
    private String rol;

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

    public void setServletRequest(HttpServletRequest request) {
        this.request = request;
    }
}
