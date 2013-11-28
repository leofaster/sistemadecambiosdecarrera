<%-- 
    Document   : menu
    Created on : Nov 4, 2013, 6:00:56 PM
    Author     : CHANGE Gate 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <ul style="list-style-type: none;line-height: 2em ">
        <strong>
            <li><a href="<s:url action="ListarSol"/>" class="menuitem">Solicitudes de Cambio Enviadas</a></li>
            <li><a href="<s:url action="verificarReq"/>" class="menuitem">Solicitar Cambio de Carrera</a></li>
            <li><a href="index.jsp" class="menuitem">Salir</a>
        </strong>
    </ul>
</html>
