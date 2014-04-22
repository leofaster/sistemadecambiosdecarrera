<%-- 
    Document   : menu
    Created on : Nov 25, 2013, 5:14:18 PM
    Author     : CHANGE Gate 
--%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<ul id="navlist" style="list-style-type: none;">
    <li><a href="<s:url action="GestionCuposLink2"/>">Gestionar Cupos</a></li>
    <li><a href="<s:url action="GestionPlazosLink2"/>">Gestionar Plazos</a></li>
<!--    <li><a href="s:url action="loginLink2"/>">Conceder Permisos Especiales</a></li>-->
    <li><a href="<s:url action="salir"/>" >Salir</a></li>
</ul>