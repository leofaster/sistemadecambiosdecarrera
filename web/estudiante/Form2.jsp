<%-- 
    Document    : indexIntercambio
    Created on  : 09/06/2013, 06:30:38 PM
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
<link rel="stylesheet" type="text/css" href="css/estilo.css">

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
                    <a style="border-bottom: none;" ><a href="/Sistema_de_Cambios_de_Carrera/cupos/solicitudCupos.jsp" class="menuitem">Consultar Cantidad de Cupos</a></a>
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
                    <h4>Hola, <%=request.getAttribute("nombre")%></h4>
                    <br /><br />
                </div>

                <div id="solicitud" class="hidden" alt="especial">
                    <div id="login-form">
                        <s:form action="verificarSol" >
                            <br /><br />
                            Carnet: <strong><s:property value="usbid" /></strong> 
                            <select name="usbidSol"  class="hidden">
                                <option value=<s:property value="usbid" />><s:property value="usbid" /></option>
                            </select>
                            <br /><br />
                            Cédula: <strong><%=request.getAttribute("cedula")%></strong> <br /><br />
                            Nombre: <strong><%=request.getAttribute("nombre")%></strong> <br /><br />
                            Apellido: <strong><%=request.getAttribute("apellido")%></strong> <br /><br />
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
                            <s:submit value="Continuar" />
                        </s:form>
                    </div>
                </div>


                <div id="listarSol" class="hidden" alt="especial">


                    <br /><br />
                    <center><strong><s:property value="mensaje" /></strong> <br /><br /></center>


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