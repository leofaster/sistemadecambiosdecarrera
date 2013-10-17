<%-- 
    Document    : mostrarCupo
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
                    <a style="border-bottom: none;" ><a href="<s:url action="ListarSol"/>" class="menuitem">Ver Solicitudes de Cambio de Carrera Enviadas</a></a>
                    <a style="border-bottom: none;" ><a href="<s:url action="verificarReq"/>" class="menuitem">Solicitar Cambio de Carrera</a></a>
                    <a style="border-bottom: none;" ><a href="javascript:unhide('success');" class="menuitem">Ver Cupos Disponibles por Carrera</a></a>
                    
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
                
                
                
                <div id="success" alt="especial">
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
                            
                            <s:submit value="Aceptar" />
                        </s:form>

                        <center>
                         <table class="bordt" border="1">
                        <form name="fom" method="post">
                           <tr>
                           <center><td class="bord">Cohorte</td> </center>
                           <center><td class="bord">Cupos</td></center>
                           <center><td class="bord">Activos</td></center>
                           </tr>
                            <%
                            List l = (List) request.getAttribute("disp2");
                            if (l != null) {
                                
                                Iterator it = l.iterator();

                                while (it.hasNext()) {
                                    clases.Cohorte b = (clases.Cohorte) it.next();
                                    String cuposCo = b.getCupos();
                                    String NumCo = b.getCohorte();
                                    String cuposA=b.getCuposa();
                            %>
                            <tr> 
                            <center><td class="bord"><%= NumCo%></td></center>
                            <center><td class="bord"><%= cuposCo%></td></center>
                            <center><td class="bord"><%= cuposA%></td></center>
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
