<%-- 
    Document    : indexEstudiante
    Author      : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <div id="loginDiv">
        <br><br>
        <center><h4>
            Usted ha ingresado satisfactoriamente al Sistema para la Gestión de
            Cambios de Carrera como el usuario <br>
            "<%=session.getAttribute("nombre")%> <%=session.getAttribute("apellido")%>"
        </h4></center>
    </div>
</html>