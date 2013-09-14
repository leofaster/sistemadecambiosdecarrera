<%-- 
    Document   : Login
    Created on : 31/05/2013, 04:45:40 AM
    Author     : CHANGE Gate
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de cambio de carrera</title>
    </head>
    <body>
        <s:form action="buscarEst">
            Usuario: <input type="text" name="usbido" size="15" /><br />
            Contraseña: <input type="password" name="password" size="15" /><br /> 
            <div align="center">
                <p><input type="submit" value="Login" /></p>
            </div>
        </s:form>
    </body>
</html>
