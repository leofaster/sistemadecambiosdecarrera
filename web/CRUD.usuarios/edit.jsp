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

            <s:submit value="Actualizar" />
        </s:form>
    </body>
</html>

