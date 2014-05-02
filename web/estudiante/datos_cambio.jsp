<%-- 
    Document    : indexCoordinador
    Author      : CHANGE Gate
--%>

<%@page import="com.opensymphony.xwork2.ActionContext"%>
<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>

<link rel="stylesheet" href="stylesheets/jquery-ui.css">
<script src="javascripts/jquery-1.10.2.js"></script>
<script src="javascripts/jquery-ui.js"></script>
<script type="text/javascript">
    function descargar(val) {
        document.fom.action = "download.action?ruta=" + val;
        document.fom.submit();
    }
</script>
<script>
    $(function() {

        $("#dialog").dialog({
            height: 580,
            width: 800,
            modal: true,
            autoOpen: false,
            show: {
                effect: "blind",
                duration: 1000
            }
        });


        $("#opener").click(function() {
            $("#dialog").dialog("open");
        });
    });
</script>




<div id="dialog" title="Informe Académico" style="overflow: scroll;">
    <%
        List l = (List) request.getAttribute("materias");
        if (l != null && l.size() != 0) {
    %>
    <center>
        <div class="tablaFormal">
            <table>
                <tr>
                    <td><center><b>Materia</b></center></td>
                    <td><center><b>Código</b></center></td>
                    <td><center><b>Nota</b></center></td>
                </tr>
    <%
            Iterator it = l.iterator();
                while (it.hasNext()) {
                    clases.AsignaturaConNota b = (clases.AsignaturaConNota) it.next();
                    String nombre = b.getAsignatura().getNombre();
                    String codigo = b.getAsignatura().getCodigoS();
                    String nota = b.getNota() + "";
    %>
                <tr>
                    <td><center><%= nombre%></center></td>
                    <td><center><%= codigo%></center></td>
                    <td><center><%= nota%></center></td>
                </tr>
    <%
                }
    %>

            </table>
        </div>

    <%
            }
    %>
    </center>
</div>
<s:actionerror />
<% if (session.getAttribute("error") != null && session.getAttribute("error").equals("true")) { %>
    <div class="denyDiv" style="color: white;">
        &nbsp;&nbsp;No se pudo cargar el archivo.
    </div>
    <br />
<%  session.setAttribute("error","false");
  }%>
<% if (session.getAttribute("success") != null && session.getAttribute("success").equals("true")) { %>
    <div class="aproveDiv" style="color: white;">
        &nbsp;&nbsp;Archivo subido exitosamente.
    </div>
    <br />
<%  session.setAttribute("success","false");
  }%>

<center><h4>Perfil del Estudiante</h4> </center>
<br/>
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
        
        
        <td>Aqui van extraplanes<br/>
        <%
            Map sesion = ActionContext.getContext().getSession();
            if (sesion.get("rol").toString().equals("Coordinador")) {
        %>
        <s:url id="recomendarExtraplanes" namespace="/" action="recomendarExtraplanesLink2" >
            <s:param name="usbid"><s:property value="usbid" /></s:param>
            <s:param name="nombre"><s:property value="nombre" /> <s:property value="apellido" /></s:param>
            <s:param name="indice"><s:property value="indice" /></s:param>
            <s:param name="cOrigen"><s:property value="carreraOrigen.nombre" /></s:param>
        </s:url>
        <s:a href="%{recomendarExtraplanes}">
            <input type="button" value="Asignar Extraplanes">
        </s:a>
        <%  }
        %></td>
    </tr>
</table>
    <br/>
    <center><button id="opener">Mostrar Informe Académico</button></center>
<br/>


        
<center><b>Archivos de la evaluación de DIDE</b></center><br />
<div class="tablaFormal">
    <table >

        <tr>
            <td class="bord"><center><b>Nombre del archivo</b></center></td>
        <td class="bord"><center><b>Descargar</b></center></td>
        </tr>
        <%
           List l2 = (List) request.getAttribute("archivos");
           if (l2 != null && l2.size() != 0) {
        %>
        <%
            Iterator it = l2.iterator();

            while (it.hasNext()) {
                clases.Reporte b = (clases.Reporte) it.next();
                String nombre = b.getNombre();
                String ruta = b.getRuta();
        %>
        <tr> 
            <td class="bord"><center><%= nombre%></center></td>
            <td class="bord">
                <center>
                    <s:url id="fileDownload" namespace="/" action="download" >
                        <s:param name="fileName"><%= nombre%></s:param>
                        <s:param name="destPath"><%= ruta%></s:param>
                    </s:url>
                    <s:a href="%{fileDownload}">
                        <img src="images/save.png" alt="Guardar" 
                        title="Guardar" width="20" height="20">
                    </s:a>
                </center>
            </td>
        </tr> 
        <%
            }
        }
%>
    </table>    
</div>
<br/>
<%
    if (sesion.get("rol").toString().equals("DIDE")) {
%>
<center>
    <form action="upload" method="post" enctype="multipart/form-data">
        <label for="archivo">Cargar archivo (solo archivos PDF):</label>
        <input type="file" name="archivo" /><br>
        <input type="submit" value="Cargar"/>
    </form>
</center>
<%  }
%>
<br/>
<%
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