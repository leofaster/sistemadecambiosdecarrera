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
    function mostrarVentana() {
        var ventana = document.getElementById('miVentana'); // Accedemos al contenedor
        ventana.style.marginTop = "100px"; // Definimos su posición vertical. La ponemos fija para simplificar el código
        ventana.style.marginLeft = ((document.body.clientWidth - 350) / 2) + "px"; // Definimos su posición horizontal
        ventana.style.display = 'block'; // Y lo hacemos visible
    }
</script>

    <center><h3>Requerimientos de calificación mínima</h3> </center>
    <br/>
    <p align="justify">Escriba en el recuadro de la derecha la nota mínima que desee que el estudiante
        obtenga en la asignatura indicada.</p>
    
    <form name="fom" method="post">
    <%
        List l = (List) request.getAttribute("lista_materias");
        if (l != null && l.size() != 0) {
            Iterator it = l.iterator();
            String nombre = "";
            String codigo = "";
            int i = 0;
            while (it.hasNext()) {
                clases.Asignatura a = (clases.Asignatura) it.next();
                nombre = a.getNombre();
                codigo = a.getCodigoS();
        
    %>
    <table border="0"> 
        <tr>
            <td><%= nombre%></td>
            <td><s:select name="notas[<%= i%>].nota"  required="true"
                  list="{4,5}"
                  headerKey="3" headerValue="3"/>
                
            <%--<td>&nbsp;&nbsp;<input type="text" name="notas[<%= i%>].nota" value="3">--%>
            <input type="hidden" name="notas[<%= i%>].codigo" value="<%= codigo%>" /></td>
        </tr>
    </table>
    <%          i = i+1;
            }
        }
    %>
    <br/>
    <br/>
        <div align="right">
            <input type="button" onclick="goBack()" value="<- Anterior">
            <input type="button" onclick="mostrarVentana()" value="Siguiente ->">
        </div>
    </form>
    
    <div id="miVentana" style="position: fixed; width: 350px; height: 155px; top: 0; left: 0; font-family:Verdana, Arial, Helvetica, sans-serif; font-size: 14px; font-weight: normal; border: #333333 3px solid; background-color: #FAFAFA; color: #000000; display:none;">
    <div style="font-weight: bold; text-align: left; color: #FFFFFF; padding: 5px; background-color:#006394">Asinación de notas</div>
    <p style="padding: 5px; text-align: justify; line-height:normal">¿Está seguro de continuar con las calificaciones suministradas?</p>
    <div style="padding: 5px; background-color: #F0F0F0; text-align: center; margin-top: -65px;">
        <input id="btnAceptar" onclick="confirmar();" name="btnAceptar"  type="button" value="Continuar" />
        <input id="btnAceptar" onclick="ocultarVentana();" name="btnAceptar" type="button" value="Cancelar" />
    </div>
</div>