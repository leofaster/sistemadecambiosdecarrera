<%@ taglib prefix="s" uri="/struts-tags" %>
<html>

<head>
<link rel="stylesheet" type="text/css" href="css/java4s.css" />
<link rel="stylesheet" type="text/css" href="css/datepick.css" />

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.datepick.js"></script>
<script type="text/javascript">
$(function() {
	$('#popup').datepick({dateFormat: 'mm-dd-yyyy'});	
	//$('#inlineDatepicker').datepick({onSelect: showDate});
});
</script>
</head>

<body>
<a href="<s:url action="view.action"/>">Display Records</a>
<br><br>
<b><font color="#5d8122" face="verdana">Insert Details</font></b>

esssstoooooo es un coso
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