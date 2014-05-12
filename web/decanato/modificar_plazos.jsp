<%-- 
    Document   : modificarCupos
    Created on : Nov 5, 2013, 2:28:45 PM
    Author     : CHANGE Gate 
--%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<h4>Gestión de Plazos:</h4>
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
    <h5>Cambiando los plazos de <%=session.getAttribute("carrera_bux_nombre")%></h5>
<br/>
<div class="row">
    

    <form id="ModificarPlazos" name="ModificarPlazos" action="/CambioCarrera/ModificarPlazos.action" method="post">
        
    <div class="form-group">
        <label for="trimmin" class="col-sm-8 control-label">Cantidad mínima de trimestres aprobados para solicitar el cambio de carrera</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="trimmin" name="trimmin" placeholder="#">
        </div>
    </div>



    <div class="form-group">
        <label for="trimmax" class="col-sm-8 control-label">Cantidad máxima de trimestres cursando extraplanes</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="trimmax" name="trimmax" placeholder="#">
        </div>
    </div>



</div>
    <br/>
    <input type="submit" value="Aceptar" class="btn btn-default">
    </form>

<br/>
<center><center><a href="<s:url action="GestionPlazosLink2"/>">Volver</a></center></center>
