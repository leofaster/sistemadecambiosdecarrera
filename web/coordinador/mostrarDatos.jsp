<%-- 
    Document    : indexCoordinador
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
                    <a style="border-bottom: none;" ><a href="javascript:unhide('modifCupos');" class="menuitem">Modificar los Cupos de la Carrera</a></a>
                    <a style="border-bottom: none;" ><a href="javascript:unhide('verCupos');" class="menuitem">Ver Cupos Disponibles por Carrera</a></a>
                    <a style="border-bottom: none;" ><a href="javascript:unhide('SolP');" class="menuitem">Gestionar solicitudes</a></a>
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

                <div id="loginDiv" alt="especial">
                    <h4>Hola, <%=session.getAttribute("nombre")%></h4>
                    <table>
                        <tr>
                        <td>
                        <s:form action="Aprobar">
                        <center>    <s:submit  value="Aceptar solicitud" type="button"/></center>
                        </s:form>
                       </td>
                       <td>
                        <s:form action="Denegar">
                            <center><s:submit  value="Negar solicitud" type="button"/></center>
                        </s:form>
                        <td>
                        </tr>
                    </table>
                </div>
                
                <div id="SolP" class="hidden" alt="especial">
                    <div id="login-form"><br><br><br>
                        Seleccione la opción deseada:
                        <br><br>
                        <table>
                        <tr>
                        <td>
                        <s:form action="SolPen">
                        <center>    <s:submit  value="Gestionar solicitudes pendientes" type="button"/></center>
                        </s:form>
                       </td>
                       <td>
                        <s:form action="SolApRep">
                            <center><s:submit  value="Ver las solicitudes ya gestionadas" type="button"/></center>
                        </s:form>
                        <td>
                        </tr>
                        </table>
                        
                   </div>
                </div>
                
                
                <div id="modifCupos" class="hidden" alt="especial">
                    <div id="login-form"><br><br><br>
                        <s:form action="ModificarCup">
                            <center>Coordinador, coloque la cohorte y cantidad de cupos deseados</center>
                            
                        <%--   <table border="1">
                                
                                <tr>
                                    <td>Cohorte</td>
                                    <td><input type="text" name="cohorte" size="15" maxlength="4"/></td>
                                    
                                </tr>
                                <tr>
                                <td>Cantidad de cupos</td>
                                <td><input type="text" name="cantCupos" size="15" maxlength="3"/> </td>
                                </tr>
                                
                                
                            </table></> --%>
                            <s:textfield label="Cohorte" type="text" name="cohorte" maxlength="4" size="15"/>
                                    <s:textfield type="text" label="Cantidad de Cupos" name="cantCupos" maxlength="3" size="15" /> 
                                
                            
                            
                            <s:submit value="Aceptar" />
                        </s:form>
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
                            <br />
                            
                            <br />
                            <s:submit value="Aceptar" />
                        </s:form>
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