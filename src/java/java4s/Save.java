package java4s;
import clases.ConexionBD;
import clases.Usuario;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.opensymphony.xwork2.ActionSupport;
public class Save extends ActionSupport{	
	private static final long serialVersionUID = 1L;
	
	Usuario mb=new Usuario();	
	
	public Usuario getMb() {
		return mb;
	}
	public void setMb(Usuario mb) {
		this.mb = mb;
	}


	public String execute()
	{
	PreparedStatement ps;
        String s;
        
	try{
	ConexionBD.establishConnection();
	
    
        s = "insert into usuario values(?,?,?,?,?,CAST(? AS tipo_rol))";
	ps=ConexionBD.getConnection().prepareStatement(s);
	ps.setString(1, mb.getUsbid());
        ps.setInt(2, mb.getCedula());
        ps.setString(3, mb.getNombre());
        ps.setString(4, mb.getApellido());
        ps.setString(5, mb.getContrasena());
	ps.setString(6, mb.getRol());
	
	ps.executeUpdate();

        
        
	
		ps.close();  		
		

		    } 
		catch(Exception e){ 
 			e.printStackTrace(); 
 		}

		
			return SUCCESS;
		
	}
	
}
