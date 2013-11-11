<%--
    Document    : index
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
                    <a style="border-bottom: none;" ><a href="javascript:unhide('loginDiv');" class="menuitem">Login</a></a>
                    <a style="border-bottom: none;" ><a href="javascript:unhide('normasGenerales');" class="menuitem">Normas Generales para el Cambio de Carrera</a></a>
                    <a style="border-bottom: none;" ><a href="http://topacio.cenda.usb.ve/reglamentos/ver/236" target="_blank" class="menuitem">Reglamento USB sobre los Cambios de Carrera</a></a>
                </div>

            </div>

            <div id="sidebarR" style="width:150px; height: 250px;">
                <br>
                <div>
                    <a href="http://www.usb.ve/" target="_blank"><img width="150" height="50" src="images/somosusb.gif"></a>
                </div>
            </div>

            <div style="width:760px;margin-left:auto;margin-right:auto;">

                <div id="loginDiv" alt="especial">
                    <h4>Bienvenido</h4>
                    <h5>Para ingresar al sistema introduzca su usuario y contraseña.</h5>

                    <s:if test="hasActionErrors()">
                        <div id="errores">

                            <s:actionerror />
                        </div>
                    </s:if>

                    <div id="login-form">
                        <s:form action="Login">
                            <table style="border: none">
                                <tr style="border: none">
                                    <td style="border: none"><s:textfield label="Introduzca su USBid" type="text" name="usbid" maxlength="20" size="14" /></td>
                                </tr>
                                <tr style="border: none">
                                    <td style="border: none" colspan="2"></td>
                                </tr>
                                <tr style="border: none">
                                    <td style="border: none"><s:password label="Introduzca su contraseña" type="password" name="contrasena" size="14" /></td>
                                </tr>
                                <tr style="border: none">
                                    <td style="border: none" colspan="2"></td>
                                </tr>
                            </table>
                            <br><br>
                            <s:submit value="Entrar" />
                        </s:form>
                    </div>

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

            <div id="footer">
                <p>Copyright © CHANGE Gate</p>
            </div>

        </div>

    </body>
</html>