<%-- 
    Document    : mostrarCupos
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

       

        <div class="form-group">
            <label for="carrera" class="col-sm-2 control-label" >Carrera</label>
            <div class="col-sm-10">

                <select name="carrera" id="solicitudCuposCoordinador_carrera"  class="form-control">
                    <option value="-1"
                            >Seleccionar carrera...</option>
                    <option value="0100 - Ingenieria Electrica">0100 - Ingenieria Electrica</option>
                    <option value="0200 - Ingenieria Mecanica">0200 - Ingenieria Mecanica</option>
                    <option value="0300 - Ingenieria Quimica">0300 - Ingenieria Quimica</option>
                    <option value="0600 - Ingenieria Electronica">0600 - Ingenieria Electronica</option>
                    <option value="0800 - Ingenieria de la Computacion">0800 - Ingenieria de la Computacion</option>
                    <option value="1200 - Ingenieria Geofisica">1200 - Ingenieria Geofisica</option>
                    <option value="1500 - Ingenieria de Materiales">1500 - Ingenieria de Materiales</option>
                    <option value="1700 - Ingenieria de Produccion">1700 - Ingenieria de Produccion</option>
                    <option value="1800 - Ingenieria de Telecomunicaciones">1800 - Ingenieria de Telecomunicaciones</option>
                    <option value="0400 - Licenciatura en Quimica">0400 - Licenciatura en Quimica</option>
                    <option value="0500 - Licenciatura en Matematicas">0500 - Licenciatura en Matematicas</option>
                    <option value="1000 - Licenciatura en Fisica">1000 - Licenciatura en Fisica</option>
                    <option value="1900 - Licenciatura en Biologia">1900 - Licenciatura en Biologia</option>
                    <option value="0700 - Arquitectura">0700 - Arquitectura</option>
                    <option value="1100 - Urbanismo">1100 - Urbanismo</option>
                    <option value="3200 - Licenciatura en Comercio Internacional">3200 - Licenciatura en Comercio Internacional</option>
                    <option value="3000 - Licenciatura en Gestión de la Hospitalidad">3000 - Licenciatura en Gestión de la Hospitalidad</option>


                </select>

            </div>
        </div> 





        <button type="submit" class="btn btn-default">Aceptar</button>
        

    </s:form>
    <br />
    <div>
        <center>

            <%
                List l = (List) request.getAttribute("disp2");
                if (l != null) {
                    String Cohorte = "Cohorte";
                    String Cupos = "Cupos Aprobados por Consejo";
                    String Activos = "Estudiantes Activos";
            %>
            <div class="tablaFormal">
                <table>
                    <form name="fom" method="post">
                        <tr>
                        <center><td ><%= Cohorte%></td> </center>
                        <center><td ><%= Cupos%></td></center>
                        <center><td ><%= Activos%></td></center>
                        <center><td >Cupos Disponibles</td></center>
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
                                    int total = Integer.parseInt(cuposCo) - Integer.parseInt(cuposA);
                                    if (total < 0) {
                                        total = 0;
                                    }
                        %>
                        <tr> 
                        <center><td ><%= NumCo%></td></center>
                        <center><td ><%= cuposCo%></td></center>
                        <center><td ><%= cuposA%></td></center>
                        <center><td ><%= total%></td></center>
                        </tr> 


                        <% }%>
                    </form>
                </table>
            </div>
            <% }%>




        </center>
    </div>
</div>