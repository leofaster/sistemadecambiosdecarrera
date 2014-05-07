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
<<<<<<< HEAD
            <center>
              <%--  <s:submit value="Gestionar solicitudes pendientes" type="button"/>--%>
                <button type="submit" class="btn btn-default">Gestionar solicitudes pendientes</button>
            </center>
=======
            <center><s:submit value="Gestionar solicitudes pendientes" type="button"/></center>
>>>>>>> c384fcdcf3fd593ffe3df94644ef02d4fa3958d6
            </s:form>
        </td>
        <td>
            <s:form action="HistorialSolicitudes">
<<<<<<< HEAD
            <center>
                <%--<s:submit value="Ver las solicitudes ya gestionadas" type="button"/>--%>
                <button type="submit" class="btn btn-default">Ver las solicitudes ya gestionadas</button>
            </center>
=======
            <center><s:submit value="Ver las solicitudes ya gestionadas" type="button"/></center>
>>>>>>> c384fcdcf3fd593ffe3df94644ef02d4fa3958d6
            </s:form>
        <td>
            </tr>
    </table>
</div>
