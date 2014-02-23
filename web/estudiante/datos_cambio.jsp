<%-- 
    Document    : indexCoordinador
    Author      : CHANGE Gate
--%>

<%@page import="com.opensymphony.xwork2.ActionContext"%>
<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>

<center><h4>Perfil del Estudiante</h4> </center>
<br/><br/>
<table border="0"> 
    <tr>
        <td><b>Nombre:</b></td>
        <td><s:property value="nombre" /> <s:property value="apellido" /></td>
    </tr>
    <tr>
        <td><b>Carnet:</b></td>
        <td><s:property value="usbid" /></td>
    </tr>
    <tr>
        <td><b>Índice:</b></td>
        <td><s:property value="indice" /></td>
    </tr>
    <tr>
        <td><b>Carrera de origen:</b></td>
        <td><s:property value="carreraOrigen.nombre" /></td>
    </tr>
    <tr>
        <td><b>Carrera de destino:</b></td>
        <td><s:property value="solicitud.carrera.nombre" /></td>
    </tr>
    <tr>
        <td><b>Motivación para el cambio:     </b></td>
        <td><s:property value="solicitud.motivacion" /></td>
    </tr>
    <tr>
        <td><b>Extraplanes asignados:</b></td>
        <td>Aqui van extraplanes</td>
    </tr>
</table>
<br/>
<center><b>Archivos asociados</b></center><br />
<div class="tablaFormal">
    <table >

        <%
            //List l = (List) request.getAttribute("listaSolicitudes");
        %>
        <tr>
            <td class="bord"><center><b>Nombre del archivo</b></center></td>
        <td class="bord"><center><b>Descargar</b></center></td>
        </tr>
        <%
            //Iterator it = l.iterator();

            //while (it.hasNext()) {
              //  clases.Solicitud b = (clases.Solicitud) it.next();
                //String nombre = b.getEstudiante().getNombre();
                //String carnet = b.getEstudiante().getUsbid();

        %>
        <tr> 
            <td class="bord"><center>nombre</center></td>
            <td class="bord">
                <center>
                    <a href="javascript:editact('')">
                        <img src="images/save.png" alt="Editar" 
                             title="Editar" width="20" height="20">
                    </a>
                </center>
            </td>
        </tr> 
        <%
            //}
        %>
    </table>    
</div>
<br/>
<center>
    <form action="upload" method="post" enctype="multipart/form-data">
      <label for="archivo">Cargar archivo:</label>
      <input type="file" name="archivo" /><br>
      <input type="submit" value="Cargar"/>
   </form>
</center>
<br/>
<%
    Map sesion = ActionContext.getContext().getSession();
    if (sesion.get("rol").toString().equals("Coordinador")) {
%>
<table>
    <tr>
        <td>
            <s:form action="Aprobar">
                <center>    
                    <s:submit  value="Aprobar Cambio" type="button"/>
                </center>
            </s:form>
        </td>
        <td>
            <s:form action="Denegar">
                <center>
                    <s:submit  value="Negar Cambio" type="button"/>
                </center>
            </s:form>
        <td>
    </tr>
</table>
<%  }
%>