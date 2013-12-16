<%-- 
    Document   : modificarCupos
    Created on : Nov 5, 2013, 2:28:45 PM
    Author     : CHANGE Gate 
--%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<center><b>Cambiando los cupos de la cohorte <%=session.getAttribute("cohorte_aux")%><br/>
        en <%=session.getAttribute("carrera_aux_nombre")%>:</b></center>
<br/>
<s:form action="ModificarCupos">
    <s:textfield type="text" label="Nueva cantidad de Cupos" name="cantCupos" maxlength="3" size="15" /> 
    <s:submit value="Aceptar" />
</s:form>
<s:if test="hasActionMessages()">
    <div id="aproveMessage">
        <s:actionmessage/>
    </div>
</s:if>
<br/>
<center><center><a href="<s:url action="GestionCuposLink2"/>">Volver</a></center></center>

