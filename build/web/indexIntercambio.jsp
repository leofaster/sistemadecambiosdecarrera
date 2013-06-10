<%-- 
    Document    : indexIntercambio
    Created on  : 09/06/2013, 06:30:38 PM
    Modified on : $
    Author      : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="css/estilo.css">

<html lang="en-US">
    <title>Sistema de Cambios de Carrera</title>
    <body>  
        <div id="body-content">
            <div>
                <div>
                    <img id="banner" src="index/images/prueba2.png" alt="usb">
                </div>
            </div>
            <div id="sidebarL">
                <script type="text/javascript">
                     function unhide(divID) {
                       var item = document.getElementById(divID);
                       var otros = document.getElementsByTagName('div');
                       if(otros){
                           for(var i=0;i<otros.length;i++){
                               if(otros[i].title == 'especial'){
                                   otros[i].className = 'hidden'
                               }
                           }
                       }
                       if (item) {
                           item.className='unhidden';
                       }
                    }
                </script>
                <div class="glossymenu" style="width: 190px">
                    <a style="border-bottom: none;" ><a href="javascript:unhide('loginDiv');" class="menuitem">Login</a></a>
                    <a style="border-bottom: none;" ><a href="javascript:unhide('normasGenerales');" class="menuitem">Normas Generales para el Cambio de Carrera</a></a>
                    <a style="border-bottom: none;" ><a href="http://www.cenda.usb.ve/reglamentos/ver/236" class="menuitem">Reglamento USB sobre los Cambios de Carrera</a></a>
                </div>
            </div>

            <div id="sidebarR" style="width:150px; height: 250px;">
                <br>        
                <div>
                    <a href="http://www.usb.ve/"><img width="150" height="50" src="index/images/somosusb.gif"></a>
                </div>
                <br>
            </div>

            <div style="width:760px;margin-left:auto;margin-right:auto;">
                
                <div id="loginDiv" title="especial">
                    <h4>Bienvenido</h4>
                    <h5>Para ingresar al sistema introduzca su usuario y contraseña.</h5>
                    <div id="login-form">
                        <form action="buscarEst">
                            <table style="border: none">
                                <tr style="border: none">
                                    <td style="border: none">USBid</td>
                                    <td style="border: none"><input type="text" name="usbido" maxlength="8" size="14"></td>
                                </tr>
                                <tr style="border: none">
                                    <td style="border: none" colspan="2"></td>
                                </tr>
                                <tr style="border: none">
                                    <td style="border: none">Contraseña</td>
                                    <td style="border: none"><input type="password" name="password" size="14"></td>
                                </tr>
                                <tr style="border: none">
                                    <td style="border: none" colspan="2"></td>
                                </tr>
                            </table>
                            <br><br>
                            <input type="submit" value="Entrar">   
                        </form>
                        <!--<a href="/Intercambio-II/reccontra.do;jsessionid=335112095AD26CB34CAB224F730DD697">¿Olvid&oacute; su contraseña?</a><br />-->
                    </div>
                    <br /><br />
                </div>
    
                <div id="normasGenerales" class="hidden" title="especial">
                    <pre>
            <h2>
                Normas Generales para el Cambio de Carrera:</h2>
        1. Los estudiantes regulares de la Universidad Simón Bolívar, podrán aspirar a
        realizar un solo cambio de carrera durante sus estudios universitarios, siempre
        y cuando hayan cumplido con los requisitos de admisión y mantengan las
        condiciones mínimas establecidas en el régimen académico.

        2. Las presentes normas no se aplicarán a los estudiantes que hayan ingresado a
        la Universidad Simón Bolívar por el régimen de equivalencias o traslados.

        3. Podrán aspirar a cambiarse de carrera los estudiantes que cumplan con los 
        siguientes requisitos:

            - Que hayan ingresado a la Universidad a través del examen de admisión. 

            - Que se encuentren cursando su segundo o tercer año de permanencia con 
            respecto al año de ingreso de su cohorte, y 

            - Que hayan aprobado todas las asignaturas de los primeros tres (3) períodos
            académicos. Cada Coordinación de Estudios podrá fijar requisitos específicos
            de ingreso de acuerdo a las características propias de cada carrera. 

        4. Las solicitudes de cambio de carrera podrán realizarse en las respectivas 
        Coordinaciones de Estudios durante los tres (3) trimestres del año académico. 

        5. Cada Coordinación de Estudios podrá fijar requisitos específicos de ingreso de
        acuerdo a las características propias de cada carrera. 

        6. Los estudiantes que cumplan con los requisitos establecidos, que se encuentren 
        interesados en cambiarse de carrera, previa entrevista con el orientador y el
        Coordinador de la carrera a la cual aspiren cambiarse, deberán introducir su 
        solicitud de cambio de carrera, debidamente acompañada de los recaudos 
        requeridos, en la Coordinación de Estudio de la Carrera a la cual desean
        ingresar, durante la quinta semana del trimestre.

        7. La selección se realizará en base a los méritos académicos de los aspirantes y 
        en base al cupo disponible de cada carrera, el cual será fijado por la 
        Coordinación de Estudios correspondiente. Se considerarán entre otros, el
        índice académico acumulado, el rendimiento del estudiante en asignaturas 
        propias de la carrera así como las asignaturas aprobadas, reprobadas y 
        retiradas que presente al aspirante en su expediente. 

        8. La respuesta sobre el cambio de carrera se le dará al estudiante interesado en
        un máximo de dos trimestres.

        9. Las solicitudes serán procesadas -aprobadas o rechazadas- trimestralmente, por
        el Consejo Asesor del Decanato de Estudios Profesionales, el cuál notificará a la 
        Dirección de Admisión y Control de Estudios, con copia a cada Coordinación,
        acerca de los cambios de carrera que hayan sido aprobados. 

        10.El Decanato de Estudios Profesionales resolverá los casos dudosos o no 
        previstos.
                    </pre>
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