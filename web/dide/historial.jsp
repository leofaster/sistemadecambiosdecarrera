<%-- 
    Document   : verSolicitudesAproRepro
    Created on : 16/10/2013, 04:30:44 AM
    Author     : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>

<div>
        <h4>Historial de Solicitudes Recientes</h4><br />

        <%
            List l = (List) request.getAttribute("disp40");
            if (l != null && l.size() != 0) {
        %>
        <div class="tabla">
            <table>
                <form name="fom" method="post">
                    <tr>
                    <center><td class="bord"><b>Estudiante</b></td> </center>
                    <center><td class="bord"><b>Carnet</b></td></center>
                    <center><td class="bord"><b>Recomendada</b></td></center>
                    <center><td class="bord"><b>No Recomendada</b></td></center>
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
                    %>
                </form>
            </table>  
        </div>
        <%
        } else {
        %>

        <center><b>No posee solicitudes gestionadas.</td></b></center>

        <%                                }
        %>  

    <br />
    <br />
    <center><a href="<s:url action="SolicitudesEstudiantesLink2"/>">Volver</a></center>


</div>

