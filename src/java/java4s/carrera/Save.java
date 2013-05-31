package java4s.carrera;
import clases.Carrera;
import java4s.*;
import clases.Usuario;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.opensymphony.xwork2.ActionSupport;
public class Save extends ActionSupport{	
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
	PreparedStatement ps;
        String s;
        
	try{
	Class.forName("org.postgresql.Driver"); 
    java.sql.Connection con =DriverManager.getConnection("jdbc:postgresql://localhost:5432/prueba","postgres","18588");
	
    
        s = "insert into carrera values(?,?,?,?,CAST(? AS tipo_rol))";
	ps=con.prepareStatement(s);
	ps.setInt(1, mb.getCodcarrera());
        ps.setString(2, mb.getNombre());
        ps.setInt(3, mb.getCupos());
        ps.setDouble(4, mb.getIndice_min());
	
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
