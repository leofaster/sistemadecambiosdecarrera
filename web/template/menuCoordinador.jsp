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
        <a style="border-bottom: none;" ><a href="<s:url action="modificarCuposLink2"/>" class="menuitem">Modificar los Cupos de la Carrera</a>
        <a style="border-bottom: none;" ><a href="javascript:unhide('verCupos');" class="menuitem">Ver Cupos Disponibles por Carrera</a>
        <a style="border-bottom: none;" ><a href="javascript:unhide('SolP');" class="menuitem">Gestionar solicitudes</a>
        <a style="border-bottom: none;" ><a href="index.jsp" class="menuitem">Salir</a>
    </div>  
</html>
