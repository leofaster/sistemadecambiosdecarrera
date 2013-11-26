/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package links;

import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author CHANGE Gate
 */
public class LinksActions extends ActionSupport {

    public String SolicitarCupoEstudiante() {
        return "SolicitarCupoEstudiante";
    }

    public String modificarCupos() {
        return "modificarCupos";
    }

    public String verCupos() {
        return "verCupos";
    }

    public String verSolicitudes() {
        return "verSolicitudes";
    }
    public String home() {
        return "home";
    }
    public String login() {
        return "login";
    }
    public String instrucciones() {
        return "instrucciones";
    }
}

