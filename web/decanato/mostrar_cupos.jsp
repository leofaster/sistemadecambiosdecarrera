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
<<<<<<< HEAD
<h4>Gestión de Cupos</h4>
=======
<h4>Gestión de Cupos:</h4>
>>>>>>> c384fcdcf3fd593ffe3df94644ef02d4fa3958d6
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
<<<<<<< HEAD
    <br />
    <br />
    <div class="form-group">
        <label for="carrera" class="col-sm-2 control-label" >Carrera</label>
        <div class="col-sm-10">
            <select name="carrera" id="GestionarCupos_carrera"  class="form-control">
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
=======
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
>>>>>>> c384fcdcf3fd593ffe3df94644ef02d4fa3958d6
</s:form>
<br />
<center>
    <div class="tablaFormal">
        <table>
            <form name="fom" method="post">
<<<<<<< HEAD

                <%
                    List l = (List) request.getAttribute("disp2");
                    if (l != null) {

                %>

=======
>>>>>>> c384fcdcf3fd593ffe3df94644ef02d4fa3958d6
                <tr>
                <center><td class="bord">Cohorte</td> </center>
                <center><td class="bord">Cupos Aprobados por Consejo</td></center>
                <center><td class="bord">Estudiantes Activos</td></center>
                <center><td class="bord">Cupos Disponibles</td></center>
                </tr>
                <%
<<<<<<< HEAD

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
=======
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
>>>>>>> c384fcdcf3fd593ffe3df94644ef02d4fa3958d6
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





