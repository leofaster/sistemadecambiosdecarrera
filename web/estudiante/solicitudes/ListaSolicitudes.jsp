<%-- 
    Document    : ListaSolicitudes
    Author      : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>

<div>
    <h4>Pre-Solicitudes Realizadas:</h4>
    <br /><br />
    <%
        String carnet = (String) session.getAttribute("usbid");
        List l = (List) request.getAttribute("listaSolicitudes");
        Iterator it = l.iterator();
        if (!it.hasNext()) {%>
    <br><center>Usted no ha realizado ninguna pre-solicitud.</center>
    <%} else {
        if (l != null) {
            String fecha = "Fecha";
            String carrera = "Carrera Solicitada";
            String estado = "Estado";
    %>
    <%--<center><strong><s:property escapeHtml="false" value="mensaje.replace(\"\n\", \" <br />\")" /></strong></center>--%>
    <div class="tabla">
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
                        while (it.hasNext()) {
                            System.out.println(1);
                            clases.Solicitud sol = (clases.Solicitud) it.next();
                            System.out.println(2);
                            String fechaAux = sol.getFecha();
                            String carreraAux = sol.getCarrera().getNombre();
                            String estadoAux = sol.getPreAceptacion();
                %>
                <tr>
                <center><td><%=fechaAux%></td></center>
                <center><td><%=carreraAux%></td></center>
                <center><td><%=estadoAux%></td></center>
                </tr>
                <%}%>
            </form>
        </table>

        <%}
            }%>
    </div>
</div>