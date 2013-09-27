<%-- 
    Document    : mostrarCupoC
    Author      : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>
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
                    <a style="border-bottom: none;" ><a href="javascript:unhide('modifCupos');" class="menuitem">Modificar los Cupos de la Carrera</a></a>
                    <a style="border-bottom: none;" ><a href="javascript:unhide('verCupos');" class="menuitem">Ver Cupos Disponibles por Carrera</a></a>
                    <a style="border-bottom: none;" ><a href="index.jsp" class="menuitem">Salir</a></a>
                </div>
            </div>

            <div id="sidebarR" style="width:150px; height: 250px;">
                <br>        
                <div>
                    <a href="http://www.usb.ve/"><img width="150" height="50" src="images/somosusb.gif"></a>
                </div>
            </div>

            <div style="width:760px;margin-left:auto;margin-right:auto;">

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

                            

                            <s:submit value="Aceptar" />
                        </s:form>

                        <center>
                        <table class="bordt" border="1">
                        <form name="fom" method="post">
                           <tr>
                           <center><td class="bord">Cohorte</td> </center>
                           <center><td class="bord">Cupos</td></center>
                           </tr>
                            <%
                            List l = (List) request.getAttribute("disp2");
                            if (l != null) {
                                
                                Iterator it = l.iterator();

                                while (it.hasNext()) {
                                    clases.Cohorte b = (clases.Cohorte) it.next();
                                    String cuposCo = b.getCupos();
                                    String NumCo = b.getCohorte();
                            %>
                            <tr> 
                            <center><td class="bord"><%= NumCo%></td></center>
                            <center><td class="bord"><%= cuposCo%></td></center>
            
                            </tr> 
                            <%
                            }
                            }
                            %>  
                        </form>
                        </table>
                        </center>
                    </div>
                </div>

                <div class="espacio" style="height:90px"></div>
            </div>

            <div>
                <div id="footer">
                    <p>Copyright © CHANGE Gate</p>
                </div>
            </div>

        </div>
    </body>
</html>