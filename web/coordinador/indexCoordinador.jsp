<%-- 
    Document    : indexCoordinador
    Author      : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="loginDiv">
    <br><br>
    <center><h4>
            Usted ha ingresado satisfactoriamente al Sistema para la Gestión de
            Cambios de Carrera como el usuario <br>
            "Coordinador de <%=session.getAttribute("nombre")%>"
            
    </h4></center>
</div>

