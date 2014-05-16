<%-- 
    Document   : menu
    Created on : Nov 25, 2013, 5:14:18 PM
    Author     : CHANGE Gate 
--%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<ul id="navlist" style="list-style-type: none; padding-left: 0px">
    <li><a href="<s:url action="SolicitudesEstudiantesLink2"/>">Pre-solicitudes de Estudiantes</a></li>
    <li><a href="<s:url action="EstudiantesCambioDIDE"/>">Estudiantes en Cambio de Carrera</a></li>
</ul>