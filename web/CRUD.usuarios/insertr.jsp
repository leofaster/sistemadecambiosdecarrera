<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../stylesheets/estiloCRUD.css" />
        <title>Agregar Usuario</title>
    </head>

    <body>
        <a href="<s:url action="view.action"/>">Listar Usuarios</a>
        <br><br>
        <b><font color="#5d8122" face="verdana">Detalles de Usuario</font></b>
            <s:form action="insert">   
                <s:textfield label="USBid" name="mb.usbid" cssClass="bord" maxlength="8"/>
                <s:textfield label="Cedula" name="mb.cedula" cssClass="bord" maxlength="8"/>
                <s:textfield label="Nombre" name="mb.nombre" cssClass="bord"/>
                <s:textfield label="Apellido" name="mb.apellido" cssClass="bord"/>
                <s:password label="Contrasena" name="mb.contrasena" cssClass="bord"/>
                <s:select name="mb.rol" label="Tipo de usuario"
                          list="{'Estudiante','Coordinador','Orientador(DIDE)'}"
                          headerKey="-1" headerValue="Seleccionar tipo..."/>
                <s:select name="carrera" label="Carrera"
                          list="{'0100 - Ingenier�a El�ctrica', 
                          '0200 - Ingenier�a Mec�nica', 
                          '0300 - Ingenier�a Qu�mica', 
                          '0600 - Ingenier�a Electr�nica', 
                          '0800 - Ingenier�a de la Computaci�n',
                          '1200 - Ingenier�a Geof�sica',
                          '1500 - Ingenier�a de Materiales', 
                          '1700 - Ingenier�a de Producci�n', 
                          '1800 - Ingenieria de Telecomunicaciones',
                          '0400 - Licenciatura en Qu�mica',
                          '0500 - Licenciatura en Matem�ticas',
                          '1000 - Licenciatura en F�sica',
                          '1900 - Licenciatura en Biolog�a',
                          '0700 - Arquitectura',
                          '1100 - Urbanismo',
                          '3200 - Licenciatura en Comercio Internacional',
                          '3000 - Licenciatura en Gesti�n de la Hospitalidad', 'DIDE'}"
                          headerKey="-1" headerValue="Seleccionar carrera..."/>
                <s:submit value="Agregar" />
            </s:form>
    </body>
</html>