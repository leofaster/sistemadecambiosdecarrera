<%-- 
    Document    : ListaSolicitudes
    Author      : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>


<h4>Pre-Solicitudes Realizadas:</h4>
<br /><br />
<%
    String carnet = (String) session.getAttribute("usbid");
    List l = (List) request.getAttribute("lista_solicitudes");
    if (l != null) {
        String fecha = "Fecha";
        String carrera = "Carrera Solicitada";
        String estado = "Estado";
%>
<%--<center><strong><s:property escapeHtml="false" value="mensaje.replace(\"\n\", \" <br />\")" /></strong></center>--%>
<div class="tablaFormal">
    <table>
        <form name="fom" method="post">
            <tr>
                <td><%=fecha%></td>
                <td><%=carrera%></td>
                <td><%=estado%></td>
                <%}%>
            </tr>   

            <%
                if (l != null) {
                    Iterator it = l.iterator();
                    while (it.hasNext()) {
                        clases.Solicitud sol = (clases.Solicitud) it.next();

                        String fechaIns = sol.getFecha();
                        String carreraIns = sol.getCarrera().getNombre();
                        String estadoIns = sol.getAdvertencia();
                        if (estadoIns.equals("-1")) {
                            estadoIns = "Rechazada";
                        } else {
                            estadoIns = "Pendiente";
                        }

            %>
            <tr>
            <center><td><%=fechaIns%></td></center>
            <center><td><%=carreraIns%></td></center>
            <center><td><%=estadoIns%></td></center>
            </tr>
            <%}%>
        </form>
    </table>

    <%}%>
</div>