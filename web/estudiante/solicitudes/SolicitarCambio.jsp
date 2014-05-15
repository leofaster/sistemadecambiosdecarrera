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
        <div class="form-group">

            <label for="carrera_dest" class="col-sm-5" >Carrera solicitada:</label>
            <div class="col-sm-10">
                <select  name='carrera_dest' class="form-control col-sm-offset-2">
                    <option value='-1'>Seleccionar Carrera...</option>
                    <option value='0100'>0100 - Ingeniería Eléctrica</option>
                    <option value='0200'>0200 - Ingeniería Mecánica</option>
                    <option value='0300'>0300 - Ingeniería Química</option>
                    <option value='0400'>0400 - Licenciatura en Química</option>
                    <option value='0500'>0500 - Licenciatura en Matemáticas</option>
                    <option value='0501'>0501 - Lic.en Matemáticas (Est. y Mat.Computacional)</option>
                    <option value='0502'>0502 - Licenciatura en Didáctica de la Matemática</option>
                    <option value='0600'>0600 - Ingeniería Electrónica</option>
                    <option value='0700'>0700 - Arquitectura</option>
                    <option value='0800'>0800 - Ingeniería de la Computación</option>
                    <option value='1000'>1000 - Licenciatura en Física</option>
                    <option value='1100'>1100 - Urbanismo</option>
                    <option value='1200'>1200 - Ingeniería Geofísica</option>
                    <option value='1500'>1500 - Ingeniería de Materiales</option>
                    <option value='1700'>1700 - Ingeniería de Producción</option>
                    <option value='1800'>1800 - Ingeniería de Telecomunicaciones</option>
                    <option value='1900'>1900 - Licenciatura en Biología</option>
                    <option value='3000'>3000 - Licenciatura en Gestión de la Hospitalidad</option>
                    <option value='3200'>3200 - Licenciatura en Comercio Internacional</option>
                    <option value='4000'>4000 - Ingeniería de Mantenimiento</option>
                </select>
            </div>
            <br><br><br><br>
            <label for="motivacion" class="col-sm-5" >Motivación para solicitar el cambio:</label>
            <div class="col-sm-10">
                <textarea class="form-control col-sm-offset-2" rows="3" name='motivacion' onkeyup="countChar(this)" ></textarea>
            </div>
            <br><div id="charNum" class="col-sm-10 col-sm-offset-2">Máximo 1500 caracteres</div>
        </div>
        

    <br><br><h5><b>Preguntas para la evaluación de DIDE:</b></h5><br>
    <%
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
        <%=numero %>) <%=enunciado %>: 
        <div class="col-sm-10">
            <textarea class="form-control" rows="3" name='motivacion' ></textarea>
        </div>
        <br><br><br><br><br><br>
        
    <%      }%>
    <%  }%>
    
</form>

<center>
    <input type="button" oclass="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" value="Enviar">
</center>


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
    };
</script>