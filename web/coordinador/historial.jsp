<%-- 
    Document   : verSolicitudesAproRepro
    Created on : 16/10/2013, 04:30:44 AM
    Author     : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>

<h4>Historial de Solicitudes:</h4>



<%
    List l = (List) request.getAttribute("disp4");
    if (l != null && l.size() != 0) {
%>
<div class="tablaFormal">
    <table>
        <form name="fom" method="post">
            <tr>
            <center><td class="bord"><b>Estudiante</b></td> </center>
            <center><td class="bord"><b>Carnet</b></td></center>
            <center><td class="bord"><b>Aceptada</b></td></center>
            <center><td class="bord"><b>Rechazada</b></td></center>
            </tr>
            <%
                Iterator it = l.iterator();

                while (it.hasNext()) {
                    clases.Solicitud b = (clases.Solicitud) it.next();
                    String nombre = b.getEstudiante().getNombre();
                    String carnet = b.getEstudiante().getUsbid();
                    boolean ac = b.isSolAceptada();

            %>
            <tr> 
            <center><td class="bord"><%= nombre%></td></center>
            <center><td class="bord"><%= carnet%></td></center>
                <%
                    if (ac) {
                %>
            <td >X</td>
            <td ></td>
            <%                            } else {
            %>
            <td ></td>
            <td >X</td>
            <%}%>
            </tr> 
            <%
                }
            %>
        </form>
    </table>   
</div>

<%
} else {
%>

<b><center><br />No posee solicitudes gestionadas.</center></b>

<%                                }
%>  

<br />
<br />
<center><a href="<s:url action="verSolicitudesLink2"/>">Volver</a></center>