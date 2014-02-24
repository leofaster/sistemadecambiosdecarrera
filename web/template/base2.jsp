<%-- 
    Document   : base2
    Created on : Nov 4, 2013, 6:04:01 PM
    Author     : CHANGE Gate 
--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>    
    <head>
        <script language="javascript" type="text/javascript" src="javascripts/funciones.js"></script>
        <script src="javascripts/jquery.js"></script>
        <script src="javascripts/bootstrap-transfer.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.9.1.js"></script>
  <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <link rel="stylesheet" type="text/css" href="stylesheets/estilo.css">
        <link rel="stylesheet" type="text/css" href="stylesheets/estructura2.css">
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

            <div class="footer">
                <tiles:insertAttribute name="footer" />
            </div>

        </div>
    </body>
</html>
