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

        <script type="text/javascript">
 
           var t;
           input = [];
           defaultValues = [];
           
           <%
                List l = (List) request.getAttribute("lista_materias");
                Iterator it = l.iterator();
               
                while (it.hasNext()) {
                    clases.Asignatura materia = (clases.Asignatura) it.next();
                    String codigo = materia.getCodigoS();
                    String nombre = materia.getNombre();
                %>
                
                    input.push({value: "<%=codigo%>", content: "<%=codigo%> - <%=nombre%>"});
            
                <%}
                    
                l = (List) request.getAttribute("lista_materias_plantilla");
                it = l.iterator();
                
                while (it.hasNext()) {
                    clases.Asignatura materia = (clases.Asignatura) it.next();
                    String codigo = materia.getCodigoS();
                %>                
                    defaultValues.push("<%=codigo%>");
                <%}
            %>
                    
            $(function() {
                t = $('#test').bootstrapTransfer(
                        {'target_id': 'multi-select-input',
                            'height': '15em',
                            'hilite_selection': true});
            
                t.populate(input);
                t.set_values(defaultValues);
                
            });
    
            function selectAllOptions(val) {
                var nombre_plantilla = $("#nombrePlantilla").val();
                var materias = t.get_values();
                document.fom.action = "updatePlantilla.action?nombre=" 
                        + val + "&lista=" + materias + "&nombreNuevo=" + nombre_plantilla;
                document.fom.submit();
             }
             
            function salir() {
                document.fom.action = "GestionPlantillas.action";
                document.fom.submit();
             }
        </script>
    </head>
    
    <body>
        
        <p>Modificando la plantilla "<%=request.getAttribute("nombre")%>".</p><br/>
        <s:if test="hasActionErrors()">
            <div id="errores">
                <s:actionerror />
            </div>
        </s:if>
        <center><div id="test" name="listas"></div></center>
        <br/>
        
        <form name="fom" method="post">
            <center>
                <span><label for="nombrePlantilla">Nombre de la Plantilla *</label></span>
                <input id="nombrePlantilla" name="nombrePlantilla" type="text" value="<%=request.getAttribute("nombre")%>"/><br/>
                <br/>
                <input type="button" value="Modificar Plantilla" onClick="selectAllOptions('<%=request.getAttribute("nombre")%>');"/><br/>
                <input type="button" value="Cancelar" onClick="salir();"/>
            </center>
        </form>
        
    </body>
        
</html>