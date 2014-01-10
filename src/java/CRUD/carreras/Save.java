package CRUD.carreras;

import clases.Carrera;
import clases.ConexionBD;
import java.sql.PreparedStatement;

import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author CHANGE Gate
 */
public class Save extends ActionSupport {

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
        PreparedStatement ps;
        String s;

        try {

            ConexionBD.establishConnection();

            s = "insert into carrera values(?,?,?,?)";
            ps = ConexionBD.getConnection().prepareStatement(s);
            ps.setInt(1, mb.getCodcarrera());
            ps.setString(2, mb.getNombre());
            ps.setInt(3, mb.getCupos());
            ps.setDouble(4, mb.getIndiceMin());

            ps.executeUpdate();




            ps.close();


        } catch (Exception e) {
            e.printStackTrace();
        }


        return SUCCESS;

    }
}
