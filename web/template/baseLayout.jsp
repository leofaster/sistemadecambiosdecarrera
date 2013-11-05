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
        <div id="body-content">

            <!-- <img id="banner" src="images/bannerdisfuminado.png" alt="usb"> -->
            <tiles:insertAttribute name="header" />

            <div id="sidebarL">
                <tiles:insertAttribute name="menu" />

                <!--
                <div class="glossymenu" style="width: 190px">
                    <a style="border-bottom: none;" ><a href="javascript:unhide('loginDiv');" class="menuitem">Login</a></a>
                    <a style="border-bottom: none;" ><a href="javascript:unhide('normasGenerales');" class="menuitem">Normas Generales para el Cambio de Carrera</a></a>
                    <a style="border-bottom: none;" ><a href="http://topacio.cenda.usb.ve/reglamentos/ver/236" target="_blank" class="menuitem">Reglamento USB sobre los Cambios de Carrera</a></a>
                </div>
                -->

            </div>

            <div id="sidebarR" style="width:150px; height: 250px;">
                <br>
                <tiles:insertAttribute name="banner" />
                <!--               
                               <div>
                                    <a href="http://www.usb.ve/" target="_blank"><img width="150" height="50" src="images/somosusb.gif"></a>
                                </div>
                -->
            </div>

            <div style="width:760px;margin-left:auto;margin-right:auto;">

                <tiles:insertAttribute name="body" />

                <div id="footer">
                    <tiles:insertAttribute name="footer" />
                    <!--<p>Copyright © CHANGE Gate</p> -->
                </div>

            </div>

    </body>
</html>
