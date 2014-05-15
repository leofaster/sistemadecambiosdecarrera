<%--
    Document    : home
    Author      : CHANGE Gate
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib uri="/struts-tags" prefix="s" %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
    <head>
        <title>Servicio Centralizado de Autenticaci&oacute;n</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="stylesheets/estilo.css">
        <link rel="stylesheet" type="text/css" href="stylesheets/cas.css"></link>
        <script src="javascripts/cas.js"></script>
        <link rel="icon" href="/favicon.ico" type="image/x-icon" />
    </head>

    <body id="cas" onload="init();">
        <div id="header">
            <table border="0" width="100%">
                <tr>
                    <p style="position:relative; top:0; left:0; background:#5896F8  url(images/lineadeg.gif) repeat scroll 25px 10px" >&nbsp;</p>
                    <td align="center">
                        <BR><BR><h1 id="app-name"> <BR> </h1>
                    </td>
                </tr>
            </table>
        </div>
        
        <s:if test="hasActionErrors()">
            <div class="denyDiv">
                <s:iterator value="actionErrors">
                    <span class="denyMsg" style="font-size:13px"><s:property escape="false" /></span>
                </s:iterator>
            </div>
            <br />
        </s:if>

        <div id="content">
            <form id="fm1" class="fm-v clearfix" action="/CambioCarrera/Login.action" method="post">
                <div class="box" id="login">
                <!-- ·Felicidades por iniciar CAS correctamente! El manejador de autenticación por defecto autentica siempre que el nombre de usuario sea igual a la contraseña: adelante, pruébelo. -->
                    <h2>Introduzca su USBID y Contraseña.</h2>
                    <div class="row">
                        <label for="usbid"><span class="accesskey">U</span>SBID:</label>
                        <input id="username" name="usbid" class="required" tabindex="1" accesskey="n" type="text" value="" size="25"/><s:fielderror fieldName="usbid"/>
                    </div>
                    <div class="row">
                        <label for="contrasena"><span class="accesskey">C</span>ontraseña:</label>
                        <input id="password" name="contrasena" class="required" tabindex="2" accesskey="c" type="password" value="" size="25"/>
                        <s:fielderror fieldName="contrasena"/>
                    </div>
                    <div class="row btn-row">
                        <input class="btn-submit" accesskey="l" value="INICIAR SESIÓN" tabindex="4" type="submit" />
                        <input class="btn-reset" accesskey="c" value="LIMPIAR" tabindex="5" type="reset" />
                    </div>
                </div>

                <div id="sidebar">
                    <p>Por razones de seguridad, por favor cierre la sesión y cierre su navegador web cuando haya terminado de acceder a los servicios que requieren autenticación.</p>
                </div>
            </form>
        </div>
        
        <div aling="left">
            <BR><BR><BR>
            <table align="left" border="0" cellpadding="1" cellspacing="1">
                <tr>
                    <td valign="bottom" width="95">
                        <a href="http://www.usb.ve"><img alt="" src="images/cebolla_70_45.jpg" /></a>
                    </td>
                    <td valign="bottom">
                        <a href="http://www.usb.ve/home/node/68"> e-virtual</a> | <a href="https://webmail.usb.ve/" target="_blank">Correo</a> |<a href="http://www.usb.ve/buscador.php" target="_blank"> </a><a href="https://esopo.usb.ve">esopo</a> |<a href="http://www.usb.ve/buscador.php" target="_blank"> </a><a href="http://www.youtube.com/canalusb" target="_blank">canalUSB</a> | <a href="http://www.usb.ve/agenda.php" target="_blank">Agenda Cultural</a> | <a href="http://usbnoticias.info/" target="_blank">USBnoticias</a> |<span> </span><span> </span><a href="http://www.usb.ve/home/node/55">Calendario</a> |<br />
                        Sede Sartenejas, Baruta, Edo. Miranda - Apartado 89000 - Cable Unibolivar - Caracas Venezuela. Tel&eacute;fono +58 0212-9063111<br />
                        Sede Litoral, Camur&iacute; Grande, Edo. Vargas Parroquia Naiguat&aacute;. Tel&eacute;fono +58 0212-9069000<br />
                        Dise&ntilde;ada y adaptada por la Direcci&oacute;n de Servicios Telem&aacute;ticos <a href="mailto:webmaster@usb.ve">webmaster@usb.ve</a>
                    </td>
                </tr>
            </table>
        </div>
        
        <div id="footer">
            <div align="right">
                <p>Copyright &copy; 2005-2007 JA-SIG. All rights reserved.</p>
                <p>Powered by <a href="http://www.ja-sig.org/products/cas/">JA-SIG Central Authentication Service 3.3.5</a></p>
	    </div>
        </div>
    </body>
</html>