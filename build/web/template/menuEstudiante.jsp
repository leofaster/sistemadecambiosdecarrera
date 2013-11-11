<%-- 
    Document   : menu
    Created on : Nov 4, 2013, 6:00:56 PM
    Author     : CHANGE Gate 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <div class="glossymenu" style="width: 190px">
        <a style="border-bottom: none;" ><a href="<s:url action="ListarSol"/>" class="menuitem">Ver Solicitudes de Cambio de Carrera Enviadas</a>
        <a style="border-bottom: none;" ><a href="<s:url action="verificarReq"/>" class="menuitem">Solicitar Cambio de Carrera</a>
        <a style="border-bottom: none;" ><a href="<s:url action="SolicitarCupoEstudianteLink2"/>" class="menuitem">Ver Cupos Disponibles por Carrera</a>
        <a style="border-bottom: none;" ><a href="index.jsp" class="menuitem">Salir</a></a>
    </div>
</html>
