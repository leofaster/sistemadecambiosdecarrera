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
            <strong><li><a href="<s:url action="verificarReq"/>" >Solicitar Cambio de Carrera</a></li></strong>
            <strong><li><a href="<s:url action="ListarSol"/>" >Solicitudes de Cambio Enviadas</a></li></strong>
            <strong><li><a href="<s:url action="instruccionesLink2"/>">Ayuda</a></li></strong>
        </ul>
</html>
