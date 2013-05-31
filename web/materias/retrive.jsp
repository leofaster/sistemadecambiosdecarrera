<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.*;" %>

<head>
<link rel="stylesheet" type="text/css" href="/css/java4s.css" />
<script type="text/javascript">
function deleteRecord()
	{	     
	    document.fom.action="del.carrera.action";
	    document.fom.submit();
	}
function editr(val)
{	     
    document.fom.action="update.carrera.action?fid="+val;
    document.fom.submit();
}	
</script>
</head>

<a href="<s:url action="saveLink.carrera"/>">Insert</a>

<br><br>

<table class="bordt">
<form name="fom" method="post">
<% 
List l=(List)request.getAttribute("disp");
if(l!=null)
{

	Iterator it=l.iterator();
	
	while(it.hasNext())
	{
		
		clases.Carrera b=(clases.Carrera)it.next();
		int tempCodCarrera = b.getCodcarrera();
		String tempNombre = b.getNombre();
                int tempCupos = b.getCupos();
                Double tempIndice = b.getIndice_min();
                
		

%>
        <tr> 
        <td class="bord"><input type="checkbox" value="<%= tempCodCarrera %>" name="rdel"></td>
        <td class="bord"><%= tempCodCarrera %></td>
        <td class="bord"><%= tempNombre %></td>
        <td class="bord"><%= tempCupos %></td>
        <td class="bord"><%= tempIndice %></td>
        
        
        
        <td class="bord"><a href="javascript:editr('<%= tempCodCarrera %>')">Edit</a></td>         
        </tr> 
        
<% 		
				
	}	
}

%>  
<input type="button" value="delete" onclick="deleteRecord();">
</table>

</form>

