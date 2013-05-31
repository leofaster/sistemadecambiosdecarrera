package java4s.carrera;
import clases.ConexionBD;
import java4s.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.opensymphony.xwork2.ActionSupport;

public class Delete extends ActionSupport implements ServletRequestAware{	
	private static final long serialVersionUID = 1L;
	
	
	HttpServletRequest request;	    
    
	
	
	public String execute()
	{			
		
	try{
	ConexionBD.establishConnection();
    PreparedStatement ps=null;
	
    String cv[]=request.getParameterValues("rdel");
    
	for(int i=0;i<cv.length;i++)
	{
		ps=ConexionBD.getConnection().prepareStatement("delete from carrera where codcarrera=?");
		int k = Integer.parseInt(cv[i]);
		System.out.println("Lo que se quiere eliminar es " +k);
		ps.setInt(1,k);	
		ps.executeUpdate();

	}	
	
		ps.close();  		
		

		    } 
		catch(Exception e){ 
 			e.printStackTrace(); 
 		}

		
			return SUCCESS;
		
	}
	
	public void setServletRequest(HttpServletRequest request) {
        this.request = request;
    }

    public HttpServletRequest getServletRequest() {
        return request;
    }
	
}
