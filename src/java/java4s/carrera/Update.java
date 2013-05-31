package java4s.carrera;
import java4s.*;
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
   
    
	    ps=con.prepareStatement("select * from carrera where usbid=?");
	    String a = request.getParameter("fid");
		String k = a;
		ps.setString(1,k);			
	    //System.out.println("This is" +k);
		
		ResultSet res = ps.executeQuery();		
		List l=new ArrayList();
		
		while(res.next())
		{			
			m.put("a",res.getInt("codcarrera"));
                        m.put("b",res.getString("nombre"));
                        m.put("c",res.getInt("cupos"));
                        m.put("d",res.getDouble("INDICE_MIN"));
			
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
