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
<h5>Cambiando los cupos de la cohorte <%=session.getAttribute("cohorte_aux")%>
        en <%=session.getAttribute("carrera_aux_nombre")%>:</h5>
<br/>
<form id="ModificarCupos" name="ModificarCupos" action="/CambioCarrera/ModificarCupos.action" method="post">
    <div class="row">
        <div class="form-group">
            <label for="trimmin" class="col-sm-3 control-label">Nueva cantidad de Cupos</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="cantCupos"  maxlength="3" size="15" placeholder="#">
            </div>
        </div>
    </div>
    <input type="submit" value="Cambiar" class="btn btn-default" />
</form>

<%--<s:form action="ModificarCupos">
    <s:textfield type="text" label="Nueva cantidad de Cupos" name="cantCupos" maxlength="3" size="15" /> 
    <s:submit value="Aceptar" />
</s:form>--%>

<br/>
<center><center><a href="<s:url action="GestionCuposLink2"/>">Volver</a></center></center>
