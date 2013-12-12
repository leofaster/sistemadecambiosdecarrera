<%-- 
    Document   : modificarCupos
    Created on : Nov 5, 2013, 2:28:45 PM
    Author     : CHANGE Gate 
--%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<div id="loginDiv">
    <div id="login-form"><br><br><br>
        <s:form action="ModificarCup">
            <center>Seleccione la carrera, coloque la cohorte y cantidad de cupos deseados</center>
                <s:if test="hasActionErrors()">
                <div id="errores">
                    <s:actionerror />
                </div>
                </s:if>
            <s:select name="carrera"  required="true"
                  list="{'0100 - Ingenieria Electrica', 
                  '0200 - Ingenieria Mecanica', 
                  '0300 - Ingenieria Quimica', 
                  '0600 - Ingenieria Electronica', 
                  '0800 - Ingenieria de la Computacion',
                  '1200 - Ingenieria Geofisica',
                  '1500 - Ingenieria de Materiales', 
                  '1700 - Ingenieria de Produccion', 
                  '0400 - Licenciatura en Quimica',
                  '0500 - Licenciatura en Matematicas',
                  '1000 - Licenciatura en Fisica',
                  '1900 - Licenciatura en Biologia',
                  '0700 - Arquitectura',
                  '1100 - Urbanismo',
                  '3200 - Licenciatura en Comercio Internacional',
                  '3000 - Licenciatura en Gestión de la Hospitalidad'}"
                  headerKey="-1" headerValue="Seleccionar carrera..."/>
            <s:textfield label="Cohorte" type="text" name="cohorte" maxlength="4" size="15"/>
            <s:textfield type="text" label="Cantidad de Cupos" name="cantCupos" maxlength="3" size="15" /> 
            <s:submit value="Aceptar" />
        </s:form>
        <s:if test="hasActionMessages()">
            <div id="aproveMessage">
                <s:actionmessage/>
            </div>
        </s:if>
    </div>
</div>

