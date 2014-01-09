<%-- 
    Document   : SolicitarCupos
    Created on : Nov 4, 2013, 8:07:06 PM
    Author     : CHANGE Gate 
--%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <br>
    <s:form action="GestionarCupos">
        Seleccione la carrera de la cual desea saber la cantidad de cupos:
        <br /><br />
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
        <br />
        <s:submit value="Aceptar" />
    </s:form>
