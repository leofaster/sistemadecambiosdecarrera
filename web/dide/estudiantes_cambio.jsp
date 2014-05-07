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
<<<<<<< HEAD
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
=======

    <table>
        <tr>
            <td>
                <s:form action="EstudiantesCambioDIDE">
                    <center><s:submit value="Estudiantes en Cambio de Carrera" type="button"/></center>
                </s:form>
            </td>
            <td>
                <s:form action="HistorialCambioDIDE">
                    <center><s:submit value="Historial de Estudiantes" type="button"/></center>
                </s:form>
            <td>
        </tr>
    </table>
>>>>>>> c384fcdcf3fd593ffe3df94644ef02d4fa3958d6
</div>
