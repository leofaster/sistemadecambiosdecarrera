<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.*;" %>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/css/java4s.css" />
        <title>Editar Carrera</title>
    </head>

    <body>
        <a href="<s:url action="view.carrera.action"/>">Listar Carreras</a>
        <br><br>
        <b><font color="#5d8122" face="verdana">Detalles de Carrera</font></b>
        <s:form action="updates.carrera">
            <s:textfield label="Codigo Carrera" value="%{#application.a}" name="mb.codcarrera" readonly="true" cssClass="bord"/>
            <s:textfield label="Nombre de la Carrera" value="%{#application.b}" name="mb.nombre" cssClass="bord"/>
            <s:textfield label="Cupos" value="%{#application.c}" name="mb.cupos" cssClass="bord"/>
            <s:textfield label="Indice Minimo" value="%{#application.d}" name="mb.indice_min" cssClass="bord"/>
        
            <s:submit value="Actualizar" />
        </s:form>
    </body>
</html>