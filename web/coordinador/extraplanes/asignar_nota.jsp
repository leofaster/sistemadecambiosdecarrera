<%-- 
    Document    : indexCoordinador
    Author      : CHANGE Gate
--%>

<%@page import="com.opensymphony.xwork2.ActionContext"%>
<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>

<script type="text/javascript">
    function confirmar() {
        document.fom.action = "AsignarNota";
        document.fom.submit();
    }
    
</script>

<h3>Requerimientos de calificación mínima</h3>
<br/>
<p align="justify">Seleccione la nota mínima que desee que el estudiante
    obtenga en la asignatura indicada.</p>

<form name="fom" method="post">
    <%
        List l = (List) request.getAttribute("lista_materias");
        if (l != null && l.size() != 0) {
    %>
    <div class="tablaFormal">
        <table border="0"> 
            <tr>
                <td>Asignatura</td>
                <td>Nota</td>
            </tr>   

            <%
                Iterator it = l.iterator();
                String nombre = "";
                String codigo = "";
                int i = 0;
                while (it.hasNext()) {
                    clases.Asignatura a = (clases.Asignatura) it.next();
                    nombre = a.getNombre();
                    codigo = a.getCodigoS();

            %>

            <tr>
                <td><%= nombre%>:  </td>
                <td><select name="notas[<%= i%>].nota">
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>


                    <%--<td>&nbsp;&nbsp;<input type="text" name="notas[<%= i%>].nota" value="3">--%>
                    <input type="hidden" name="notas[<%= i%>].codigo" value="<%= codigo%>" /></td>
            </tr>
      
    <%          i = i + 1;
            }%>
          </table>
    </div>    
    
    <%
        }
    %>
    <br/>
    <br/>
    <div align="right">
        <input type="button"  class="btn btn-default" onclick="goBack()" value="&laquo; Anterior">
        <input type="button"  class="btn btn-default" data-toggle="modal" data-target="#myModal" value="Siguiente &raquo;">
    </div>
</form>

<div id="miVentana" style="position: fixed; width: 350px; height: 155px; top: 0; left: 0; font-family:Verdana, Arial, Helvetica, sans-serif; font-size: 14px; font-weight: normal; border: #333333 3px solid; background-color: #FAFAFA; color: #000000; display:none;">
    <div style="font-weight: bold; text-align: left; color: #FFFFFF; padding: 5px; background-color:#006394">
        Asinación de notas</div>
    <p style="padding: 5px; text-align: justify; line-height:normal">
        ¿Está seguro de continuar con las calificaciones suministradas?</p>
    <div style="padding: 5px; background-color: #F0F0F0; text-align: center; margin-top: -65px;">
        <input id="btnAceptar" onclick="confirmar();" name="btnAceptar"  type="button" value="Continuar" />
        <input id="btnAceptar" onclick="ocultarVentana();" name="btnAceptar" type="button" value="Cancelar" />
    </div>
</div>
    
    
    <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Asinación de notas</h4>
      </div>
      <div class="modal-body">
        ¿Está seguro de continuar con las calificaciones suministradas?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button"  onclick="confirmar();" class="btn btn-primary">Continuar</button>
      </div>
    </div>
  </div>
</div>