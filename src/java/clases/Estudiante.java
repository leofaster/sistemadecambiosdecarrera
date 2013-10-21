package clases;

import java.util.*;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author CHANGE Gate
 */
public class Estudiante extends Usuario {

    private String usbid;
    private double indice;
    private Carrera carreraOrigen;
    private boolean cbAprobado;

    public Estudiante() {
    }

    public Estudiante(String usbid) {
        this.usbid = usbid;
        ResultSet rs;
        Statement st;
        ConexionBD.establishConnection();
        try {
            st = ConexionBD.getConnection().createStatement();
            rs = st.executeQuery("SELECT * FROM ESTUDIANTE WHERE USBID = '" + this.usbid + "'");

            if (rs.next()) {
                this.indice = rs.getDouble("indice");
                this.carreraOrigen = new Carrera(rs.getInt("codcarrera"));
                this.cbAprobado = rs.getBoolean("cb_aprobado");
            } else {
                System.out.println("No se puede crear el estudiante.");
            }
        
            rs.close();
            st.close();

        } catch (Exception e) {
            System.out.println("Problem in searching the database Estudiante");
        }
    }
    
    public double getIndice() {
        return indice;
    }

    public void setIndice(double indice) {
        this.indice = indice;
    }

    public Carrera getCarreraOrigen() {
        return carreraOrigen;
    }

    public void setCarreraOrigen(Carrera carreraOrigen) {
        this.carreraOrigen = carreraOrigen;
    }

    public boolean isCbAprobado() {
        return cbAprobado;
    }

    public void setCbAprobado(boolean cbAprobado) {
        this.cbAprobado = cbAprobado;
    }
    
    public boolean verificarCicloBasicoAprobado() throws Exception {
        
        ResultSet rs;
        Statement st;
        ConexionBD.establishConnection();
        List<String> aprobadas = null;
        aprobadas = new ArrayList<String>();
        List<String> obligatorias = null;
        obligatorias = new ArrayList<String>();
        String s;

        try {
            st = ConexionBD.getConnection().createStatement();
            rs = st.executeQuery("SELECT * FROM ESTUDIANTE NATURAL JOIN CURSA NATURAL JOIN CALIFICACION WHERE NOTA >= '3' AND USBID = '" + this.usbid + "'");

            while (rs.next()) {
                s = rs.getString("codasignatura");
                aprobadas.add(s);
            }
            
            rs = st.executeQuery("SELECT * FROM CICLO_BASICO WHERE CODCARRERA='" + this.carreraOrigen.getCodcarrera() + "'");

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
