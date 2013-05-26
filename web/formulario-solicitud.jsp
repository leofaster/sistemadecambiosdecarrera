<%-- 
    Document   : formulario-solicitud
    Created on : 25/05/2013, 09:08:04 PM
    Author     : CHANGE Gate
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Sistema de Cambios de Carrera</title>
    </head>
    <body>
        
        <h3>Solicitud de Cambio de Carrera</h3>
        Rellene la solicitud para el cambio de carrera:
        
        
        <s:form action="actions/SolicitudAction" >
            <s:textfield name="USBid" label="Carnet (xx-xxxxx)" required="true"/>
            <s:textfield name="CI" label="Cédula" required="true"/>
            <s:textfield name="nombre" label="Nombres" required="true"/>
            <s:textfield name="apellido" label="Apellidos" required="true"/>
            <s:select name="carrera_dest" label="Carrera Deseada" required="true"
                list="{'0100 - Ingeniería Eléctrica', 
                '0200 - Ingeniería Mecánica', 
                '0300 - Ingeniería Química', 
                '0600 - Ingeniería Electrónica', 
                '0800 - Ingeniería de la Computación',
                '1200 - Ingeniería Geofísica',
                '1500 - Ingeniería de Materiales', 
                '1700 - Ingeniería de Producción', 
                'Ingeniería de Mantenimiento', 
                'Ingeniería de Telecomunicaciones',
                '0400 - Licenciatura en Química',
                '0500 - Licenciatura en Matemáticas',
                '1000 - Licenciatura en Física',
                '1900 - Licenciatura en Biología',
                '0700 - Arquitectura',
                '1100 - Urbanismo',
                '3200 - Licenciatura en Comercio Internacional',
                '3000 - Licenciatura en Gestión de la Hospitalidad'}"
                headerKey="-1" headerValue="Seleccionar carrera..."/>
            <s:textarea name="motivacion" cols="25" rows="4"
                label="Motivacion para el cambio" required="true"/>
            <s:submit value="Continuar" />
        </s:form>
    </body>
</html>