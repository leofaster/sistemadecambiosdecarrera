package java4s;

import clases.Usuario;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.opensymphony.xwork2.ActionSupport;


public class Display extends ActionSupport implements ServletRequestAware{	
	private static final long serialVersionUID = 1L;
	
	HttpServletRequest request;
	
	
	public String execute()
	{
	
	try{
	Class.forName("org.postgresql.Driver"); 
    java.sql.Connection con =DriverManager.getConnection("jdbc:postgresql://localhost:5432/prueba","postgres","18588");
	Statement st=con.createStatement(); 
	ResultSet rs = st.executeQuery("select * from usuario order by usbid");
	
    	List<Usuario> li = null;
    	li = new ArrayList<Usuario>();   
    	Usuario mb = null;
    
		while(rs.next()) 
			{ 	
			    mb = new Usuario();
			 
			    mb.setUsbid(rs.getString("usbid"));
                            mb.setCedula(rs.getInt("cedula"));
			    mb.setNombre(rs.getString("nombre"));
                            mb.setApellido(rs.getString("apellido"));
                            mb.setContrasena(rs.getString("contrasena"));
                            mb.setRol(rs.getString("rol"));
			    
			    
			    li.add(mb);
			    
			}
			
		request.setAttribute("disp", li);
		
		rs.close(); 
 		st.close(); 
		con.close();

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
