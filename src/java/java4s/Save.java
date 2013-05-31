package java4s;
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
	Class.forName("org.postgresql.Driver"); 
    java.sql.Connection con =DriverManager.getConnection("jdbc:postgresql://localhost:5432/prueba","postgres","18588");
	
    
        s = "insert into usuario values(?,?,?,?,?,CAST(? AS tipo_rol))";
	ps=con.prepareStatement(s);
	ps.setString(1, mb.getUsbid());
        ps.setInt(2, mb.getCedula());
        ps.setString(3, mb.getNombre());
        ps.setString(4, mb.getApellido());
        ps.setString(5, mb.getContrasena());
	ps.setString(6, mb.getRol());
	
	ps.executeUpdate();
//	con.commit();
        
        
	
		ps.close();  		
		con.close();

		    } 
		catch(Exception e){ 
 			e.printStackTrace(); 
 		}

		
			return SUCCESS;
		
	}
	
}
