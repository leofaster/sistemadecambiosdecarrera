<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../stylesheets/estiloCRUD.css" />
        <title>Insertar Carrera</title>
    </head>

    <body>
        <a href="<s:url action="view.carrera.action"/>">Listar Carreras</a>
        <br><br>
        <b><font color="#5d8122" face="verdana">Detalles de Carrera</font></b>
            <s:form action="insert.carrera">   
                <s:textfield label="Codigo Carrera" name="mb.codcarrera" cssClass="bord"/>
                <s:textfield label="Nombre Carrera" name="mb.nombre" cssClass="bord"/>
                <s:textfield label="Cupos" name="mb.cupos" cssClass="bord"/>
                <s:textfield label="Minimo de Indice" name="mb.indice_min" cssClass="bord"/>

            <s:submit value="Agregar" />
        </s:form>
    </body>
</html>