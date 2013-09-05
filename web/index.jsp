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
<style type="text/css">
    .errors {
        font-size: medium;
        font: bold 90%;
        text-align: center;
        color: #FE2E2E;      
    }
</style>
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
                <!--                <style>
                
                                    /* First Level UL List */
                                    #accordion {
                                        margin:0;
                                        padding:0;	
                                        list-style:none;
                                    }
                
                                    #accordion li {
                                        width:267px;
                                    }
                
                                    #accordion li a {
                                        display: block;
                                        width: 268px;
                                        height: 43px;	
                                        text-indent:-999em;
                                        outline:none;
                                    }
                
                                    /* Using CSS Sprite for menu item */
                                    #accordion li a.popular {
                                        background:url(menu.jpg) no-repeat 0 0;	
                                    }
                
                                    #accordion li a.popular:hover, .popularOver {
                                        background:url(menu.jpg) no-repeat -268px 0 !important;	
                                    }
                
                                    #accordion li a.category {
                                        background:url(menu.jpg) no-repeat 0 -43px;	
                                    }
                
                                    #accordion li a.category:hover, .categoryOver {
                                        background:url(menu.jpg) no-repeat -268px -43px !important;	
                                    }
                
                                    #accordion li a.comment {
                                        background:url(menu.jpg) no-repeat 0 -86px;	
                                    }
                
                                    #accordion li a.comment:hover, .commentOver {
                                        background:url(menu.jpg) no-repeat -268px -86px !important;	
                                    }
                
                
                                    /* Second Level UL List*/
                                    #accordion ul {
                                        background:url(bg.gif) repeat-y 0 0;
                                        width:268px;
                                        margin:0;
                                        padding:0;
                                        display:none;	
                                    }
                
                                    #accordion ul li {
                                        height:30px;
                                    }
                
                                    /* styling of submenu item */
                                    #accordion ul li a {
                                        width:240px;
                                        height:25px;
                                        margin-left:15px;
                                        padding-top:5px;
                                        border-bottom: 1px dotted #777;
                                        text-indent:0;
                                        color:#ccc;
                                        text-decoration:none;
                                    }
                
                                    /* remove border bottom of the last item */
                                    #accordion ul li a.last {
                                        border-bottom: none;
                                    }		
                
                                </style> -->

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

//                    $(document).ready(function() {
//
//                        $('#accordion a.item').click(function() {
//                            /* FIRST SECTION */
//
//                            //slideup or hide all the Submenu
//                            $('#accordion li').children('ul').slideUp('fast');
//
//                            //remove all the "Over" class, so that the arrow reset to default
//                            $('#accordion a.item').each(function() {
//                                if ($(this).attr('rel') != '') {
//                                    $(this).removeClass($(this).attr('rel') + 'Over');
//                                }
//                            });
//
//                            /* SECOND SECTION */
//
//                            //show the selected submenu
//                            $(this).siblings('ul').slideDown('fast');
//
//                            //add "Over" class, so that the arrow pointing down
//                            $(this).addClass($(this).attr('rel') + 'Over');
//
//                            return false;
//                        });
//
//                    });
                </script>

                <div class="glossymenu" style="width: 190px">
                    <a style="border-bottom: none;" ><a href="javascript:unhide('loginDiv');" class="menuitem">Login</a></a>
                    <a style="border-bottom: none;" ><a href="javascript:unhide('normasGenerales');" class="menuitem">Normas Generales para el Cambio de Carrera</a></a>
                    <a style="border-bottom: none;" ><a href="http://topacio.cenda.usb.ve/reglamentos/ver/236" target="_blank" class="menuitem">Reglamento USB sobre los Cambios de Carrera</a></a>
                </div>

                <!--                <ul id="accordion">
                                    <li>
                                        <a href="#" class="popular" rel="popular">Popular Post</a>
                                        <ul>
                                            <li><a href="#">Popular Post 1</a></li>
                                            <li><a href="#">Popular Post 2</a></li>
                                            <li><a href="#" class="last">Popular Post 3</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#" class="category" rel="category">Category</a>
                                        <ul>
                                            <li><a href="#">Category 1</a></li>
                                            <li><a href="#">Category 2</a></li>
                                            <li><a href="#" class="last">Category 3</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#" class="comment" rel="comment">Recent Comment</a>
                                        <ul>
                                            <li><a href="#">Comment 1</a></li>
                                            <li><a href="#">Comment 2</a></li>
                                            <li><a href="#" class="last">Comment 3</a></li>
                                        </ul>
                                    </li>
                                </ul>-->

            </div>

            <div id="sidebarR" style="width:150px; height: 250px;">
                <br>        
                <div>
                    <a href="http://www.usb.ve/" target="_blank"><img width="150" height="50" src="/Sistema_de_Cambios_de_Carrera/images/somosusb.gif"></a>
                </div>
                <br>
            </div>

            <div style="width:760px;margin-left:auto;margin-right:auto;">

                <div id="loginDiv" alt="especial">
                    <h4>Bienvenido</h4>
                    <h5>Para ingresar al sistema introduzca su usuario y contraseña.</h5>

                    <s:if test="hasActionErrors()">
                        <div class="errors">

                            <s:actionerror />
                        </div>
                    </s:if>
                    <div id="login-form">

                        <s:form action="Login">
                            <s:textfield name="usbid" label="User Name" />
                            <s:password name="contrasena" label="Password" />
                            <s:submit value="Login" />
                        </s:form>
                        <form action="buscarEst">
                            <table style="border: none">
                                <tr style="border: none">
                                    <td style="border: none">USBid</td>
                                    <td style="border: none"><input title="Introduzca su USBid" type="text" name="usbid" maxlength="8" size="14" placeholder="XX-XXXXX"></td>
                                </tr>
                                <tr style="border: none">
                                    <td style="border: none" colspan="2"></td>
                                </tr>
                                <tr style="border: none">
                                    <td style="border: none">Contraseña</td>
                                    <td style="border: none"><input title="Introduzca su contraseña" type="password" name="contrasena" size="14" placeholder="******"></td>
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

                <div id="normasGenerales" class="hidden" alt="especial">
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