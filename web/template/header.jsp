<%-- 
    Document   : header
    Created on : Nov 4, 2013, 6:00:39 PM
    Author     : CHANGE Gate 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <img id="banner" src="images/banners/top_uni.jpg" alt="Universidad Simon Bolivar">
    <%@ page import="java.util.*;" %>
    
    <div class="col-md-5 col-md-offset-7 col-lg-4 col-lg-offset-8  span5 offset7">
        
        
    <%if (session.getAttribute("usbid") != null
                && session.getAttribute("nombre") != null
                && session.getAttribute("apellido") != null) {%>
                <p  id="username">
               Usuario:          
                    <a>
        <%=session.getAttribute("nombre")%>
        <%=session.getAttribute("apellido")%>
                    </a> / <a href="<s:url action='salir'/>" >Salir</a> 
        </p>

<%}%>
    </div>
</html>
