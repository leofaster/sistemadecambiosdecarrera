<%-- 
    Document   : datos-usuario
    Created on : 25/05/2013, 03:45:50 PM
    Author     : Becca
--%>

<%@taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        Nombre: <strong><s:property value="usuario.nombre" /></strong> <br />
        Username: <strong><s:property value="usuario.username" /></strong> <br />
        Password: <strong><s:property value="usuario.password" /></strong> <br />      
    </body>
</html>

