<%-- 
    Document   : agregar_plantillas
    Author     : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>

<html>

    <head>
        <link href="css/bootstrap.css" rel="stylesheet"> 
        <link href="css/bootstrap-transfer.css" rel="stylesheet">        
        <script src="javascripts/bootstrap-transfer.js"></script>
        <style>
            .footer{
                position: static;
                bottom: auto; 
            } 

        </style>
        <script type="text/javascript">

            var t;
            input = [];

            <%
               List l = (List) request.getAttribute("lista_materias");
               Iterator it = l.iterator();

               while (it.hasNext()) {
                   clases.Asignatura materia = (clases.Asignatura) it.next();
                   String codigo = materia.getCodigoS();
                   String nombre = materia.getNombre();
            %>

            input.push({value: "<%=codigo%>", content: "<%=codigo%> - <%=nombre%>"});
            
            <%
               }
               
            %>

            $(function() {
                t = $('#test').bootstrapTransfer(
                        {'target_id': 'multi-select-input',
                            'height': '15em',
                            'hilite_selection': true});

                t.populate(input);
                //t.set_values(["2", "4"]);

            });

            function selectAllOptions() {
                console.log("help");
                var materias = t.get_values();
                document.fom.action = "GuardarPlan.action?lista=" + materias;
                document.fom.submit();
            }

            function salir() {
                document.fom.action = "GestionPlantillas.action";
                document.fom.submit();
            }
        </script>
    </head>

    <body>
    <center><h4>Nuevo Plan de Estudio</h4></center><br>
        <p align="justify">Seleccione las asignaturas que desee recomendarle a 
            <%=session.getAttribute("rec_nombre")%> (<%=session.getAttribute("rec_usbid")%>) 
            proveniente de <%=session.getAttribute("rec_cOrigen")%>.
        </p><br/>
      <s:if test="hasActionErrors()">
            <div class="denyDiv">
                <s:iterator value="actionErrors">
                    <span class="denyMsg" style="font-size:13px"><s:property escape="false" />
                    </span>
                </s:iterator>
            </div>
            <br />
        </s:if>
    <center><div id="test" name="listas"></div></center>
    <br/>
    <form name="fom" method="post">
        <div align="right">
            <input type="button" onclick="goBack()" value="<- Anterior">
            <input type="submit" onclick="selectAllOptions();" value="Siguiente ->">
        </div>
    </form>
</body>
</html>