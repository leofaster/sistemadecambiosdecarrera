package CRUD.carreras;

import clases.Carrera;
import clases.ConexionBD;
import java.sql.PreparedStatement;

import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author CHANGE Gate
 */
public class Updates extends ActionSupport {

    private static final long serialVersionUID = 1L;
    Carrera mb = new Carrera();

    /**
     *
     * @return
     */
    public Carrera getMb() {
        return mb;
    }

    /**
     *
     * @param mb
     */
    public void setMb(Carrera mb) {
        this.mb = mb;
    }

    /**
     *
     * @return
     */
    public String execute() {

        try {
            ConexionBD.establishConnection();

            String s = "update carrera set nombre=?,cupos=?,indice_min=? where codcarrera=?";
            PreparedStatement ps = ConexionBD.getConnection().prepareStatement(s);
            ps.setInt(4, mb.getCodcarrera());
            ps.setString(1, mb.getNombre());
            ps.setInt(2, mb.getCupos());
            ps.setDouble(3, mb.getIndiceMin());



            ps.executeUpdate();


            ps.close();


        } catch (Exception e) {
            e.printStackTrace();
        }


        return SUCCESS;

    }
}
