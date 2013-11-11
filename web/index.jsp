<%--
    Document    : index
    Author      : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>    
    <head>
        <script language="javascript" type="text/javascript" src="javascripts/funciones.js"></script>
        <link rel="stylesheet" type="text/css" href="stylesheets/estilo.css">
        <title>Sistema de Cambios de Carrera</title>
    </head>

    <body>
        <div id="body-content">

            <img id="banner" src="images/bannerdisfuminado.png" alt="usb">

            <div id="sidebarL">

                <div class="glossymenu" style="width: 190px">
                    <a style="border-bottom: none;" ><a href="javascript:unhide('loginDiv');" class="menuitem">Login</a>
                    <a style="border-bottom: none;" ><a href="javascript:unhide('normasGenerales');" class="menuitem">¿Cómo solicitar un cambio de carrera mediante este sistema?</a>
                    <a style="border-bottom: none;" ><a href="http://topacio.cenda.usb.ve/reglamentos/ver/236" target="_blank" class="menuitem">Reglamento USB sobre los Cambios de Carrera</a>
                </div>

            </div>

            <div id="sidebarR" style="width:150px; height: 250px;">
                <br>
                <div>
                    <a href="http://www.usb.ve/" target="_blank"><img width="150" height="50" src="images/somosusb.gif"></a>
                </div>
            </div>

            <div style="width:760px;margin-left:auto;margin-right:auto;">

                <div id="loginDiv" alt="especial">
                    <h4>Bienvenido</h4>
                    <h5>Para ingresar al sistema introduzca su usuario y contraseña.</h5>

                    <s:if test="hasActionErrors()">
                        <div id="errores">

                            <s:actionerror />
                        </div>
                    </s:if>

                    <div id="login-form">
                        <s:form action="Login">
                            <table style="border: none">
                                <tr style="border: none">
                                    <td style="border: none"><s:textfield label="Introduzca su USBid" type="text" name="usbid" maxlength="20" size="14" /></td>
                                </tr>
                                <tr style="border: none">
                                    <td style="border: none" colspan="2"></td>
                                </tr>
                                <tr style="border: none">
                                    <td style="border: none"><s:password label="Introduzca su contraseña" type="password" name="contrasena" size="14" /></td>
                                </tr>
                                <tr style="border: none">
                                    <td style="border: none" colspan="2"></td>
                                </tr>
                            </table>
                            <br><br>
                            <s:submit value="Entrar" />
                        </s:form>
                    </div>

                </div>

                <div id="normasGenerales" class="hidden" alt="especial">
                    <pre>
            <h2>
                Instrucciones para solicitar tu cambio:</h2>
        1. Entra al sistema con tu USBid y tu contraseña.

        2. Una vez iniciada tu sesión, haz click en "Solicitar Cambio" en el menú
        de la izquierda.

         3. Selecciona la carrera a la que deseas cambiarte y escribe tu motivación
         para el cambio. Ten en cuenta que la leerá el coordinador de la carrera que 
         seleccionaste.

         4. Presiona "Enviar" y aparecerá una ventana emergente. Si estás de acuerdo con
         las condiciones, presiona "Aceptar". De lo contrario, presiona "Cancelar" y tu
         solicitud no será enviada.

         NOTA: No puedes cambiarte a tu misma carrera ni enviar más de una solicitud, a
         menos que la última enviada haya sido negada. No puedes enviar solicitudes si
         ya te aceptaron una.

                                         ¡ÉXITO!
                    </pre>
                </div>

                <div class="espacio" style="height:90px"></div>
            </div>

            <div id="footer">
                <p>Copyright © CHANGE Gate</p>
            </div>

        </div>

    </body>
</html>