<%-- 
    Document   : verSolicitudesAproRepro
    Created on : 16/10/2013, 04:30:44 AM
    Author     : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>

<div><br>
    <center>
    <h4>Historial de Solicitudes Recientes</h4>
    <div class="tablaFormal">

                <%
                    List l = (List) request.getAttribute("disp40");
                    if (l != null && l.size() != 0) {
                %>

        <table  border="1" style="white-space: nowrap">
            <form name="fom" method="post">
                <tr>
                <center><td ><b>Estudiante</b></td> </center>
                <center><td ><b>Carnet</b></td></center>
                <center><td ><b>Recomendada</b></td></center>
                <center><td ><b>No Recomendada</b></td></center>
                </tr>

                <%
                    Iterator it = l.iterator();

                    while (it.hasNext()) {
                        clases.Solicitud b = (clases.Solicitud) it.next();
                        String nombre = b.getEstudiante().getNombre();
                        String carnet = b.getEstudiante().getUsbid();
                        boolean ac = b.isRecomendada();

                %>
                <tr> 
                <center><td ><%= nombre%></td></center>
                <center><td ><%= carnet%></td></center>
                    <%
                        if (ac) {
                    %>
                <td class="bord"><center>X</center></td>
                <center><td class="bord"></td></center>
                    <%                            } else {
                    %>
                <center><td class="bord"></td></center>
                <td class="bord"><center>X</center></td>
                    <%                                 }
                    %>
                </tr> 
                <%
                    }
                } else {
                %>

                <center><b>No posee solicitudes gestionadas.</td></b></center>

                <%                                }
                %>  
            </form>
        </table>    
            </div>
    </center>
            <br />
            <br />
    <center><a href="<s:url action="SolicitudesEstudiantesLink2"/>">Volver</a></center>


</div>

