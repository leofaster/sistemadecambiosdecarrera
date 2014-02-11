<%-- 
    Document    : indexCoordinador
    Author      : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>
<h4>Seleccione la opción deseada:</h4>
<div id="login-form"><br>
    <s:if test="hasActionMessages()">
        <div class="aproveDiv">
            <s:iterator value="actionMessages">
                <span class="aproveMsg"><s:property escape="false" />
                </span>
            </s:iterator>
        </div><br />
    </s:if>

    <table>
        <tr>
            <td>
                <s:form action="SolicitarPendientes">
            <center><s:submit value="Gestionar solicitudes pendientes" type="button"/></center>
            </s:form>
        </td>
        <td>
            <s:form action="HistorialSolicitudes">
            <center><s:submit value="Ver las solicitudes ya gestionadas" type="button"/></center>
            </s:form>
        <td>
            </tr>
    </table>
</div>
