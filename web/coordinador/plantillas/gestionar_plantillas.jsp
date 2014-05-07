<%-- 
    Document    : gestionar_plantillas
    Author      : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>

<head>
    <style>
        .footer{
            position: static;
            bottom: auto; 
        } 

    </style>
    <script type="text/javascript">
        function deleteRecord(val) {
            document.fom.action = "EliminarPlantilla.action?nombre=" + val;
            document.fom.submit();
        }
        function edita(val) {
            document.fom.action = "ModificarPlantilla.action?nombre=" + val;
            document.fom.submit();
        }
        function create() {
            document.fom2.action = "AgregarPlantilla.action";
            document.fom2.submit();
        }
    </script>
</head>

<div>

    <h4>Plantillas de Plan de Estudio:</h4>
    <s:if test="hasActionMessages()">
        <div class="aproveDiv">
            <s:iterator value="actionMessages">
                <span class="aproveMsg"><s:property escape="false" />
                </span>
            </s:iterator>
        </div><br />
    </s:if>

    <form name="fom2" method="post">
         <button type="submit" class="btn btn-default" onClick="create();">Crear Plantilla</button>

    </form>
    <br />
    <%
        List l = (List) request.getAttribute("lista_plantillas");
        if (l != null && l.size() != 0) {
    %>
    <div class="tablaFormal">
        <table>
            <form name="fom" method="post">
                <tr> 
                    <td>Nombre</td>
                    <td>Asignaturas</td>
                    <td>Modificar</td>
                    <td>Eliminar</td>
                </tr> 
                <%
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
                    <td><a href="javascript:edita('<%= nombre%>')"><img src="images/edit.png" alt="Editar"  title="Editar" width="20" height="20"></a></td>
                    <td><a href="javascript:deleteRecord('<%= nombre%>')"><img src="images/delete.png" alt="Eliminar" title="Eliminar" width="20" height="20"></a></td>
                </tr> 
                <%}%>
            </form>
        </table>  
    </div>
    <%} else {%>
    <center><b>No hay plantillas de plan de estudio en el sistema.</td></b></center>
    <%}%>
</div>