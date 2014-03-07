<%-- 
    Document    : mostrarCupo
    Author      : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>
<script type="text/javascript">

    function edita(val, val2) {
        document.fom.action = "pedirModifCupos.action?carrera=" + val + "&cohorte=" + val2;
        document.fom.submit();
    }
    function editact(val, val2) {
        document.fom.action = "pedirModifActivos.action?carrera=" + val + "&cohorte=" + val2;
        document.fom.submit();
    }
</script>
<h4>Gestión de Cupos:</h4>
<s:if test="hasActionErrors()">
    <div class="denyDiv">
        <s:iterator value="actionErrors">
            <span class="denyMsg" style="font-size:13px"><s:property escape="false" />
            </span>
        </s:iterator>
    </div>
    <br />
</s:if>
<br/>

<s:form action="GestionarCupos">
    Seleccione la carrera de la cual desea saber la cantidad de cupos:
    <br /><br />
    <s:select name="carrera"  required="true"
              list="{'0100 - Ingenieria Electrica', 
              '0200 - Ingenieria Mecanica', 
              '0300 - Ingenieria Quimica', 
              '0600 - Ingenieria Electronica', 
              '0800 - Ingenieria de la Computacion',
              '1200 - Ingenieria Geofisica',
              '1500 - Ingenieria de Materiales', 
              '1700 - Ingenieria de Produccion', 
              '1800 - Ingenieria de Telecomunicaciones',
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
<br />
<center>
    <div class="tablaFormal">
        <table>
            <form name="fom" method="post">
                <tr>
                <center><td class="bord">Cohorte</td> </center>
                <center><td class="bord">Cupos Aprobados por Consejo</td></center>
                <center><td class="bord">Estudiantes Activos</td></center>
                <center><td class="bord">Cupos Disponibles</td></center>
                </tr>
                <%
                    List l = (List) request.getAttribute("disp2");
                    if (l != null) {

                        Iterator it = l.iterator();

                        while (it.hasNext()) {
                            clases.Cohorte b = (clases.Cohorte) it.next();
                            String cuposCo = b.getCupos();
                            String NumCo = b.getCohorte();
                            String cuposA = b.getCuposa();
                            String carrera = b.getCarrera();
                            int total = Integer.parseInt(cuposCo) - Integer.parseInt(cuposA);
                            if (total < 0) {
                                total = 0;
                            }
                %>
                <tr> 
                <center><td class="bord"><%= NumCo%></td></center>
                <center><td class="bord"><%= cuposCo%> &nbsp;<a href="javascript:edita('<%=carrera%>','<%=NumCo%>')"><img src="images/edit.png" alt="Editar" title="Editar" width="20" height="20"></a></td></center>
                <center><td class="bord"><%= cuposA%> &nbsp;<a href="javascript:editact('<%=carrera%>','<%=NumCo%>')"><img src="images/edit.png" alt="Editar" title="Editar" width="20" height="20"></a></td></center>
                <center><td class="bord"><%= total%></td></center>
                </tr> 
                <%
                        }
                    }
                %>  
            </form>
        </table>    
    </div>
</center>





