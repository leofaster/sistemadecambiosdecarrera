<%-- 
    Document    : indexCoordinador
    Author      : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>
<div id="loginDiv" alt="especial">
    <center><h4>Perfil del Estudiante</h4> </center>
    <br/><br/>
    <table border="0"> 
        <tr>
            <td><b>Nombre:</b></td>
            <td><s:property value="nombre_est" /></td>
        </tr>
        <tr>
            <td><b>Carnet:</b></td>
            <td><s:property value="carnet_est" /></td>
        </tr>
        <tr>
            <td><b>Índice:</b></td>
            <td><s:property value="indice_sol" /></td>
        </tr>
        <tr>
            <td><b>Carrera de origen:</b></td>
            <td><s:property value="carreraOrigen_sol" /></td>
        </tr>
        <tr>
            <td><b>Motivación para el cambio:     </b></td>
            <td><s:property value="motivacion" /></td>
        </tr>
        <tr>
            <td><b>Observaciones:</b></td>
            <td><s:property escapeHtml="false" value="advertencia.replace(\"\n\", \" <br />\")" /></td>
        </tr>
    </table>
    <br/>
    <br/>
    <center>
        <s:form action="MostrarInf">
            <center>
                <center>    <s:submit  value="Mostrar informe académico" type="button"/></center>
            </center>
        </s:form>
    </center>
    <br/>
    <table>
        <tr>
            <td>
                <s:form action="Aprobar">
            <center>    <s:submit  value="Aceptar solicitud" type="button"/></center>
            </s:form>
        </td>
        <td>
            <s:form action="Denegar">
            <center><s:submit  value="Negar solicitud" type="button"/></center>
            </s:form>
        <td>
            </tr>
    </table>
</div>

