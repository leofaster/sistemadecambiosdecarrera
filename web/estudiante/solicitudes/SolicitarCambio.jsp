<%-- 
    Document    : CampoInvalido
    Author      : CHANGE Gate
--%>

<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page import="java.util.*;" %>
<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h4>Pre-Solicitud de Cambio de Carrera:</h4><br />
<s:if test="hasActionErrors()">
    <div class="denyDiv">
        <s:iterator value="actionErrors">
            <span class="denyMsg" style="font-size:13px"><s:property escape="false" />
            </span>
        </s:iterator>

    </div>
    <br />
</s:if>

<div class="tabla" style="box-shadow: none;  margin: 0 auto;">
    <table>
        <tr>
            <td>Carnet</td>
            <td>Cédula</td>
            <td>Nombre</td>
        </tr>
        <tr>
            <td><%=session.getAttribute("usbid")%></td>
            <td><%=session.getAttribute("cedula")%></td>
            <td><%=session.getAttribute("nombreCompleto")%></td>
        </tr>
    </table>
</div>      
<br>
<form action="verificarSol" name="entrar" class="form-horizontal" role="form" >
    <%-- <s:form action="verificarSol" name="entrar"> --%>
        <div class="form-group">
            <label for="carrera_dest" class="col-sm-2 control-label" >Carrera</label>
            <div class="col-sm-10">

                <select  name='carrera_dest' class="form-control">
                    <option value='-1'>Seleccionar Carrera...</option>
                    <option value='0100'>0100 - Ingeniería Eléctrica</option>
                    <option value='0200'>0200 - Ingeniería Mecánica</option>
                    <option value='0300'>0300 - Ingeniería Química</option>
                    <option value='0600'>0600 - Ingeniería Electrónica</option>
                    <option value='0800'>0800 - Ingeniería de la Computación</option>
                    <option value='1200'>1200 - Ingeniería Geofísica</option>
                    <option value='1500'>1500 - Ingeniería de Materiales</option>
                    <option value='1700'>1700 - Ingeniería de Producción</option>
                    <option value='1800'>1800 - Ingeniería de Telecomunicaciones</option>
                    <option value='0400'>0400 - Licenciatura en Química</option>
                    <option value='0500'>0500 - Licenciatura en Matemáticas</option>
                    <option value='1000'>1000 - Licenciatura en Física</option>
                    <option value='1900'>1900 - Licenciatura en Biología</option>
                    <option value='0700'>0700 - Arquitectura</option>
                    <option value='1100'>1100 - Urbanismo</option>
                    <option value='3200'>0400 - Licenciatura en Comercio Internacional</option>
                    <option value='0400'>0400 - Licenciatura en Gestión de la Hospitalidad</option>
                </select>

            </div>
            </div>
 


    <br><h6>Preguntas para la evaluación de DIDE: </h6><br><br>
    <%-- <%
         List l = (List) request.getAttribute("lista_cuestionario");
         if (l != null && l.size() != 0) {
             Iterator it = l.iterator();
             String enunciado = "";
             int numero;
             int i = 0;
             while (it.hasNext()) {
                 clases.Pregunta p = (clases.Pregunta) it.next();
                 enunciado = p.getEnunciado();
                 numero = p.getNumero();
                 

    %>
    <%=numero%>) <%=enunciado %>: <br>
    
    
    
    <%}%>
    --%>

    <%--<s:select name="carrera_dest" label="Carrera Deseada" required="true"
              list="{'0100 - Ingeniería Eléctrica', 
              '0200 - Ingeniería Mecánica', 
              '0300 - Ingeniería Química', 
              '0600 - Ingeniería Electrónica', 
              '0800 - Ingeniería de la Computación',
              '1200 - Ingeniería Geofísica',
              '1500 - Ingeniería de Materiales', 
              '1700 - Ingeniería de Producción',
              '1800 - Ingenieria de Telecomunicaciones',
              '0400 - Licenciatura en Química',
              '0500 - Licenciatura en Matemáticas',
              '1000 - Licenciatura en Física',
              '1900 - Licenciatura en Biología',
              '0700 - Arquitectura',
              '1100 - Urbanismo',
              '3200 - Licenciatura en Comercio Internacional',
              '3000 - Licenciatura en Gestión de la Hospitalidad'}"
              headerKey="-1" headerValue="Seleccionar carrera..."/>--%>
    <br><br> 


    <!--<input type="text" maxlength="1500" name='motivacion' >-->



    <div class="form-group">
        <label for="motivacion" class="col-sm-2 control-label" >Motivacion</label>
        <div class="col-sm-10">
            <textarea class="form-control" rows="3" name='motivacion'onkeyup="countChar(this)" ></textarea>
        </div>
        <!--<label for="inputEmail3" class="col-sm-2 control-label">Motivacion:</label>-->

        <%--  <s:textarea name="motivacion" cols="40" rows="10" maxlength="1500"
                      label="Motivación" required="true"/>--%>
</form>
<%--</s:form>
<s:textarea name="motivacion" cols="40" rows="10" maxlength="1500"
        label="Preg A." required="true"/>--%>
<div id="charNum" class="col-sm-10 col-sm-offset-2">Máximo 1500 caracteres</div>
<center><h6></h6>
    <input type="button" oclass="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" value="Enviar"></center>

<div id="miVentana" style="position: fixed; width: 350px; height: 190px; top: 0; left: 0; font-family:Verdana, Arial, Helvetica, sans-serif; font-size: 12px; font-weight: normal; border: #333333 3px solid; background-color: #FAFAFA; color: #000000; display:none;">
    <div style="font-weight: bold; text-align: left; color: #FFFFFF; padding: 5px; background-color:#006394">
        Confirmación de envío de solicitud de cambio de carrera</div>
    <p style="padding: 5px; text-align: justify; line-height:normal">
        .</p>
    <div style="padding: 10px; background-color: #F0F0F0; text-align: center; margin-top: 44px;">
        <input id="btnAceptar" onclick="confirmar();" name="btnAceptar" size="20" type="button" value="Aceptar" />
        <input id="btnAceptar" onclick="ocultarVentana();" name="btnAceptar" size="20" type="button" value="Cancelar" />
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Confirmación de envío de solicitud de cambio de carrera </h4>
      </div>
      <div class="modal-body">
        Presionando "Aceptar" estás de acuerdo con enviar esta solicitud para que sea evaluada bajo los criterios específicos de la coordinación seleccionada. Recibirás la respuesta a tu solicitud en el correo asociado a tu USBid
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button"  onclick="confirmar();" class="btn btn-default">Aceptar</button>
      </div>
    </div>
  </div>
</div>
<script>
                function countChar(val) {
                    var len = val.value.length;
                    if (len >= 1500) {
                        val.value = val.value.substring(0, 1500);
                    } else {
                        $('#charNum').text((1500 - len) + ' caracteres');
                    }
                }
                ;
</script>