<%-- 
    Document   : VerificarSolicitud
    Created on : 26/05/2013, 07:51:35 PM
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
        <h2>Sistema de Cambios de Carrera</h2>
        Carnet: <strong><s:property value="estudiante.usbid" /></strong> <br /><br />
        Cédula: <strong><s:property value="estudiante.cedula" /></strong> <br /><br />
        Nombre: <strong><s:property value="estudiante.nombre" /></strong> <br /><br />
        Apellido: <strong><s:property value="estudiante.apellido" /></strong> <br /><br />
        Motivacion: <strong><s:property value="motivacion" /></strong> <br />
             
    </body>
</html>
