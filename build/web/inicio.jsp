<%-- 
    Document   : Inicio
    Created on : 25/05/2013, 10:57:11 PM
    Author     : CHANGE Gate
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Basics -->
        <title>Sistema de Cambios de Carreras</title>
        <!-- CSS -->
        <link rel="stylesheet" href="index/css/styles.css">
    </head>
    
    <body>
        <div align="center">
            <a href="http://www.usb.ve/"><img class="banner" src="index/images/banner.png"></a>
        </div>
    <!-- Begin Page Content -->
        <form action="buscarEst">
            <div id="container">
                <div id="left">
                    <label for="username">USBid:</label><br />
                    <input type="text" id="username" name="usbido"><br />
                    <label for="password">Contraseña:</label><br />
                    <input type="password" id="password" name="password">
                </div>
                <div id="right" style="background: url(index/images/logo.png) no-repeat center;padding-left:20px;width:360px;height:220px">
                </div>
                <div id="lower">
                    <table>
                        <tr>
                            <td style="padding:17px 15px 0 15px;"><a class="sombras" href="http://www.bio.coord.usb.ve/archivos/cambio_carrera.pdf">
                            Normas generales para el cambio de carrera</a></td>
                            <td style="padding:17px 15px 0 15px;"><a class="sombras" href="http://www.cenda.usb.ve/reglamentos/ver/236">
                            Reglamento USB para los cambios de carrera</a></td>
                            <td style="padding:0 15px 0 60px;"><input type="submit" value="Entrar"></td>
                        </tr>
                    </table>
                </div><!--/ lower-->
            </div>
        </form>
    <!-- End Page Content -->
    </body>
</html>