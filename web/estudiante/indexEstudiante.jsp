<%-- 
    Document    : indexEstudiante
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
                    <a style="border-bottom: none;" ><a href="<s:url action="ListarSol"/>" class="menuitem">Ver Solicitudes de Cambio de Carrera Enviadas</a></a>
                    <a style="border-bottom: none;" ><a href="javascript:unhide('solicitud');" class="menuitem">Solicitar Cambio de Carrera</a></a>
                    <a style="border-bottom: none;" ><a href="javascript:unhide('verCupos');" class="menuitem">Ver Cupos Disponibles por Carrera</a></a>
                    <a style="border-bottom: none;" ><a href="index.jsp" class="menuitem">Salir</a></a>
                </div>
            </div>

            <div id="sidebarR" style="width:150px; height: 250px;">
                <br>        
                    <a href="http://www.usb.ve/"><img width="150" height="50" src="images/somosusb.gif"></a>
                </div>
            </div>

            <div style="width:760px;margin-left:auto;margin-right:auto;">

                <div id="loginDiv" alt="especial">
                    <h4>Hola, <%=session.getAttribute("nombre")%></h4>
                </div>

                <div id="solicitud" class="hidden" alt="especial">
                    <div id="login-form">
                        <s:form action="verificarSol" name="entrar">
                            <br /><br />
                            Carnet: <strong><%=session.getAttribute("usbid")%></strong> <br /><br />
                            Cédula: <strong><%=session.getAttribute("cedula")%></strong> <br /><br />
                            Nombre: <strong><%=session.getAttribute("nombre")%></strong> <br /><br />
                            Apellido: <strong><%=session.getAttribute("apellido")%></strong> <br /><br />
                            <s:select name="carrera_dest" label="Carrera Deseada" required="true"
                                      list="{'0100 - Ingeniería Eléctrica', 
                                      '0200 - Ingeniería Mecánica', 
                                      '0300 - Ingeniería Química', 
                                      '0600 - Ingeniería Electrónica', 
                                      '0800 - Ingeniería de la Computación',
                                      '1200 - Ingeniería Geofísica',
                                      '1500 - Ingeniería de Materiales', 
                                      '1700 - Ingeniería de Producción',
                                      '0400 - Licenciatura en Química',
                                      '0500 - Licenciatura en Matemáticas',
                                      '1000 - Licenciatura en Física',
                                      '1900 - Licenciatura en Biología',
                                      '0700 - Arquitectura',
                                      '1100 - Urbanismo',
                                      '3200 - Licenciatura en Comercio Internacional',
                                      '3000 - Licenciatura en Gestión de la Hospitalidad'}"
                                      headerKey="-1" headerValue="Seleccionar carrera..."/>
                            <s:textarea name="motivacion" cols="25" rows="4"
                                        label="Motivacion para el cambio" required="true"/>
                        </s:form>
                        <input type="button" onclick="mostrarVentana();" value="Enviar">
                    </div>
                </div>

                <div id="verCupos" class="hidden" alt="especial">
                    <div id="login-form">
                        <br><br><br>
                        <s:form action="solicitudCupos">
                            Seleccione la carrera de la cual desea saber la cantidad de cupos:
                            <br /><br />
                            <s:select name="carrera"  required="true"
                                      list="{'0100 - Ingenieria Electrica', 
                                      '0200 - Ingenieria Mecanica', 
                                      '0300 - Ingenieria Quimica', 
                                      '0600 - Ingenieria Electronica', 
                                      '0800 - Ingenieria de la Computacion',
                                      '1200 - Ingenieria Geofisica',
                                      '1500 - Ingenieria de Materiales', 
                                      '1700 - Ingenieria de Produccion',
                                      '0400 - Licenciatura en Quimica',
                                      '0500 - Licenciatura en Matematicas',
                                      '1000 - Licenciatura en Fisica',
                                      '1900 - Licenciatura en Biologia',
                                      '0700 - Arquitectura',
                                      '1100 - Urbanismo',
                                      '3200 - Licenciatura en Comercio Internacional',
                                      '3000 - Licenciatura en Gestión de la Hospitalidad'}"
                                      headerKey="-1" headerValue="Seleccionar carrera..."/>
                            <s:submit value="Aceptar" />
                        </s:form>
                    </div>
                </div>


                <div class="espacio" style="height:90px"></div>
            </div>

            <div id="footer">
                <p>Copyright © CHANGE Gate</p>
            </div>

        </div>

        <div id="miVentana" style="position: fixed; width: 350px; height: 190px; top: 0; left: 0; font-family:Verdana, Arial, Helvetica, sans-serif; font-size: 12px; font-weight: normal; border: #333333 3px solid; background-color: #FAFAFA; color: #000000; display:none;">
            <div style="font-weight: bold; text-align: left; color: #FFFFFF; padding: 5px; background-color:#006394">Confirmación de envío de solicitud de cambio de carrera</div>
            <p style="padding: 5px; text-align: justify; line-height:normal">Presionando "Aceptar" estás de acuerdo con enviar esta solicitud para que sea evaluada bajo los criterios específicos de la coordinación seleccionada. Recibirás la respuesta a tu solicitud en el correo asociado a tu USBid.</p>
            <div style="padding: 10px; background-color: #F0F0F0; text-align: center; margin-top: 44px;">
                <input id="btnAceptar" onclick="confirmar();" name="btnAceptar" size="20" type="button" value="Aceptar" />
                <input id="btnAceptar" onclick="ocultarVentana();" name="btnAceptar" size="20" type="button" value="Cancelar" />
            </div>
        </div>
    </body>
</html>