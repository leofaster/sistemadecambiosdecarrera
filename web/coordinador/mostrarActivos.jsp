<%-- 
    Document    : mostrarCupoC
    Author      : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>

<div>
    <s:form action="solicitudCuposCoordinador">
        <h4>Seleccione la carrera:</h4>
        <s:if test="hasActionErrors()">
            <div class="denyDiv">
                <s:iterator value="actionErrors">
                    <span class="denyMsg" style="font-size:13px"><s:property escape="false" />
                    </span>
                </s:iterator>
            </div>
            <br />
        </s:if>
        <s:select name="carrera"  required="true"
                  list="{'0100 - Ingenieria Electrica', 
                  '0200 - Ingenieria Mecanica', 
                  '0300 - Ingenieria Quimica', 
                  '0600 - Ingenieria Electronica', 
                  '0800 - Ingenieria de la Computacion',
                  '1200 - Ingenieria Geofisica',
                  '1500 - Ingenieria de Materiales', 
                  '1700 - Ingenieria de Produccion', 
                  '0400 - Licenciatura en Quimica',
                  '0500 - Licenciatura en Matematicas',
                  '1000 - Licenciatura en Fisica',
                  '1900 - Licenciatura en Biologia',
                  '0700 - Arquitectura',
                  '1100 - Urbanismo',
                  '3200 - Licenciatura en Comercio Internacional',
                  '3000 - Licenciatura en Gestión de la Hospitalidad'}"
                  headerKey="-1" headerValue="Seleccionar carrera..."/>

        <s:submit value="Aceptar" />
    </s:form>
    <div>
        <center>

            <%
                List l = (List) request.getAttribute("disp2");
                if (l != null) {
                    String Cohorte = "Cohorte";
                    String Cupos = "Cupos";
                    String Activos = "Activos";
            %>
            <div class="tabla">
                <table>
                    <form name="fom" method="post">
                        <tr>
                        <center><td ><%= Cohorte%></td> </center>
                        <center><td ><%= Cupos%></td></center>
                        <center><td ><%= Activos%></td></center>
                            <% }%>  
                        </tr>
                        <%
                            if (l != null) {
                                Iterator it = l.iterator();
                                while (it.hasNext()) {
                                    clases.Cohorte b = (clases.Cohorte) it.next();
                                    String cuposCo = b.getCupos();
                                    String NumCo = b.getCohorte();
                                    String cuposA = b.getCuposa();
                        %>
                        <tr> 
                        <center><td ><%= NumCo%></td></center>
                        <center><td ><%= cuposCo%></td></center>
                        <center><td ><%= cuposA%></td></center>

                        </tr> 

                        <% }%>
                    </form>
                </table>
            </div>
            <% }%>



        </center>
    </div>
</div>