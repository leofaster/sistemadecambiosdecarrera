<%-- 
    Document    : indexCoordinador
    Author      : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>
<h4>Seleccione la opción deseada:</h4>
<div id=""><br>
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
                <s:form action="EstudiantesCambioCoord">
                    <center>
                        <%--<s:submit value="Estudiantes en Cambio de Carrera" type="button"/>--%>
                         <button type="submit" class="btn btn-default">Estudiantes en Cambio de Carrera</button>
                    </center>
                </s:form>
            </td>
            <td>
                <s:form action="HistorialCambioCoord">
                    <center>
                        <%--<s:submit value="Historial de Estudiantes" type="button"/>--%>
                         <button type="submit" class="btn btn-default">Historial de Estudiantes</button>
                    </center>
                </s:form>
            <td>
        </tr>
    </table>
</div>
