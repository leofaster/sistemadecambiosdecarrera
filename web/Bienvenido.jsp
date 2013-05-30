<%-- 
    Document   : Bienvenido
    Created on : 25/05/2013, 10:57:11 PM
    Author     : wilmer
--%>

<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Cambio de carreras</title>
    </head>
    <body>
        <h1>¡Bienvenido al sistema de Cambio de carrera!</h1>
       
        <ul>
            <li>
              <a href="<s:url action="buscarEst"/>">
                    Click aquí para solicitar cambio de carrera</a>
            </li>

            <li>

                <a href="GestionarCatalogos.jsp">
                    Click aquí para gestionar catálogos</a>

            </li>
        </ul>
    </body>
</html>
