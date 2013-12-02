<%-- 
    Document   : baseLayout
    Created on : Nov 4, 2013, 6:04:01 PM
    Author     : CHANGE Gate 
--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>    
    <head>
        <script language="javascript" type="text/javascript" src="javascripts/funciones.js"></script>
        <link rel="stylesheet" type="text/css" href="stylesheets/estilo.css">
        <link rel="stylesheet" type="text/css" href="stylesheets/estructura1.css">

        <title>
            <tiles:insertAttribute name="title" ignore="true" />
        </title>
    </head>
    <body>
        <div id="pagewrap">

            <div id="header">
                <tiles:insertAttribute name="header" />
            </div>
            <div class="menu">
                <tiles:insertAttribute name="menu" />
            </div>
            <div class="content">
                <tiles:insertAttribute name="body" />
            </div>
            <div id="sidebar">
                <tiles:insertAttribute name="banner" />
            </div>
            <div class="footer">
                <tiles:insertAttribute name="footer" />
            </div>
        </div>
    </body>
</html>
