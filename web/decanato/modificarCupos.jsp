<%-- 
    Document   : modificarCupos
    Created on : Nov 5, 2013, 2:28:45 PM
    Author     : CHANGE Gate 
--%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<h4>Gestión de Cupos:</h4>
<s:if test="hasActionErrors()">
    <div class="denyDiv">
        <s:iterator value="actionErrors">
            <span class="denyMsg" style="font-size:13px"><s:property escape="false" />
            </span>
        </s:iterator>
    </div>
    <br />
</s:if>
<s:if test="hasActionMessages()">
    <div class="aproveDiv">
        <s:iterator value="actionMessages">
            <span class="aproveMsg"><s:property escape="false" />
            </span>
        </s:iterator>
    </div><br />
</s:if>
<center><b>Cambiando los cupos de la cohorte <%=session.getAttribute("cohorte_aux")%><br/>
        en <%=session.getAttribute("carrera_aux_nombre")%>:</b></center>
<br/>
<s:form action="ModificarCupos">
    <s:textfield type="text" label="Nueva cantidad de Cupos" name="cantCupos" maxlength="3" size="15" /> 
    <s:submit value="Aceptar" />
</s:form>

<br/>
<center><center><a href="<s:url action="GestionCuposLink2"/>">Volver</a></center></center>
