<%-- 
    Document   : menu
    Created on : Nov 4, 2013, 6:00:56 PM
    Author     : CHANGE Gate 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <ul style="list-style-type: none;line-height: 4em ">
        <strong>
            <li><a href="<s:url action="verSolicitudesLink2"/>" class="menuitem">Gestionar solicitudes</a></li>
           <li> <a href="<s:url action="verCuposLink2"/>" class="menuitem">Ver cupos disponibles por carrera</a></li>
            <li><a href="index.jsp" class="menuitem">Salir</a></li>
        </strong>
    </ul>
</html>
