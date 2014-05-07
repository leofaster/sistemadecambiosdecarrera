<%-- 
    Document   : agregar_plantillas
    Author     : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>

<html>


 
        <!--<link href="css/bootstrap.css" rel="stylesheet">--> 
        <link href="css/bootstrap-transfer.css" rel="stylesheet">        
        <script src="javascripts/bootstrap-transfer.js"></script>
 

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
                var nombre_plantilla = $("#nombrePlantilla").val();
                var materias = t.get_values();
                document.fom.action = "crearPlantilla.action?nombre="
                        + nombre_plantilla + "&lista=" + materias;
                document.fom.submit();
            }

            function salir() {
                document.fom.action = "GestionPlantillas.action";
                document.fom.submit();
            }
        </script>
  
    <h4>Creación de Plantilla</h4><br><br>

        <p align="justify">Seleccione las asignaturas que desee en la lista de la izquierda.<br/><br/>
            Puede usar la función de búsqueda si lo desea. Cuando seleccione una asignatura, 
            presione las flechas que se encuentran en el medio hasta incorporar todas
            las deseadas a la lista de la derecha.<br/><br/>
            No olvide colocarle un nombre a la plantilla.
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
        <center>
            <span><label for="nombrePlantilla">Nombre de la Plantilla *</label></span>
            <input id="nombrePlantilla" name="nombrePlantilla" type="text" placeholder="Ej: 'Plantilla Estandar'"/><br/>
            <br/>
            <input type="submit" value="Crear Plantilla" onClick="selectAllOptions();"/><br/>

            <input type="button" value="Cancelar" onClick="salir();"/>      
                        

        </center>
    </form>

