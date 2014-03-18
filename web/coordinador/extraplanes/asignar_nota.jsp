<%-- 
    Document    : indexCoordinador
    Author      : CHANGE Gate
--%>

<%@page import="com.opensymphony.xwork2.ActionContext"%>
<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>
<div id="loginDiv" alt="especial">
    <center><h3>Requerimientos de calificación mínima</h3> </center>
    <br/>
    <p align="justify">Escriba en el recuadro de la derecha la nota mínima que desee que el estudiante
        obtenga en la asignatura indicada.</p>
    
    <form name="fom" method="post" action="AsignarNota">
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
            
            <td>&nbsp;&nbsp;<input type="text" name="notas[<%= i%>].nota" value="3">
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
            <input type="submit" value="Siguiente ->">
        </div>
    </form>
</div>