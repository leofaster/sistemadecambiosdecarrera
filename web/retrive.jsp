<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.*;" %>

<head>
<link rel="stylesheet" type="text/css" href="css/java4s.css" />
<script type="text/javascript">
function deleteRecord()
	{	     
	    document.fom.action="del.action";
	    document.fom.submit();
	}
function editr(val)
{	     
    document.fom.action="update.action?fid="+val;
    document.fom.submit();
}	
</script>
</head>

<a href="<s:url action="saveLink.action"/>">Agregar</a>

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
		
		clases.Usuario b=(clases.Usuario)it.next();
		String tempUsbid = b.getUsbid();
		int tempCedula = b.getCedula();
                String tempNombre = b.getNombre();
                String tempApellido = b.getApellido();
                
                String tempRol = b.getRol();
		

%>
        <tr> 
        <td class="bord"><input type="checkbox" value="<%= tempUsbid %>" name="rdel"></td>
        <td class="bord"><%= tempUsbid %></td>
        <td class="bord"><%= tempCedula %></td>
        <td class="bord"><%= tempNombre %></td>
        <td class="bord"><%= tempApellido %></td>
        
        <td class="bord"><%= tempRol %></td>
        
        <td class="bord"><a href="javascript:editr('<%= tempUsbid %>')">Modificar</a></td>         
        </tr> 
        
<% 		
				
	}	
}

%>  
<input type="button" value="Eliminar" onclick="deleteRecord();">
</table>

</form>
<a href="/GestionarCatalogos.jsp">Volver</a>