<%-- 
    Document    : CampoInvalido
    Author      : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <style>
        .footer{
            position: static;
            bottom: auto; 
        } 

    </style>
</head>
<h4>Pre-Solicitud de Cambio de Carrera:</h4><br />
<s:if test="hasActionErrors()">
    <div class="denyDiv">
        <s:iterator value="actionErrors">
            <span class="denyMsg" style="font-size:13px"><s:property escape="false" />
            </span>
        </s:iterator>

    </div>
    <br />
</s:if>

<div class="tabla" style="box-shadow: none; width: 80%; margin: 0 auto;">
    <table>
        <tr>
            <td>Carnet</td>
            <td>Cédula</td>
            <td>Nombre</td>
        </tr>
        <tr>
            <td><%=session.getAttribute("usbid")%></td>
            <td><%=session.getAttribute("cedula")%></td>
            <td><%=session.getAttribute("nombreCompleto")%></td>
        </tr>
    </table>
</div>      


<s:form action="verificarSol" name="entrar">
    <s:select name="carrera_dest" label="Carrera Deseada" required="true"
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
              '3000 - Licenciatura en Gestión de la Hospitalidad'}"
              headerKey="-1" headerValue="Seleccionar carrera..."/>
    <br/><br /> 
    <s:textarea name="motivacion" cols="40" rows="10" maxlength="1500"
                label="Motivación" required="true"/>
</s:form>
        <<%--<s:textarea name="motivacion" cols="40" rows="10" maxlength="1500"
                label="Preg A." required="true"/>
</s:form>--%>
<center><h6>(Máximo 1500 caracteres)</h6>
    <input type="button" onclick="mostrarVentana();" value="Enviar"></center>

<div id="miVentana" style="position: fixed; width: 350px; height: 190px; top: 0; left: 0; font-family:Verdana, Arial, Helvetica, sans-serif; font-size: 12px; font-weight: normal; border: #333333 3px solid; background-color: #FAFAFA; color: #000000; display:none;">
    <div style="font-weight: bold; text-align: left; color: #FFFFFF; padding: 5px; background-color:#006394">Confirmación de envío de solicitud de cambio de carrera</div>
    <p style="padding: 5px; text-align: justify; line-height:normal">Presionando "Aceptar" estás de acuerdo con enviar esta solicitud para que sea evaluada bajo los criterios específicos de la coordinación seleccionada. Recibirás la respuesta a tu solicitud en el correo asociado a tu USBid.</p>
    <div style="padding: 10px; background-color: #F0F0F0; text-align: center; margin-top: 44px;">
        <input id="btnAceptar" onclick="confirmar();" name="btnAceptar" size="20" type="button" value="Aceptar" />
        <input id="btnAceptar" onclick="ocultarVentana();" name="btnAceptar" size="20" type="button" value="Cancelar" />
    </div>
</div>