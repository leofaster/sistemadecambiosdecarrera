<%-- 
    Document   : solicitudCupos
    Created on : 27/08/2013, 03:45:40 PM
    Author     : CHANGE Gate
--%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Gate</title>
    </head>
    <body>
        <s:form action="solicitudCupos">
              Seleccione la carrera de la cual desea saber la cantidad de cupos:
                            <br /><br />
           <s:select name="carrera"  required="true"
                            list="{'0100 - Ingenieria Electrica', 
                            '0200 - Ingenieria Mecanica', 
                            '0300 - Ingenieria Quimica', 
                            '0600 - Ingenieria Electronica', 
                            '0800 - Ingenieria de la Computacion',
                            '1200 - Ingenieria Geofisica',
                            '1500 - Ingenieria de Materiales', 
                            '1700 - Ingenieria de Produccion', 
                            'Ingenieria de Mantenimiento', 
                            'Ingenieria de Telecomunicaciones',
                            '0400 - Licenciatura en Quimica',
                            '0500 - Licenciatura en Matematicas',
                            '1000 - Licenciatura en Fisica',
                            '1900 - Licenciatura en Biologia',
                            '0700 - Arquitectura',
                            '1100 - Urbanismo',
                            '3200 - Licenciatura en Comercio Internacional',
                            '3000 - Licenciatura en Gestión de la Hospitalidad'}"
                            headerKey="-1" headerValue="Seleccionar carrera..."/>
        <s:submit value="Aceptar" />
        </s:form>
    </body>
</html>
