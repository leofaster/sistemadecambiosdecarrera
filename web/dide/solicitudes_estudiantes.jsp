<%-- 
    Document    : Solicitudes_Estudiantes
    Author      : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div>
    <s:if test="hasActionMessages()">
        <div id="aproveMessage">
            <s:actionmessage/>
        </div>
    </s:if>
    <h4>Seleccione la opción deseada:</h4>
    <br><br>
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
