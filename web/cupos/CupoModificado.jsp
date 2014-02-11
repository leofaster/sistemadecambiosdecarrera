<%-- 
    Document    : CupoModificado
    Author      : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="login-form"><br><br><br>

    <s:form action="ModificarCup">
        <center>Coordinador, coloque la cohorte y cantidad de cupos deseados</center>

        <s:if test="hasActionErrors()">
            <div class="denyDiv">
                <s:iterator value="actionErrors">
                    <span class="denyMsg" style="font-size:13px"><s:property escape="false" />
                    </span>
                </s:iterator>
            </div>
            <br />
        </s:if>


        <s:textfield label="Cohorte" type="text" name="cohorte" maxlength="4" size="15"/>
        <s:textfield type="text" label="Cantidad de Cupos" name="cantCupos" maxlength="3" size="15" /> 

        <s:submit value="Aceptar" />
    </s:form>
    <center>La cantidad de cupos ha sido modificada.</center>
</div>
</div>

