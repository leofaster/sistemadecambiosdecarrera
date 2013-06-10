<%-- 
    Document    : index
    Created on  : 06/06/2013, 12:36:08 PM
    Modified on : $
    Author      : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <SCRIPT language="javascript">
        var seleccion;
    	seleccion="carnet";	
        	
        function dispararAccionTai() {
            if(validarTai()){
                document.forms[0].action='./entrarTai.do';
                document.forms[0].submit();
            }
        }
        	
        function validarTai() {
            var errores = "Ocurrieron los siguientes errores:\n\n";
            var hayErrores = false;
            var valor = document.entrarForm["carnet"].value;
       			
            if(valor==""){  
                errores += "El campo cedula no puede ser vacio.\n";
                hayErrores = true;
            }else{
                if (isNaN(valor)) { 
                    errores += "El campo cedula tiene que ser numerico.\n";
                    hayErrores = true; 
                }
            }
       			
            if(hayErrores) {
                alert(errores);
                return false;
            }
            return true;
        }
        	
        function darValor(radio) {
            if (radio.checked==true){
                valorRadio=radio.value;
                seleccion=valorRadio;
            }
        }
			
        function cancelar() {
            document.entrarForm["carnet"].value="";
            document.entrarForm["valor"].value="";
        }
			
        function dispararAccion() {
            if(validar()){
                document.forms[0].action='./entrar.do';
                document.forms[0].submit();
            }
        }
        
        function validar() {
            var errores = "Ocurrieron los siguientes errores:\n\n";
            var hayErrores = false;
            var valor = document.entrarForm["carnet"].value;
            var tamaño = parseFloat(valor.length);
            var opcion = document.entrarForm["valor"].value;
            con=0;
            pos=0;

            if(document.entrarForm["valor"].value=="")     
            {
                errores += "Debe seleccionar el tipo de estudiante.\n";
                hayErrores = true;
            }

            if(seleccion=="carnet")     
            {  
                if(valor=="")     
                {  
                    errores += "El campo carnet no puede ser vacio.\n";
                    hayErrores = true;
                }

                if(tamaño<3)     
                {  
                    errores += "El campo carnet no puede ser menor de 3 caracteres.\n";
                    hayErrores = true;
                }
                    
                if(tamaño>8)     
                {  
                    errores += "El campo carnet no puede ser mayor de 8 caracteres.\n";
                    hayErrores = true;
                }
                
                for (i=0; i<=valor.length; i++){
                    if(valor[i]=="-"){
                        con=con+1;
                        pos=i;
                   }	
                }
                
                if(opcion==0){
                    if(con==0){
                        errores += "El formato de carnet es invalido.\n";
                        hayErrores = true;
                    }
                    if(con>1){
                        errores += "El formato de carnet es invalido.\n";
                        hayErrores = true;
                    }else{
                        if(pos!=2 && con!=0){
                            errores += "El formato de carnet es invalido.\n";
                            hayErrores = true;
                        }	
                    }
                }else{
                    if(opcion==1){
                        if(con>1){
                            errores += "El formato de carnet es invalido.\n";
                            hayErrores = true;
                        }else{
                            if(pos!=2 && con!=0){
                                errores += "El formato de carnet es invalido.\n";
                                hayErrores = true;
                            }	
                        }
                    }else{
                        if (isNaN(valor)) { 
                            errores += "El campo carnet tiene que ser numerico.\n";
                            hayErrores = true; 
                        }	
                    }
                }
            }else{
                if(valor=="")     
                {  
                    errores += "El campo cedula no puede ser vacio.\n";
                    hayErrores = true;
                }else{
                    if (isNaN(valor)) { 
                        errores += "El campo cedula tiene que ser numerico.\n";
                        hayErrores = true; 
                    }
                }
            }
            if(hayErrores)
            {
                alert(errores);
                return false;
            }
            return true;
        }

        function solo_numero(e) {
            if(seleccion=="carnet"){
                tecla = (document.all) ? e.keyCode : e.which;
                if (tecla==0 ||tecla==9||tecla==11||tecla==8||tecla==45){
                    return true;				 	
                }
                if(tecla==13){
                    if(dispararAccion()) 
                        return true;
                } 	
                patron =/[\d]/;
                tecla_final = String.fromCharCode(tecla);
                return patron.test(tecla_final);
            }else{
                tecla = (document.all) ? e.keyCode : e.which;
                if (tecla==0 ||tecla==9||tecla==11||tecla==8){
                    return true;				 	
                }
                if(tecla==13){
                    if(dispararAccion()) 
                        return true;
                } 	
                patron =/[\d]/;
                tecla_final = String.fromCharCode(tecla);
                return patron.test(tecla_final);
            }
        }
			
        function solo_numero_punto(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            if (tecla==0 || tecla==9||tecla==11||tecla==13) return true; 
            patron =/[\d\.]/;
            tecla_final = String.fromCharCode(tecla);
            return patron.test(tecla_final); 
        }
        
    </SCRIPT>
    
    <head>
        <meta http-equiv="pragma" content="no-cache"/>
        <meta http-equiv="cache-control" content="no-cache"/>
        <meta http-equiv="expires" content="-1"/>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <meta name="description" content="Sistema de Recarga de Saldo Comedor USB" />
        <link rel="stylesheet" type="text/css" href="index/css/style_screen.css" />
        <title>Sistema de Cambios de Carrera</title>
    </head>

    <body>
        <div class="page-container">
        <!-- HEADER -->
            
            <!-- Global Navigation -->
            <div class="nav-global-container">
                <div class="nav-global nav-global-font">
                    <ul>
                        <li><a class="nombre"></a></li>
                    </ul>
                </div>
            </div>

            <!-- Sitename and Banner -->
            <div class="site-name">
                Sistema de Cambios de Carrera
                <div class="site-slogan">
                    Universidad Sim&oacute;n Bol&iacute;var<br/>
                </div>
            </div>                 
            <div><img class="img-header" src="index/images/header.png" alt=""/></div>
            
            <!-- Main Navigation -->
            <div class="nav-main nav-main-font">      
            </div>
            <div class="buffer"></div>
            
            <!-- Contenido y barra lateral -->
            <div class="container-content-sidebar-front">            

                <!--   CONTENT -->
                <div class="content content-font">

                    <!-- Page title -->    
                    <div class="content-pagetitle"><h1 class="titulopag">P&aacute;gina de Inicio</h1></div>      
                      
                    <!-- Text container -->
                    <div class="contentbox-container">
                        <div class="contentbox-full">
                            <div class="contentbox-title-shading-small bg-blue04 box-on">&nbsp;</div>
                            <div class="contentbox-title-shading-small">Iniciar sesi&oacute;n</div>
                            <div class="contentbox-noshading">
                                <div style="width:100%; text-align: left;">
                                <br />
                                    <form action="buscarEst">
                                        <p>Bienvenido al Sistema de Cambios de Carrera. Por favor, introduzca sus datos para iniciar sesi&oacute;n:</p> <br/> 			
                                        <table border="1" class="forma"  style="margin-left: auto; margin-right: auto; ">
                                            <tr>
                                                <th>USBid:</th>
                                                <td><input type="text" name="usbido" maxlength="8" size="7"></td>
                                            </tr>
                                            <tr>
                                                <th>Contraseña:</th>
                                                <td><input type="password" name="password" size="7"></td>
                                            </tr>
                                            <tr>
                                                <th colspan="2"> 
                                                    <input type="submit" value="Entrar" />
                                                    <input type="button" onclick="javascript:cancelar()" value="Cancelar" />
                                                </th>
                                            </tr>
                                        </table> 
                                    </form>   
                                </div>
                            </div>
                        </div> <!-- Contentbox-full -->
                    </div> <!-- Contentbox -->

                <!-- Text container -->
                </div> <!-- END CONTENT -->

                <!-- SIDEBAR -->
                <div class="sidebar sidebar-font">
                </div> <!--  FIN DE SIDEBAR -->  
    
            <!-- FIN DEL CONTENIDO Y BARRA LATERAL -->
            </div>
  
            <!-- FOOTER -->
            <div class="footer footer-font">
                <p style="color:#0B3861"><b>Nota:</b> Si presenta algún inconveniente bla bla: Sartenejas 9063471 / Litoral 9069069.</p>
            </div>
        </div> <!-- FIN DE LA PAGINA -->
    </body>
    
</html>