/**
 *
 * @author CHANGE Gate
 */

package clases;

import com.opensymphony.xwork2.ActionContext;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Coordinador extends Usuario {

    public String estudiantesEnCambio() throws Exception {
        ResultSet rs;
        Statement st;
        ConexionBD.establishConnection();
        Map sesion = ActionContext.getContext().getSession();
        String coord = sesion.get("usbid").toString();
        
        try {
            st = ConexionBD.getConnection().createStatement();
            rs = st.executeQuery(
                      "SELECT * "
                    + "FROM COORDINADOR "
                    + "WHERE USBID='"+coord+"'");
            rs.next();
            String carr = rs.getString("codcarrera");
            
            rs = st.executeQuery(
                      "SELECT * "
                    + "FROM SOLICITUD NATURAL JOIN USUARIO "
                    + "WHERE SOL_ACEPTADA='A' "
                      + "AND CODCARRERA='" + carr + "' "
                      + "AND cc_aprobado='P'"
                    );
            
            List<Solicitud> li;
            li = new ArrayList<Solicitud>();
            Solicitud sol;
            Estudiante es;

            while (rs.next()) {
                sol = new Solicitud();
                es = new Estudiante();
                es.setUsbid(rs.getString("usbid"));
                es.setNombre(rs.getString("nombre") + " " + 
                             rs.getString("apellido"));
                sol.setEstudiante(es);
               
                li.add(sol);
            }
            
            request.setAttribute("listaSolicitudes", li);

            rs.close();
            st.close();
            return "success";
            
        } catch (Exception e) {
            System.out.println("Problem in DIDE.estudiantesEnCambio");
            return "no success";
        }
    }
}