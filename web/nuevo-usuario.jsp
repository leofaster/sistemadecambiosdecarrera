<%-- 
    Document   : nuevo-usuario
    Created on : 25/05/2013, 03:26:18 PM
    Author     : CHANGE Gate
--%>

<%@taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sistema de Cambios de Carrera</title>
    </head>
    
    <body>
    <s:form action="datosUsuario" >
        <s:textfield name="nombre" label="Nombre" />
        <s:textfield name="username" label="Usuario" />
        <s:password name="password" label="Password" />
        <s:submit value="Enviar" />
    </s:form>
    </body>
</html>