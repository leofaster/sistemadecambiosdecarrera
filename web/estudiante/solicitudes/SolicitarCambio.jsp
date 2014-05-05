<%-- 
    Document    : CampoInvalido
    Author      : CHANGE Gate
--%>

<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page import="java.util.*;" %>
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
<br>
<form action="verificarSol" name="entrar">
    <%-- <s:form action="verificarSol" name="entrar"> --%>
    <center><select  name='carrera_dest'>
            <option value='-1'>Seleccionar Carrera...</option>
            <option value='0100'>0100 - Ingeniería Eléctrica</option>
            <option value='0200'>0200 - Ingeniería Mecánica</option>
            <option value='0300'>0300 - Ingeniería Química</option>
            <option value='0600'>0600 - Ingeniería Electrónica</option>
            <option value='0800'>0800 - Ingeniería de la Computación</option>
            <option value='1200'>1200 - Ingeniería Geofísica</option>
            <option value='1500'>1500 - Ingeniería de Materiales</option>
            <option value='1700'>1700 - Ingeniería de Producción</option>
            <option value='1800'>1800 - Ingeniería de Telecomunicaciones</option>
            <option value='0400'>0400 - Licenciatura en Química</option>
            <option value='0500'>0500 - Licenciatura en Matemáticas</option>
            <option value='1000'>1000 - Licenciatura en Física</option>
            <option value='1900'>1900 - Licenciatura en Biología</option>
            <option value='0700'>0700 - Arquitectura</option>
            <option value='1100'>1100 - Urbanismo</option>
            <option value='3200'>0400 - Licenciatura en Comercio Internacional</option>
            <option value='0400'>0400 - Licenciatura en Gestión de la Hospitalidad</option>
        </select></center>

    <br><h6>Preguntas para la evaluación de DIDE: </h6><br><br>
    <%-- <%
         List l = (List) request.getAttribute("lista_cuestionario");
         if (l != null && l.size() != 0) {
             Iterator it = l.iterator();
             String enunciado = "";
             int numero;
             int i = 0;
             while (it.hasNext()) {
                 clases.Pregunta p = (clases.Pregunta) it.next();
                 enunciado = p.getEnunciado();
                 numero = p.getNumero();
                 

    %>
    <%=numero%>) <%=enunciado %>: <br>
    
    
    
    <%}%>
    --%>
    
    <br><br> 
    Motivación: <input type="text" maxlength="1500" name='motivacion' >
    <%--  <s:textarea name="motivacion" cols="40" rows="10" maxlength="1500"
                  label="Motivación" required="true"/>--%>
</form>


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