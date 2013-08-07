<%-- 
    Document   : solicitudYModifCupos
    Created on : 30/07/2013, 03:43:11 PM
    Author     : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <s:form action="ModificarCup">
            Indique la cantidad de cupos disponible que desea que tenga su carrera:
            <input type="text" name="cantCupos" size="15" />
            <br>
            <s:submit value="Aceptar" />
        </s:form>
        
    </body>
</html>
