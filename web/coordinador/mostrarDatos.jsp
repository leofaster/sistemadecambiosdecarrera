<%-- 
    Document    : indexCoordinador
    Author      : CHANGE Gate
--%>

<%@page import="com.opensymphony.xwork2.ActionContext"%>
<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>
<div id="loginDiv" alt="especial">
    <center><h4>Perfil del Estudiante</h4> </center>
    <br/><br/>
    <table border="0"> 
        <tr>
            <td><b>Nombre:</b></td>
            <td><s:property value="nombre_est" /></td>
        </tr>
        <tr>
            <td><b>Carnet:</b></td>
            <td><s:property value="carnet_est" /></td>
        </tr>
        <tr>
            <td><b>Índice:</b></td>
            <td><s:property value="indice_sol" /></td>
        </tr>
        <tr>
            <td><b>Carrera de origen:</b></td>
            <td><s:property value="carreraOrigen_sol" /></td>
        </tr>
        <tr>
            <td><b>Motivación para el cambio:     </b></td>
            <td><s:property value="motivacion" /></td>
        </tr>
        <tr>
            <td><b>Observaciones:</b></td>
            <td><s:property escapeHtml="false" value="advertencia.replace(\"\n\", \" <br />\")" /></td>
        </tr>
    </table>
    <br/>
    <br/>
    <center>
        
    </center>
    <br/>
    <table>
        <tr>
            <td>
                <%
                    Map session2 = ActionContext.getContext().getSession();
                    if (session2.get("rol").toString().equals("Coordinador")) {

                %>
                <s:form action="Aprobar">
            <center>    <s:submit  value="Aceptar solicitud" type="button"/></center>
            </s:form>
            <%            } else {
            %>
            <s:form action="Recomendar">
            <center>    <s:submit  value="Recomendar estudiante" type="button"/></center>
            </s:form>
            <%                 }
            %>  
        </td>
        <td>
            <%
                    if (session2.get("rol").toString().equals("Coordinador")) {

                %>
            <s:form action="Denegar">
            <center><s:submit  value="Negar solicitud" type="button"/></center>
            </s:form>
            <%            } else {
            %>
            <s:form action="NoRecomendar">
            <center><s:submit  value="No Recomendar" type="button"/></center>
            </s:form>
            <%                 }
            %> 
        <td>
            </tr>
    </table>
</div>

