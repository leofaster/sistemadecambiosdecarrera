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
    <div class="col-md-offset-1">

        <table>
            <tr>
                <td>
                    <s:form action="EstudiantesCambioDIDE">
                    <%-- <s:submit value="Estudiantes en Cambio de Carrera" type="button"/>--%>
                    <button type="submit" class="btn btn-default">Estudiantes en Cambio de Carrera</button>
            </s:form>
            </td>
            <td>
                <s:form action="HistorialCambioDIDE">
                    <%--<s:submit value="Historial de Estudiantes" type="button"/>--%>
                    <button type="submit" class="btn btn-default">Historial de Estudiantes</button>
            </s:form>
            <td>
                </tr>
        </table>
    </div>
</div>
