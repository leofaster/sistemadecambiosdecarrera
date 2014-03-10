<%-- 
    Document    : indexCoordinador
    Author      : CHANGE Gate
--%>

<%@page import="com.opensymphony.xwork2.ActionContext"%>
<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>

<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript">
    function descargar(val) {
        document.fom.action = "download.action?ruta=" + val;
        document.fom.submit();
    }
</script>

 <%
    Map sesion = ActionContext.getContext().getSession();   
 %>
<center><h4>Asignación de Extraplanes</h4> </center>
<br/>
<table border="0"> 
    <tr>
        <td><b>Nombre:</b></td>
        <td><%= sesion.get("rec_nombre")%></td>
    </tr>
    <tr>
        <td><b>Carnet:</b></td>
        <td><%= sesion.get("rec_usbid")%></td>
    </tr>
    <tr>
        <td><b>Índice:</b></td>
        <td><%= sesion.get("rec_indice")%></td>
    </tr>
    <tr>
        <td><b>Carrera de origen:</b></td>
        <td><%= sesion.get("rec_cOrigen")%></td>
    </tr>
    
</table>
    <br/>
    <center>Seleccione una plantilla de plan de estudio o <br/>cree un nuevo plan 
        de estudio para este estudiante.<br/>
        Podrá modificar el plan de estudio seleccionado en la próxima ventana.</center>
    <br/>
    
    <form name="fom" method="post">
        <div class="tablaFormal">
            <table>
                <tr> 
                    <td>Nombre</td>
                    <td>Asignaturas</td>
                    <td>Seleccionar</td>
                </tr> 
                <%
                List l = (List) sesion.get("rec_plantillas");
                if (l != null && l.size() != 0) {
    
                    Iterator it = l.iterator();
                    String nombre = "";
                    String lista = "";
                    while (it.hasNext()) {
                        actions.Plantillas p = (actions.Plantillas) it.next();
                        nombre = p.getNombre();
                        lista = p.getListaMaterias();
                %>
                <tr> 
                    <td><%= nombre%></td>
                    <td><%= lista%></td>
                    <td><input type="radio" name="plantilla" value="<%= nombre%>"></a></td>
                </tr> 
                <%}
                }%>
                <tr>
                    <td>Nuevo Plan</td>
                    <td>Crear nuevo plan de estudio para este estudiante</td>
                    <td><input type="radio" name="plantilla" value="newPlantilla"></td>
                </tr>
            </table>  
        </div>
        <div align="right">
            <input type="button" onclick="mostrarVentana();" value="Siguiente ->">
        </div>
    </form>
                
                
<div id="miVentana" style="position: fixed; width: 350px; height: 155px; top: 0; left: 0; font-family:Verdana, Arial, Helvetica, sans-serif; font-size: 14px; font-weight: normal; border: #333333 3px solid; background-color: #FAFAFA; color: #000000; display:none;">
    <div style="font-weight: bold; text-align: left; color: #FFFFFF; padding: 5px; background-color:#006394">Modificación de Plan de Estudio</div>
    <p style="padding: 5px; text-align: justify; line-height:normal">¿Desea agregar o eliminar alguna materia del plan de estudio seleccionado?</p>
    <div style="padding: 5px; background-color: #F0F0F0; text-align: center; margin-top: -65px;">
        <input id="btnAceptar" onclick="confirmar();" name="btnAceptar" size="20" type="button" value="Sí" />
        <input id="btnAceptar" onclick="ocultarVentana();" name="btnAceptar" size="20" type="button" value="No" />
    </div>
</div>