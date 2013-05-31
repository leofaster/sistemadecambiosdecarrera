<%@ taglib prefix="s" uri="/struts-tags" %>
<html>

<head>
<link rel="stylesheet" type="text/css" href="css/java4s.css" />
</head>

<body>
<a href="<s:url action="view.action"/>">Display Records</a>
<br><br>
<b><font color="#5d8122" face="verdana">Insert Details</font></b>
	<s:form action="insert">   

			<s:textfield label="Codigo Carrera" name="mb.codcarrera" cssClass="bord"/>
                        <s:textfield label="Nombre Carrera" name="mb.nombre" cssClass="bord"/>
                        <s:textfield label="Cupos" name="mb.cupos" cssClass="bord"/>
                        <s:textfield label="Minimo de Indice" name="mb.indice_min" cssClass="bord"/>
    <s:submit value="Insert" />
    
</s:form>
</body>
</html>