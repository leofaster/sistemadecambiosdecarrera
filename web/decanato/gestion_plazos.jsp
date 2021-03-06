<%-- 
    Document   : SolicitarCupos
    Created on : Nov 4, 2013, 8:07:06 PM
    Author     : CHANGE Gate 
--%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<h4>Gestión de Plazos:</h4>
<s:if test="hasActionErrors()">
    <div class="denyDiv">
        <s:iterator value="actionErrors">
            <span class="denyMsg" style="font-size:13px"><s:property escape="false" />
            </span>
        </s:iterator>
    </div>
    <br />
</s:if> 
<s:form action="GestionarPlazos">
    Seleccione la carrera cuyos plazos desea consultar o modificar:
    <br />
    <s:select name="carrera"  required="true"
              list="{'0100 - Ingenieria Electrica', 
              '0200 - Ingenieria Mecanica', 
              '0300 - Ingenieria Quimica', 
              '0600 - Ingenieria Electronica', 
              '0800 - Ingenieria de la Computacion',
              '1200 - Ingenieria Geofisica',
              '1500 - Ingenieria de Materiales', 
              '1700 - Ingenieria de Produccion', 
              '1800 - Ingenieria de Telecomunicaciones',
              '0400 - Licenciatura en Quimica',
              '0500 - Licenciatura en Matematicas',
              '1000 - Licenciatura en Fisica',
              '1900 - Licenciatura en Biologia',
              '0700 - Arquitectura',
              '1100 - Urbanismo',
              '3200 - Licenciatura en Comercio Internacional',
              '3000 - Licenciatura en Gestión de la Hospitalidad'}"
              headerKey="-1" headerValue="Seleccionar carrera..."/>
    <br />
    <s:submit value="Aceptar" />
</s:form>
