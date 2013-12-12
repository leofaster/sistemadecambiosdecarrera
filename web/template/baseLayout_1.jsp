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
        <title>
            <tiles:insertAttribute name="title" ignore="true" />
        </title>
    </head>

    <body>
        <div id="container">
            <div id="body-content">

                <tiles:insertAttribute name="header" />

                <div id="sidebarL">
                    <tiles:insertAttribute name="menu" />



                </div>

                <div id="sidebarR" style="width:150px; height: 250px;">
                    <br>
                    <tiles:insertAttribute name="banner" />
                </div>

                <div style="width:750px;margin-left:auto;margin-right:auto;">

                    <tiles:insertAttribute name="body" />
                    <br /><br /><br /><br /><br /><br />
                    <div class="footer">

                        <tiles:insertAttribute name="footer" />
                    </div>

                </div>
            </div>

        </div>

    </body>
</html>
