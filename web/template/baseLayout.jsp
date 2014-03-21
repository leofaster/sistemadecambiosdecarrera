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
        <link rel="stylesheet" type="text/css" href="stylesheets/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="stylesheets/estilo.css">
        <link rel="stylesheet" type="text/css" href="stylesheets/estructura1.css">
        <link rel="stylesheet" href="stylesheets/jquery-ui.css">
        <script src="javascripts/jquery-1.10.1.js"></script>
        <script src="javascripts/jquery-ui.js"></script>
        <script src="javascripts/jquery.js"></script>
        <script src="javascripts/bootstrap-transfer.js"></script>
        <script src="javascripts/bootstrap.min.js"></script>

        <title>
            <tiles:insertAttribute name="title" ignore="true" />
        </title>
    </head>
    <body>
        <div id="pagewrap" class="container">
            
            <div id="header" class="row">
                <div class="col-md-12">
                    <tiles:insertAttribute name="header" />
                </div>
            </div>
            <div class="row">
                <div class="menu col-md-3">
                    <tiles:insertAttribute name="menu" />
                </div>
                <div class="content col-md-6">
                    <tiles:insertAttribute name="body" />
                </div>
                <div id="sidebar" class="col-md-3">
                    <tiles:insertAttribute name="banner" />
                </div>    
            </div>
            
            <div class="footer row">
                <div class="col-md-12">
                    <tiles:insertAttribute name="footer" />
                </div>
            </div>
        </div>
    </body>
</html>
