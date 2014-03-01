<%-- 
    Document   : header
    Created on : Nov 4, 2013, 6:00:39 PM
    Author     : CHANGE Gate 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <img id="banner" src="images/banners/top_uni.jpg" alt="Universidad Simon Bolivar">
    <%@ page import="java.util.*;" %>
    <%if (session.getAttribute("usbid") != null){%>
    <p align="right"><font color="blue" ><u><b>
                <%=session.getAttribute("nombre")%>
                <%=session.getAttribute("apellido")%>
    </b></u></font></p>

   <%}%>
</html>
