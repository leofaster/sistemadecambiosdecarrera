<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.*;" %>

<html>

<head>
<link rel="stylesheet" type="text/css" href="css/java4s.css" />
</head>

<body>
<a href="<s:url action="view.action"/>">Display Records</a>
<br><br>

<%--   This is -- <s:property value="#application.a" /> --%>

<b><font color="#5d8122" face="verdana">Update Details</font></b>

	<s:form action="updates"> 	

            
            <s:textfield label="Codigo Carrera" value="%{#application.a}" name="mb.usbid" readonly="true" cssClass="bord"/>
                        <s:textfield label="Nombre de la Carrera" value="%{#application.b}" name="mb.cedula" cssClass="bord"/>
                        <s:textfield label="Cupos" value="%{#application.c}" name="mb.nombre" cssClass="bord"/>
                        <s:textfield label="Indice Minimo" value="%{#application.d}" name="mb.apellido" cssClass="bord"/>
    <s:submit value="Update" />
    
</s:form>



</body>
</html>

