<%-- 
    Document   : verSolicitudesAproRepro
    Created on : 16/10/2013, 04:30:44 AM
    Author     : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>

<div id="login-form"><br><br><br>
    <h4>Historial del Solicitudes</h4>
    <center>
        <table class="bordt" border="1">
            <form name="fom" method="post">
                <tr>

                </tr>
                <%
                    List l = (List) request.getAttribute("disp4");
                    if (l != null && l.size() != 0) {
                %>

                <center><td class="bord"><b>Estudiante</b></td> </center>
                <center><td class="bord"><b>Carnet</b></td></center>
                <center><td class="bord"><b>Aceptada</b></td></center>
                <center><td class="bord"><b>Rechazada</b></td></center>

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
    </center>
            <br />
            <br />
    <center><a href="<s:url action="verSolicitudesLink2"/>">Volver</a></center>


</div>

