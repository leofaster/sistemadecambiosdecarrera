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
                          list="{'0100 - Ingeniería Eléctrica', 
                          '0200 - Ingeniería Mecánica', 
                          '0300 - Ingeniería Química', 
                          '0600 - Ingeniería Electrónica', 
                          '0800 - Ingeniería de la Computación',
                          '1200 - Ingeniería Geofísica',
                          '1500 - Ingeniería de Materiales', 
                          '1700 - Ingeniería de Producción', 
                          '1800 - Ingenieria de Telecomunicaciones',
                          '0400 - Licenciatura en Química',
                          '0500 - Licenciatura en Matemáticas',
                          '1000 - Licenciatura en Física',
                          '1900 - Licenciatura en Biología',
                          '0700 - Arquitectura',
                          '1100 - Urbanismo',
                          '3200 - Licenciatura en Comercio Internacional',
                          '3000 - Licenciatura en Gestión de la Hospitalidad', 'DIDE'}"
                          headerKey="-1" headerValue="Seleccionar carrera..."/>
                <s:submit value="Agregar" />
            </s:form>
    </body>
</html>