<%@ taglib prefix="s" uri="/struts-tags" %>
<html>

<head>
<link rel="stylesheet" type="text/css" href="css/java4s.css" />
</head>

<body>
<a href="<s:url action="view.action"/>">Listar Usuarios</a>
<br><br>
<b><font color="#5d8122" face="verdana">Detalles de Usuario</font></b>
	<s:form action="insert">   

			<s:textfield label="USBid" name="mb.usbid" cssClass="bord"/>
                        <s:textfield label="Cedula" name="mb.cedula" cssClass="bord"/>
                        <s:textfield label="Nombre" name="mb.nombre" cssClass="bord"/>
                        <s:textfield label="Apellido" name="mb.apellido" cssClass="bord"/>
                        <s:password label="Contrasena" name="mb.contrasena" cssClass="bord"/>
                        <s:select name="mb.rol" label="Tipo de usuario"
                                  list="{'Estudiante','Coordinador','Orientador(DIDE)'}"
                                  headerKey="-1" headerValue="Seleccionar tipo..."/>
    <s:submit value="Agregar" />
    
</s:form>
</body>
</html>