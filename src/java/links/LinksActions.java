/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package links;

import actions.Plantillas;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author CHANGE Gate
 */
public class LinksActions extends ActionSupport implements ServletRequestAware {

    private HttpServletRequest request;

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }
    
    public String recomendarExtraplanes() throws Exception {
        Map session = ActionContext.getContext().getSession();
        if (request != null) {
            session.put("rec_usbid", request.getParameter("usbid"));
            session.put("rec_nombre", request.getParameter("nombre"));
            session.put("rec_indice", request.getParameter("indice"));
            session.put("rec_cOrigen", request.getParameter("cOrigen"));
        }
        Plantillas p = new Plantillas();
        p.listarPlantillas();
        return "recomendarExtraplanes";
    }
    
    public String EstudiantesCambioDIDE() {
        return "EstudiantesCambioDIDE";
    }
    
    public String EstudiantesCambioCoord() {
        return "EstudiantesCambioCoord";
    }
    
    public String GestionUsuarios() {
        return "GestionUsuarios";
    }
    
    public String GestionCarreras() {
        return "GestionCarreras";
    }
    
    public String GestionCupos() {
        return "GestionCupos";
    }
    
    public String GestionPlazos() {
        return "GestionPlazos";
    }
    
    public String SolicitudesEstudiantes() {
        return "SolicitudesEstudiantes";
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

    public void setServletRequest(HttpServletRequest hsr) {
        this.request = hsr;
    }
    
    public HttpServletRequest getServletRequest() {
        return request;
    }
}

