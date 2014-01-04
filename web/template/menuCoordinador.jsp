<%-- 
    Document   : menu
    Created on : Nov 4, 2013, 6:00:56 PM
    Author     : CHANGE Gate 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <ul id="navlist" style="list-style-type: none">
        <strong>
            <li><a href="<s:url action="verSolicitudesLink2"/>" >Gestionar Pre-Solicitudes</a></li>
            <li><a href="<s:url action="GestionPlantillas"/>"   >Gestionar Plantillas</a></li>
            <li><a href="<s:url action="verCuposLink2"/>"       >Consultar Cupos</a></li>
            <li><a href="index.jsp">Salir</a></li>
        </strong>
    </ul>
</html>
