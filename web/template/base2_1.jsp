<%-- 
<<<<<<< HEAD
    Document   : Base2_1 Hecho para crear plantillas
=======
    Document   : base2
>>>>>>> c384fcdcf3fd593ffe3df94644ef02d4fa3958d6
    Created on : Nov 4, 2013, 6:04:01 PM
    Author     : CHANGE Gate 
--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>    
    <head>
<<<<<<< HEAD
            <meta http-equiv="X-UA-Compatible" content="IE-edge">
=======
>>>>>>> c384fcdcf3fd593ffe3df94644ef02d4fa3958d6
        <script language="javascript" type="text/javascript" src="javascripts/funciones.js"></script>
        <script src="javascripts/jquery.js"></script>
        <script src="javascripts/bootstrap-transfer.js"></script>
        <script src="javascripts/bootstrap.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.9.1.js"></script>
        <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <link rel="stylesheet" type="text/css" href="stylesheets/bootstrap.css">
<<<<<<< HEAD
        <link rel="stylesheet" type="text/css" href="stylesheets/bootstrap-responsive.css">
        <link rel="stylesheet" type="text/css" href="stylesheets/estilo.css">
        <!--<link rel="stylesheet" type="text/css" href="stylesheets/estructura2.css">-->

=======
        <link rel="stylesheet" type="text/css" href="stylesheets/estilo.css">
        <link rel="stylesheet" type="text/css" href="stylesheets/estructura2.css">
>>>>>>> c384fcdcf3fd593ffe3df94644ef02d4fa3958d6
        <title>
            <tiles:insertAttribute name="title" ignore="true" />
        </title>
    </head>
    <body>
<<<<<<< HEAD
  <div class="row">
                    <div class="span9">
                        <div id="header">
                            <tiles:insertAttribute name="header" />
                        </div>
                    </div>
                </div>
                        
                        
                        
<div class="container-fluid">
    <div class="row-fluid show-grid">
        <div class="span2">
            <!--Sidebar content-->
            <tiles:insertAttribute name="menu" />
        </div>
        <div class="span10">
            <!--Body content-->
            <tiles:insertAttribute name="body"/>

        </div>
    </div>
</div> 

<div class="row">
    <div class=" span9">
        <tiles:insertAttribute name="footer" />
    </div>
</div>  
        
        
              

              

           
         
       
    </body>

<div class="container">
    
   <div class="row">
  <div class="span4">...</div>
  <div class="span8">...</div>
</div>
</div>
</html>
=======
        <div id="pagewrap" class="container">

            <div id="header" class="row">
                <tiles:insertAttribute name="header" />
            </div>
            
            <div class="row">
                <div class="menu col-md-3 col-xs-12">
                    <tiles:insertAttribute name="menu" />
                </div>

                <div class="content col-md-6 col-xs-12">
                    <tiles:insertAttribute name="body" />
                </div>
            </div>

            <div class="footer row">
                <tiles:insertAttribute name="footer" />
            </div>

        </div>
    </body>
</html>
>>>>>>> c384fcdcf3fd593ffe3df94644ef02d4fa3958d6
