package java4s.carrera;
import clases.Carrera;
import java4s.*;
import clases.Usuario;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.opensymphony.xwork2.ActionSupport;
public class Updates extends ActionSupport{	
	private static final long serialVersionUID = 1L;
	
	Carrera mb=new Carrera();	
	
	public Carrera getMb() {
		return mb;
	}
	public void setMb(Carrera mb) {
		this.mb = mb;
	}

	public String execute()
	{
	
	try{
	Class.forName("org.postgresql.Driver"); 
    java.sql.Connection con =DriverManager.getConnection("jdbc:postgresql://localhost:5432/prueba","postgres","18588");
	
	String s = "update carrera set nombre=?,cupos=?,indice_min=? where codcarrera=?";	
	PreparedStatement ps=con.prepareStatement(s);
	ps.setInt(4, mb.getCodcarrera());
        ps.setString(1, mb.getNombre());
        ps.setInt(2, mb.getCupos());
        ps.setDouble(3, mb.getIndice_min());
        
	
	
	ps.executeUpdate();
	con.commit();
	
		ps.close();  		
		con.close();

		    } 
		catch(Exception e){ 
 			e.printStackTrace(); 
 		}

		
			return SUCCESS;
		
	}
	
}
