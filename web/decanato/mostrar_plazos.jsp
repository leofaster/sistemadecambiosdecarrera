<%-- 
    Document    : mostrarCupo
    Author      : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>
<script type="text/javascript">

    function edita(val) {
        document.fom.action = "pedirModifPlazos.action?carrera=" + val;
        document.fom.submit();
    }
</script>

<h4>Gestión de Plazos:</h4>

<s:if test="hasActionErrors()">
    <div class="denyDiv">
        <s:iterator value="actionErrors">
            <span class="denyMsg" style="font-size:13px"><s:property escape="false" />
            </span>
        </s:iterator>
    </div>
    <br />
</s:if>
<s:form action="GestionarPlazos">
    Seleccione la carrera cuyos plazos desea consultar o modificar:
    <br />
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
    <br />
    <s:submit value="Aceptar" />
</s:form>
<br/>
<center>
    <div class="tablaFormal">
        <table>
            <form name="fom" method="post">
                <tr>
                <center><td><b>Trimestres mínimos para solicitar cambio</b></td> </center>
                <center><td><b>Trimestres máximos para cursar extraplanes</b></td></center>
                <center><td><b>Acción</b></td></center>
                </tr>
                <%
                    List l = (List) request.getAttribute("disp2");
                    if (l != null) {

                        Iterator it = l.iterator();

                        while (it.hasNext()) {
                            clases.Plazo b = (clases.Plazo) it.next();
                            int tmax = b.getTrimmax();
                            int tmin = b.getTrimmin();
                            String carrera = b.getCodcarrera();
                %>
                <tr> 
                <center><td class="bord"><%= tmin%></td></center>
                <center><td class="bord"><%= tmax%></td></center>
                <td class="bord"><center><a href="javascript:edita('<%=carrera%>')"><img src="images/edit.png" alt="Editar" title="Editar" width="20" height="20"></a></center></td>
                </tr> 
                <%
                        }
                    }
                %>  
            </form>
        </table>    
    </div>
</center>
