/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.util.*;
import java.io.Serializable;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Map;

/**
 *
 * @author CHANGE Gate
 */
public class Estudiante extends Usuario implements Serializable {

    private String usbid;
    private double indice;
    private Carrera carreraOrigen;
    private boolean cbAprobado;
    // Listade asignaturas que cursa el estudiante
    private LinkedList<AsignaturaConNota> asignaturas;

    /**
     *
     * @return
     */
    public double getIndice() {
        return indice;
    }

    /**
     *
     * @param indice
     */
    public void setIndice(double indice) {
        this.indice = indice;
    }

    /**
     *
     * @return
     */
    public Carrera getCarreraOrigen() {
        return carreraOrigen;
    }

    /**
     *
     * @param carreraOrigen
     */
    public void setCarreraOrigen(Carrera carreraOrigen) {
        this.carreraOrigen = carreraOrigen;
    }

    /**
     *
     * @return
     */
    public boolean isCbAprobado() {
        return cbAprobado;
    }

    /**
     *
     * @param cbAprobado
     */
    public void setCbAprobado(boolean cbAprobado) {
        this.cbAprobado = cbAprobado;
    }

    /**
     *
     * @return
     */
    public LinkedList<AsignaturaConNota> getAsignaturas() {
        return asignaturas;
    }

    /**
     *
     * @param asignaturas
     */
    public void setAsignaturas(LinkedList<AsignaturaConNota> asignaturas) {
        this.asignaturas = asignaturas;
    }

    public static boolean verificarCicloBasicoAprobado(String usbidE) throws Exception {
        ResultSet rs = null;
        Statement st = null;
        ConexionBD.establishConnection();
        List<String> aprobadas = null;
        aprobadas = new ArrayList<String>();
        List<String> obligatorias = null;
        obligatorias = new ArrayList<String>();
        String s = null;

        try {
            st = ConexionBD.getConnection().createStatement();
            rs = st.executeQuery("SELECT * FROM ESTUDIANTE NATURAL JOIN CURSA NATURAL JOIN CALIFICACION WHERE NOTA >= '3' AND USBID = '" + usbidE + "'");


            while (rs.next()) {
                s = rs.getString("codasignatura");
                aprobadas.add(s);
            }

            rs = st.executeQuery("SELECT CODCARRERA FROM ESTUDIANTE WHERE USBID='" + usbidE + "'");
            rs.next();
            int carrera;
            carrera = rs.getInt("codcarrera");

            rs = st.executeQuery("SELECT * FROM CICLO_BASICO WHERE CODCARRERA='" + carrera + "'");

            while (rs.next()) {
                s = rs.getString("codasignatura");
                obligatorias.add(s);
            }

            rs.close();
            st.close();

        } catch (Exception e) {
            System.out.println("Problem in searching the database verificarCicloBasicoAprobado");
        }

        boolean aprobado = true;

        for (Object objList : obligatorias) {
            aprobado = aprobadas.contains(objList);
            if (!aprobado) {
                break;
            }
        }
        return aprobado;
    }
}
