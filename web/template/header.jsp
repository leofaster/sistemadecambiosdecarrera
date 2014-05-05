<%-- 
    Document   : header
    Created on : Nov 4, 2013, 6:00:39 PM
    Author     : CHANGE Gate 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <img id="banner" src="images/banners/top_uni.jpg" alt="Universidad Simon Bolivar">
    <%if (session.getAttribute("usbid") != null &&
          session.getAttribute("nombre") != null &&
          session.getAttribute("apellido") != null){%>
    <div id="usuarioid">
        <%=session.getAttribute("nombre")%> 
        <%=session.getAttribute("apellido")%>, 
        <strong><a href="<s:url action="salir"/>" >Cerrar Sesión</a></strong>
    </div>

   <%}%>
</html>
