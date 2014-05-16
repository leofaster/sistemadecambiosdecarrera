<%-- 
    Document    : datos_cambio
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
    function deleteRecord(val) {
        document.fom.action = "EliminarAsignatura.action?codigo=" + val;
        document.fom.submit();
    }
</script>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Informe Academico</h4>
            </div>
            <div class="modal-body">
                <%
                    Map sesion = ActionContext.getContext().getSession();
                    List l = (List) request.getAttribute("materias");
                    if (l != null && l.size() != 0) {
                %>
                <div class="tablaFormal">
                    <form name="fom" method="post">
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
                    </form>
                </div>
                <%
                    }
                %>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
                

    <div class="denyDiv">
        
            <span class="denyMsg">El archivo seleccionado no cumple con las condiciones.
            </span>
        

    </div>
    <br />

  
  
<s:if test="hasActionMessages()">
    <div class="aproveDiv">
        <s:iterator value="actionMessages">
            <span class="aproveMsg"><s:property escape="false" />
            </span>
        </s:iterator>
    </div><br />
</s:if>



<h4>Perfil del Estudiante</h4> 
<br/>
<div class="tablaFormal">
    <table border="0"> 

        <tr>
            <td>Datos
            </td>
            <td>Estudiante
            </td>

        </tr>
        <tr>
            <td><b>Nombre</b></td>
            <td><s:property value="nombre" /> <s:property value="apellido" /></td>
        </tr>
        <tr>
            <td><b>Carnet</b></td>
            <td><s:property value="usbid" /></td>
        </tr>
        <tr>
            <td><b>Índice</b></td>
            <td><s:property value="indice" /></td>
        </tr>
        <tr>
            <td><b>Carrera de origen</b></td>
            <td><s:property value="carreraOrigen.nombre" /></td>
        </tr>
        <tr>
            <td><b>Carrera de destino</b></td>
            <td><s:property value="solicitud.carrera.nombre" /></td>
        </tr>
        <tr>
            <td><b>Motivación para el cambio     </b></td>
            <td><s:property value="solicitud.motivacion" /></td>
        </tr>
    </table>
</div>
<br />
<h4>Extraplanes Asignados:</h4>
<div class="tablaFormal">
    <table border="0">



        <%
            List le = (List) request.getAttribute("listaExtraplanes");
            if (le.size() < 1) {

        %>
        <tr>
            <td>El estudiante aún no tiene extraplanes asignados</td>
        </tr>
        <%
            } else {
        %>
        <tr>
            <td>Código</td>
            <td>Materia</td>
            <td>Nota Mínima</td>
            <%
                if (sesion.get("rol").toString().equals("Coordinador")) {
            %>
            <td>Eliminar Asignatura</td>
            <% } %>
        </tr>

        <%Iterator it = le.iterator();
            while (it.hasNext()) {
                clases.AsignaturaConNota extraplan = (clases.AsignaturaConNota) it.next();
                clases.Asignatura asignatura = extraplan.getAsignatura();
                String codigo = asignatura.getCodigoS();
                int nota = extraplan.getNota();
                String nombreAsignatura = asignatura.getNombre();
        %>  
        <tr>
            <td><%= codigo%></td>
            <td><%= nombreAsignatura%></td>
            <td><%= nota%></td>            
            <%
                if (sesion.get("rol").toString().equals("Coordinador")) {
            %>
            <td><a href="javascript:deleteRecord('<%= codigo%>')"><img src="images/delete.png" alt="Eliminar" title="Eliminar" width="20" height="20"></td>
            <% } %>
        </tr>
        <%}
            }%>
    </table>
</div>
<%                
    if (sesion.get("rol").toString().equals("Coordinador")) {
%>

<s:url id="recomendarExtraplanes" namespace="/" action="recomendarExtraplanesLink2" >
    <s:param name="usbid"><s:property value="usbid" /></s:param>
    <s:param name="nombre"><s:property value="nombre" /> <s:property value="apellido" /></s:param>
    <s:param name="indice"><s:property value="indice" /></s:param>
    <s:param name="cOrigen"><s:property value="carreraOrigen.nombre" /></s:param>
</s:url>
<s:a href="%{recomendarExtraplanes}">
    <center><br /><input type="button"  class="btn btn-default" value="Agregar Extraplanes"></center>
    </s:a>
    <%  }
    %>
<br/>
<center><button data-toggle="modal" data-target="#myModal" class="btn btn-default">Mostrar Informe Académico</button></center>
<br/>

<h4>Archivos de la evaluación de DIDE</h4>

<div class="tablaFormal">
    <table >


        <%
            List l2 = (List) request.getAttribute("archivos");
            if (l2 != null && l2.size() != 0) {
        %>
        <tr>
            <td class="bord"><center><b>Nombre del archivo</b></center></td>
        <td class="bord"><center><b>Descargar</b></center></td>
        </tr>
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
        } else {%>
        <tr>
            <td class="bord">Actualmente no hay ningun archivo</td>
        </tr>
        <% }%>


    </table>    
</div>
<br/>
<%
    if (sesion.get("rol").toString().equals("DIDE")) {
%>
<center>
    <form action="upload" method="post" enctype="multipart/form-data">
        <label for="archivo">Cargar archivo (solo PDF. Máx 2MB):</label>
        <input type="file" name="archivo" /><br>
        <input type="submit" class="btn btn-default" value="Cargar"/>
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
                <input type="submit" class="btn btn-default" value="Recomendar Cambio"/>
            </center>
            </s:form>
        </td>
        <td>
            <s:form action="Denegar">
            <center>
                <input type="submit" class="btn btn-default" value="No Recomendar Cambio"/>
            </center>
            </s:form>
        </td>
    </tr>
</table>
<%  }
%>