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
        <meta http-equiv="X-UA-Compatible" content="IE-edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script language="javascript" type="text/javascript" src="javascripts/funciones.js"></script>
        <link rel="stylesheet" type="text/css" href="stylesheets/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="stylesheets/estilo.css">
        <link rel="stylesheet" type="text/css" href="stylesheets/estructura1.css">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.9.1.js"></script>
        <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <script src="javascripts/jquery.js"></script>
        <script src="javascripts/bootstrap-transfer.js"></script>
        <script src="javascripts/bootstrap.min.js"></script>

        <title>
            <tiles:insertAttribute name="title" ignore="true" />
        </title>
    </head>
    <body>
        <div class="container">
            <div id="pagewrap">
                <div class="row">
                    <div class="col-md-12">
                        <div id="header">
                            <tiles:insertAttribute name="header" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="menu col-md-3 col-lg-3">
                        <tiles:insertAttribute name="menu" />
                    </div>
                    <div class="content col-md-6 col-lg-6">
                        <tiles:insertAttribute name="body" />
                    </div>
                    <div id="sidebar" class="col-md-3 col-lg-3">
                        <tiles:insertAttribute name="banner" />
                    </div>    
                </div>

                <div class="row">
                    <div class="footer col-md-12 col-xs-12">
                        <tiles:insertAttribute name="footer" />
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
