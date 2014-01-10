package clases;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author CHANGE Gate
 */
public class Carrera implements Serializable {

    private int codcarrera;
    private String nombre;
    private double indiceMin;
    
    private int cupos;

    /**
     *
     * @return
     */
    public int getCupos() {
        return cupos;
    }

    /**
     *
     * @param cupos
     */
    public void setCupos(int cupos) {
        this.cupos = cupos;
    }
    
    /**
     *
     */
    public Carrera() {
    }

    /**
     *
     * @param codcarrera
     */
    public Carrera(int codcarrera) {
        this.codcarrera = codcarrera;
        ResultSet rs;
        Statement st;
        ConexionBD.establishConnection();
        try {
            st = ConexionBD.getConnection().createStatement();
            rs = st.executeQuery("SELECT * FROM CARRERA WHERE CODCARRERA = " + this.codcarrera);

            if (rs.next()) {
                this.nombre = rs.getString("nombre");
                this.indiceMin = rs.getDouble("indice_min");
            } else {
                System.out.println("No se puede crear la carrera.");
            }
        
            rs.close();
            st.close();

        } catch (Exception e) {
            System.out.println("Problem in searching the database Carrera");
        }
    }

    /**
     *
     * @return
     */
    public int getCodcarrera() {
        return codcarrera;
    }

    /**
     *
     * @param codcarrera
     */
    public void setCodcarrera(int codcarrera) {
        this.codcarrera = codcarrera;
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
    public double getIndiceMin() {
        return indiceMin;
    }

    /**
     *
     * @param indiceMin
     */
    public void setIndiceMin(double indiceMin) {
        this.indiceMin = indiceMin;
    }
}