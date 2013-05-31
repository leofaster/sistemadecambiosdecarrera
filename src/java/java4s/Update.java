package java4s;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class Update extends ActionSupport implements ServletRequestAware,ApplicationAware{	
	private static final long serialVersionUID = 1L;
	
	HttpServletRequest request;
	Map m;
	
	
	public void setServletRequest(HttpServletRequest request) {
        this.request = request;
    }

    public HttpServletRequest getServletRequest() {
        return request;
    }

    public void setApplication(Map m)
	{
		this.m=m;
	}   
	
	
	public String execute()
	{		
	try{
	Class.forName("org.postgresql.Driver"); 
    java.sql.Connection con =DriverManager.getConnection("jdbc:postgresql://localhost:5432/prueba","postgres","18588");
    PreparedStatement ps=null;	
   
    
	    ps=con.prepareStatement("select * from usuario where usbid=?");
	    String a = request.getParameter("fid");
		String k = a;
		ps.setString(1,k);			
	    //System.out.println("This is" +k);
		
		ResultSet res = ps.executeQuery();		
		List l=new ArrayList();
		
		while(res.next())
		{			
			m.put("a",res.getString("usbid"));
                        m.put("b",res.getInt("cedula"));
                        m.put("c",res.getString("Nombre"));
                        m.put("d",res.getString("Apellido"));
                        m.put("f", res.getString("rol"));
			
		}
	
		ps.close();  		
		con.close();

	    } 
		    catch(Exception e){ 
 			e.printStackTrace(); 
 	}

		
			return SUCCESS;
		
	}


}
