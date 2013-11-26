<%-- 
    Document   : login
    Created on : Nov 25, 2013, 5:18:31 PM
    Author     : CHANGE Gate 
--%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<br /><br /><br />
<div id="welcome">
    <h5>Para ingresar al sistema introduzca su usuario y contraseña.</h5>
    <br />
    <br />
    <s:if test="hasActionErrors()">
        <div id="errores">

            <s:actionerror />
        </div>
    </s:if>

    <s:form action="Login">
        <table style="border: none">
            <tr style="border: none">
                <td style="border: none"><s:textfield label="Introduzca su USBid" type="text" name="usbid" maxlength="20" size="14" /></td>
            </tr>
            <tr style="border: none">
                <td style="border: none" colspan="2"></td>
            </tr>
            <tr style="border: none">
                <td style="border: none"><s:password label="Introduzca su contraseña" type="password" name="contrasena" size="14" /></td>
            </tr>
            <tr style="border: none">
                <td style="border: none" colspan="2"></td>
            </tr>
        </table>
        <br><br>
        <center><s:submit value="Entrar" /></center>
    </s:form>
</div>
