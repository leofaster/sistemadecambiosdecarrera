<%-- 
    Document   : modificarCupos
    Created on : Nov 5, 2013, 2:28:45 PM
    Author     : CHANGE Gate 
--%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
        <h4>Gestión de Plazos:</h4>

<center><b>Cambiando los plazos de <%=session.getAttribute("carrera_bux_nombre")%></b></center>
         <br/>
        <s:form action="ModificarPlazos">
            <s:textfield type="text" label="Cantidad mínima de trimestres aprobados para solicitar el cambio de carrera" name="trimmin" maxlength="3" size="15" /> 
            <s:textfield type="text" label="Cantidad máxima de trimestres cursando extraplanes" name="trimmax" maxlength="3" size="15" /> 
            <s:submit value="Aceptar" />
        </s:form>
        <s:if test="hasActionMessages()">
            <div id="aproveMessage">
                <s:actionmessage/>
            </div>
        </s:if>
         <br/>
         <center><center><a href="<s:url action="GestionPlazosLink2"/>">Volver</a></center></center>
