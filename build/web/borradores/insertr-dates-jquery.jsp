<%@ taglib prefix="s" uri="/struts-tags" %>
<html>

<head>
<link rel="stylesheet" type="text/css" href="/css/java4s.css" />
<link rel="stylesheet" type="text/css" href="/css/datepick.css" />

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
<a href="<s:url action="view.carrera.action"/>">Display Records</a>
<br><br>
<b><font color="#5d8122" face="verdana">Insert Details</font></b>
	<s:form action="insert.carrera">   

			<s:textfield label="Codigo Carrera" name="mb.codcarrera" cssClass="bord"/>
                        <s:textfield label="Nombre Carrera" name="mb.nombre" cssClass="bord"/>
                        <s:textfield label="Cupos" name="mb.cupos" cssClass="bord"/>
                        <s:textfield label="Minimo de Indice" name="mb.indice_min" cssClass="bord"/>
    <s:submit value="Agregar" />
    
</s:form>
</body>
</html>