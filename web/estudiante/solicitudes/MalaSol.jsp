<%-- 
    Document   : MalaSol
    Created on : 31/05/2013, 07:37:56 AM
    Author     : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style type="text/css">
    <!--
    .hidden{display:none;}
    .shown{display:in-line;}
    -->
</style>
<link rel="stylesheet" type="text/css" href="/Sistema_de_Cambios_de_Carrera/css/estilo.css">

<html lang="en-US">
    <title>Sistema de Cambios de Carrera</title>
    <body>  
        <div id="body-content">
            <div>
                <div>
                    <img id="banner" src="/Sistema_de_Cambios_de_Carrera/images/bannerdisfuminado.png" alt="usb">
                </div>
            </div>
            <div id="sidebarL">
                <script type="text/javascript">
                    function unhide(divID) {
                        var item = document.getElementById(divID);
                        var otros = document.getElementsByTagName('div');
                        var group;
                        if (otros) {
                            for (var i = 0; i < otros.length; i++) {
                                group = otros[i].getAttribute('alt');
                                if (group == "especial") {
                                    otros[i].className = 'hidden';
                                }
                            }
                        }
                        if (item) {
                            item.className = 'unhidden';
                        }
                    }
                </script>
                <div class="glossymenu" style="width: 190px">
                    <a style="border-bottom: none;" ><a href="javascript:unhide('loginDiv');" class="menuitem">Home</a></a>
                    <a style="border-bottom: none;" ><a href="javascript:unhide('listarSol');" class="menuitem">Ver Solicitudes de Cambio de Carrera Enviadas</a></a>
                    <a style="border-bottom: none;" ><a href="javascript:unhide('solicitud');" class="menuitem">Solicitar Cambio de Carrera</a></a>
                    <a style="border-bottom: none;" ><a href="javascript:unhide('verCupos');" class="menuitem">Ver Cupos Disponibles por Carrera</a></a>
                    <a style="border-bottom: none;" ><a href="/Sistema_de_Cambios_de_Carrera/index.jsp" class="menuitem">Salir</a></a>
                </div>
            </div>

            <div id="sidebarR" style="width:150px; height: 250px;">
                <br>        
                <div>
                    <a href="http://www.usb.ve/"><img width="150" height="50" src="/Sistema_de_Cambios_de_Carrera/images/somosusb.gif"></a>
                </div>
                <br>
            </div>

            <div style="width:760px;margin-left:auto;margin-right:auto;">

                <div id="loginDiv" alt="especial">
                    <h4>Tu solicitud no fue enviada porque</h4>
                    <h4> ya enviaste una, looser.</h4>
                    <br /><br />
                </div>

                <div id="solicitud" class="hidden" alt="especial">
                    <div id="login-form">
                        <s:form action="verificarSol" >
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
                                      'Ingeniería de Mantenimiento', 
                                      'Ingeniería de Telecomunicaciones',
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
                            <s:submit value="Continuar" onclick="unhide('solicitud')"/>
                        </s:form>
                    </div>
                </div>


                <div id="listarSol" class="hidden" alt="especial">


                    <br /><br />
                    <center><strong><s:property value="mensaje" /></strong> <br /><br /></center>


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
                                      'Ingenieria de Mantenimiento', 
                                      'Ingenieria de Telecomunicaciones',
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

            <div>
                <div id="footer">
                    <p>Copyright © DyCicle Systems</p>
                </div>
            </div>

        </div>
    </body>
</html>
