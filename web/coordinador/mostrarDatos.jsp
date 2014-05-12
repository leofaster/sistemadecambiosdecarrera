<%-- 
    Document    : indexCoordinador
    Author      : CHANGE Gate
--%>

<%@page import="com.opensymphony.xwork2.ActionContext"%>
<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>
<script src="javascripts/jquery_1.js"></script>
<div >
  <h4>Perfil del Estudiante</h4> 
    <br/><br/>
    <div class="tablaFormal">
    <table border="0"> 
        <tr>
            <td>Datos</td>
            <td>Estudiante</td>
        </tr>
        <tr>
            <td><b>Nombre</b></td>
            <td><s:property value="nombre_est" /></td>
        </tr>
        <tr>
            <td><b>Carnet</b></td>
            <td><s:property value="carnet_est" /></td>
        </tr>
        <tr>
            <td><b>Índice</b></td>
            <td><s:property value="indice_sol" /></td>
        </tr>
        <tr>
            <td><b>Carrera de origen</b></td>
            <td><s:property value="carreraOrigen_sol" /></td>
        </tr>
        <tr>
            <td><b>Motivación para el cambio     </b></td>
            <td><s:property value="motivacion" /></td>
        </tr>
        <tr>
            <td><b>Observaciones:</b></td>
            <td><s:property escapeHtml="false" value="advertencia.replace(\"\n\", \" <br />\")" /></td>
        </tr>
    </table>
        </div>
    <br/>
    <br/>
    <center>
        <s:form action="MostrarInf">
            <center>
                <center>
                    <input type="submit" value="Mostrar informe académico" class="btn btn-default" />
                    </center>
            </center>
        </s:form>
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
            <center>    
                <input type="submit" value="Aceptar solicitud" class="btn btn-default" />
            </s:form>
            <%            } else {
            %>
            <s:form action="Recomendar">
            <center>    
                <input type="submit" value="Recomendar estudiante" class="btn btn-default" />
                </center>
            </s:form>
            <%                 }
            %>  
        </td>
        <td>
            <%
                if (session2.get("rol").toString().equals("Coordinador")) {

            %>
            <s:form action="Denegar">
            <center>
                <input type="submit" value="Negar solicitud" class="btn btn-default" />
            </center>
            </s:form>
            <%            } else {
            %>
            <s:form action="NoRecomendar">
            <center>
                <input type="submit" value="No Recomendar" class="btn btn-default" />

            </center>
            </s:form>
            <%                 }
            %> 
        <td>
            </tr>
    </table>
</div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
        
        
        
    