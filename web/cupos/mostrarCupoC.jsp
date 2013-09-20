<%-- 
    Document    : mostrarCupoC
    Created on  : 14/09/2013, 05:09:42 PM
    Modified on : $
    Author      : CHANGE Gate
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
                    <a style="border-bottom: none;" ><a href="javascript:unhide('modifCupos');" class="menuitem">Modificar los Cupos de la Carrera</a></a>
                    <a style="border-bottom: none;" ><a href="javascript:unhide('success');" class="menuitem">Ver Cupos Disponibles por Carrera</a></a>
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

                <div id="loginDiv" class="hidden" alt="especial">
                    <h4>Hola, <%=session.getAttribute("nombre")%></h4>
                    <br /><br />
                </div>

                <div id="modifCupos" class="hidden" alt="especial">
                    <div id="login-form"><br><br><br>
                        <s:form action="ModificarCup">
                            Indique la cantidad de cupos disponible que desea que tenga su carrera:
                            <input type="text" name="cantCupos" size="15" />
                            <br>
                            <s:textfield key="cohorte" name="cohorte"/>
                            <s:submit value="Aceptar" />
                        </s:form>
                    </div>
                </div>

                <div id="success" alt="especial">
                    <div id="login-form">
                        <br><br><br>
                        <s:form action="solicitudCupos">
                            Seleccione la carrera de la cual desea saber la cantidad de cupos:
                          
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
                            
                            <br />
                            
                            <s:textfield key="cohorte" name="cohorte"/>

                            <s:submit value="Aceptar" />
                        </s:form>

                        <center>
                            Cantidad de cupos: <strong><%=request.getAttribute("cupos")%></strong>
                        </center>
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