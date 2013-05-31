package java4s.carrera;
import clases.Carrera;
import clases.ConexionBD;
import java.sql.PreparedStatement;

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
	
	ConexionBD.establishConnection();
    
        s = "insert into carrera values(?,?,?,?)";
	ps=ConexionBD.getConnection().prepareStatement(s);
	ps.setInt(1, mb.getCodcarrera());
        ps.setString(2, mb.getNombre());
        ps.setInt(3, mb.getCupos());
        ps.setDouble(4, mb.getIndice_min());
	
	ps.executeUpdate();

        
        
	
		ps.close();  		
		

		    } 
		catch(Exception e){ 
 			e.printStackTrace(); 
 		}

		
			return SUCCESS;
		
	}
	
}
