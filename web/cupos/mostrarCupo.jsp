<%-- 
    Document   : mostrarCupo
    Created on : 27/08/2013, 03:50:54 PM
    Author     : CHANGE Gate
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Cupos Disponibles</title>
    </head>
    <body>
    <center>
        <h1>
        Cantidad de cupos: <strong><%=request.getAttribute("cupos")%></strong>
        </h1>
    </center>
    </body>
</html>
