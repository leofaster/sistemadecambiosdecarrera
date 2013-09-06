<%-- 
    Document   : solicitudYModifCupos
    Created on : 30/07/2013, 03:43:11 PM
    Modified on : 08/08/2013 
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
<%--
<html>
    <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                
    </head>
    <body>
        <s:form action="ModificarCup">
            Indique la cantidad de cupos disponible que desea que tenga su carrera:
            <input type="text" name="cantCupos" size="15" />
            <br>
            <s:submit value="Aceptar" />
        </s:form>
        
    </body>
</html>
--%>


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
                    <h4>Hola, <%=session.getAttribute("nombre")%></h4>
                    <br /><br />
                </div>
                
                <div id="modifCupos" class="hidden" alt="especial">
                <div id="login-form">
                    <s:form action="ModificarCup">
                            Indique la cantidad de cupos disponible que desea que tenga su carrera:
                            <input type="text" name="cantCupos" size="15" />
                            <br>
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