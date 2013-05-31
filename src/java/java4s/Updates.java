package java4s;
import clases.ConexionBD;
import clases.Usuario;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.opensymphony.xwork2.ActionSupport;
/**
 *
 * @author CHANGE Gate
 */
public class Updates extends ActionSupport{	
	private static final long serialVersionUID = 1L;
	
	Usuario mb=new Usuario();	
	
	/**
     *
     * @return
     */
    public Usuario getMb() {
		return mb;
	}
	/**
     *
     * @param mb
     */
    public void setMb(Usuario mb) {
		this.mb = mb;
	}

	/**
     *
     * @return
     */
    public String execute()
	{
	
	try{
	ConexionBD.establishConnection();
	
	String s = "update usuario set cedula=?,nombre=?,apellido=?,rol=CAST(? AS tipo_rol) where usbid=?";	
	PreparedStatement ps=ConexionBD.getConnection().prepareStatement(s);
	ps.setString(5, mb.getUsbid());
        ps.setInt(1, mb.getCedula());
        ps.setString(2, mb.getNombre());
        ps.setString(3, mb.getApellido());
        
	ps.setString(4, mb.getRol());
	
	
	ps.executeUpdate();
	
	
		ps.close();  		
		

		    } 
		catch(Exception e){ 
 			e.printStackTrace(); 
 		}

		
			return SUCCESS;
		
	}
	
}
