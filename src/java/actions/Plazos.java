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
public class Plazos extends ActionSupport implements ServletRequestAware {

    /**
     *
     */
    public String trimMin;
    /**
     *
     */
    public String carrera;
    /**
     *
     */
    public String trimMax;
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
            try {

                System.out.println("Conecto");
                s = ConexionBD.getConnection().createStatement();
                System.out.println("Conecto2");
                
                
                System.out.println("Ejecuto validate");
                String carrera;


                if (rs.next()) {

                    rs2 = s.executeQuery("SELECT * FROM PLAZOS WHERE codcarrera='" + this.carrera + "'");
                    if (!rs2.next()) {
                        addFieldError("carrera", "Introduzca una carrera válida.");
                    }

                    if (trimMin.length() < 1) {
                        addFieldError("cantCupos", "Introduzca un número.");
                    }
//                    for (int x = 0; x < cantCupos.length(); x++) {
//                        if (cantCupos.charAt(x) < '0' || cantCupos.charAt(x) > '9') {
//                            addFieldError("cantCupos", "Introduzca una cantidad de cupos válida.");
//                            return;
//                        }
//                        //System.out.println(cantCupos.charAt(x));
//                    }



                } else {
                    addActionError("Error en la Operacion");
                    addFieldError("cohorte", "Cohorte introducida inválida.");
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
//    public String actualizarCupos() throws Exception {
//        ResultSet rs = null, rs2 = null;
//        Statement s = null;
//        ConexionBD.establishConnection();
//        String string = null;
//        try {
//
//            s = ConexionBD.getConnection().createStatement();
//            System.out.println("Conecto1023");
//            Map session2 = ActionContext.getContext().getSession();
//            String usbid = session2.get("usbid").toString();            
//            System.out.println("Ejecuto");
//            String carrera;
//
//
//            if (rs.next()) {
//                
//                rs2 = s.executeQuery("SELECT * FROM contiene WHERE cohorte='" + this.cohorte + "' AND "
//                        + " codcarrera='" + this.carrera + "'");
//                if (!rs2.next()) {
//                    return "no success";
//                }
//
//                for (int x = 0; x < cantCupos.length(); x++) {
//                    if (cantCupos.charAt(x) < '0' || cantCupos.charAt(x) > '9') {
//                        return "no success";
//                    }
//
//                    System.out.println(cantCupos.charAt(x));
//                }
//
//                System.out.println("Bien");
//                s.executeUpdate("UPDATE contiene SET CUPOS='" + cantCupos + "' where codcarrera='" + this.carrera + "' and cohorte='" + this.cohorte + "'");
//                addActionMessage("Cupos Cambiados");
//                return "success";
//
//            } else {
//                return "no success";
//            }
//
//
//        } catch (Exception e) {
//            System.out.println("Problem in searching the database 100");
//        }
//        return "no success";
//    }
    
}
