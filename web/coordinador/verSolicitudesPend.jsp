<%-- 
    Document   : verSolicitudesPend
    Created on : 16/10/2013, 04:30:31 AM
    Author     : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>

<html>

    <head>

        <script type="text/javascript">
            function edita(val, val2) {
                document.fom.action = "updateSol.action?carnet=" + val + "&nombre=" + val2;
                document.fom.submit();
            }
        </script>
    </head>

    <div>

        <h4>Solicitudes Pendientes:</h4><br />

        <%
            List l = (List) request.getAttribute("disp3");
            if (l != null && l.size() != 0) {
        %>
        <div class="tabla">
            <table>
                <form name="fom" method="post">
                    <tr> 
                        <td>Nombre del estudiante</td>
                        <td>Carnet</td>
                        <td>Accion</td>
                    </tr> 
                    <%
                        Iterator it = l.iterator();

                        while (it.hasNext()) {
                            clases.Solicitud b = (clases.Solicitud) it.next();
                            String nombre = b.getEstudiante().getNombre();
                            String carnet = b.getEstudiante().getUsbid();

                    %>
                    <tr> 
                        <td><%= nombre%></td>
                        <td><%= carnet%></td>
                        <td><a href="javascript:edita('<%= carnet%>','<%= nombre%>')">Gestionar</a></td>
                    </tr> 
                    <%}%>
                </form>
            </table>  
        </div>
        <%} else {%>
        <center><b>No posee solicitudes pendientes.</td></b></center>
            <%}%>  
    </div>
    <center><br /><a href="<s:url action="verSolicitudesLink2"/>">Volver</a></center>
</html>