/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import clases.ConexionBD;
import clases.Usuario;
import clases.Cohorte;
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

/**
 *
 * @author CHANGE Gate
 */
public class ModificarCupos extends ActionSupport implements ServletRequestAware {

    /**
     *
     */
    public String cantCupos;
    /**
     *
     */
    public String carrera;
    /**
     *
     */
    public String cupos;
    /**
     *
     */
    public String cohorte;
    private static final long serialVersionUID = 1L;
    HttpServletRequest request;
    private int x;

    /**
     *
     * @param value
     */
    public void setCantCupos(String value) {
        cantCupos = value;
    }

    /**
     *
     * @return
     */
    public String getCantCupos() {
        return this.cantCupos;
    }

    /**
     *
     * @param request
     */
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
     * @return
     */
    public String getCarrera() {
        return this.carrera;
    }

    /**
     *
     * @param c
     */
    public void setCarrera(String c) {
        this.carrera = c;
    }

    /**
     *
     * @return
     */
    public String getCupos() {
        return this.cupos;
    }

    /**
     *
     * @param cupo
     */
    public void setCupos(String cupo) {
        this.cupos = cupo;
    }

    /**
     *
     * @return
     */
    public String getCohorte() {
        return this.cohorte;
    }

    /**
     *
     * @return
     */
    public String cambiarCupos() {
        return SUCCESS;
    }

    /**
     *
     */
    @Override
    public void validate() {
        if (this.getCarrera().equals("-1")) {
            addFieldError("carrera", "Seleccione una carrera válida");
        }

        // if (this.getCupos()== null){
        //   addFieldError("cantCupos","Error, Favor Colocar numeros validos2");
        // }
        System.out.println(this.getCarrera());
        ResultSet rs = null, rs2 = null;
        Statement s = null;
        ConexionBD.establishConnection();
        String string = null;        
            if (this.getCohorte().equals("")) {
                addFieldError("cohorte", "Error, Favor Colocar numeros validos");

            }
            try {
                System.out.println("Cohorte: ");
                System.out.println(this.getCohorte());

                System.out.println("Conecto");
                s = ConexionBD.getConnection().createStatement();
                System.out.println("Conecto2");
                Map session2 = ActionContext.getContext().getSession();
                String usbid = session2.get("usbid").toString();
                System.out.println("Ejecuto validate");
                String carrera;


                

                    rs2 = s.executeQuery("SELECT * FROM contiene WHERE cohorte='" + this.cohorte + "' AND "
                            + " codcarrera='" + this.carrera + "'");
                    if (!rs2.next()) {
                        addFieldError("cohorte", "Introduzca una cohorte válida.");
                    }

                    if (cantCupos.length() < 1) {
                        addFieldError("cantCupos", "Introduzca un número.");
                    }
                    for (int x = 0; x < cantCupos.length(); x++) {
                        if (cantCupos.charAt(x) < '0' || cantCupos.charAt(x) > '9') {
                            addFieldError("cantCupos", "Introduzca una cantidad de cupos válida.");
                            return;
                        }
                        //System.out.println(cantCupos.charAt(x));
                    }



             

            } catch (Exception e) {
                System.out.println("Problem in searching the database 1");
            }
        }

    /**
     *
     * @param aux
     */
    public void setCohorte(String aux) {
        this.cohorte = aux;
    }

    /**
     *
     * @return
     * @throws Exception
     */
    public String actualizarCupos() throws Exception {
        ResultSet rs = null, rs2 = null;
        Statement s = null;
        ConexionBD.establishConnection();
        String string = null;
        try {

            s = ConexionBD.getConnection().createStatement();
            System.out.println("Conecto1023");
            Map session2 = ActionContext.getContext().getSession();
            String usbid = session2.get("usbid").toString();            
            System.out.println("Ejecuto");
            String carrera;


            if (rs.next()) {
                
                rs2 = s.executeQuery("SELECT * FROM contiene WHERE cohorte='" + this.cohorte + "' AND "
                        + " codcarrera='" + this.carrera + "'");
                if (!rs2.next()) {
                    return "no success";
                }

                for (int x = 0; x < cantCupos.length(); x++) {
                    if (cantCupos.charAt(x) < '0' || cantCupos.charAt(x) > '9') {
                        return "no success";
                    }

                    System.out.println(cantCupos.charAt(x));
                }

                System.out.println("Bien");
                s.executeUpdate("UPDATE contiene SET CUPOS='" + cantCupos + "' where codcarrera='" + this.carrera + "' and cohorte='" + this.cohorte + "'");
                addActionMessage("Cupos Cambiados");
                return "success";

            } else {
                return "no success";
            }


        } catch (Exception e) {
            System.out.println("Problem in searching the database 100");
        }
        return "no success";
    }
    
}
