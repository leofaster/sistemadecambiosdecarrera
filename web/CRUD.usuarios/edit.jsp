<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.*;" %>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/css/java4s.css" />
        <title>Editar Usuario</title>
    </head>

    <body>
        <a href="<s:url action="view.action"/>">Listar Usuarios</a>
        <br><br>
        <b><font color="#5d8122" face="verdana">Detalles de Usuario</font></b>
            <s:form action="updates"> 	
                <s:textfield label="USBid" value="%{#application.a}" name="mb.usbid" readonly="true" cssClass="bord"/>
                <s:textfield label="Cedula" value="%{#application.b}" name="mb.cedula" cssClass="bord"/>
                <s:textfield label="Nombre" value="%{#application.c}" name="mb.nombre" cssClass="bord"/>
                <s:textfield label="Apellido" value="%{#application.d}" name="mb.apellido" cssClass="bord"/>
                <s:select name="mb.rol" value="%{#application.f}" label="Tipo de usuario"
                          list="{'Estudiante','Coordinador','Orientador(DIDE)'}"/>
                <s:select name="mb.codcarrera" label="Carrera"
                          list="{'0100 - Ingenier�a El�ctrica', 
                          '0200 - Ingenier�a Mec�nica', 
                          '0300 - Ingenier�a Qu�mica', 
                          '0600 - Ingenier�a Electr�nica', 
                          '0800 - Ingenier�a de la Computaci�n',
                          '1200 - Ingenier�a Geof�sica',
                          '1500 - Ingenier�a de Materiales', 
                          '1700 - Ingenier�a de Producci�n', 
                          'Ingenier�a de Mantenimiento', 
                          'Ingenier�a de Telecomunicaciones',
                          '0400 - Licenciatura en Qu�mica',
                          '0500 - Licenciatura en Matem�ticas',
                          '1000 - Licenciatura en F�sica',
                          '1900 - Licenciatura en Biolog�a',
                          '0700 - Arquitectura',
                          '1100 - Urbanismo',
                          '3200 - Licenciatura en Comercio Internacional',
                          '3000 - Licenciatura en Gesti�n de la Hospitalidad', 'DIDE'}"
                          headerKey="-1" headerValue="Seleccionar carrera..."/>
                <s:submit value="Actualizar" />
            </s:form>
    </body>
</html>

