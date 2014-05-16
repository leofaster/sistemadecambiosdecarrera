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
        <link href="css/bootstrap2.css" rel="stylesheet">        
        <link href="css/estilo.css" rel="stylesheet">

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

            function selectAllOptions() {
                var materias = t.get_values();
                if (materias[0] != null) {
                    document.fom.action = "GuardarPlan.action?lista=" + materias;
                    document.fom.submit();
                } else {
                    alert("No puede dejar la lista de materias vacía.");
                }
            }
        </script>
    </head>

    <body>
        <s:if test="hasActionErrors()">
            <div class="denyDiv">
                <s:iterator value="actionErrors">
                    <span class="denyMsg" style="font-size:13px"><s:property escape="false" />
                    </span>
                </s:iterator>
            </div>
            <br />
        </s:if>
        <h4>Modificar Plantilla</h4><br />
        <div class="tablaFormal">
            <table border="0">
                <tr>
                    <td>Datos</td>
                    <td>Estudiante</td>
                </tr>
                <tr>
                    <td>Plantilla</td>
                    <td><%=request.getAttribute("nombre")%></td>
                        
                </tr>
                <tr>
                    <td>Estudiante</td>
                    <td><%=session.getAttribute("rec_nombre")%></td>
                </tr>
                <tr>
                    <td>Carrera de Origen</td>
                    <td><%=session.getAttribute("rec_cOrigen")%></td>
                </tr>
            </table>
        </div>
       <br />
        
    <center><div id="test" name="listas"></div></center>
    <br/>
    
    <form name="fom" method="post">
        <div align="right">
            <input type="button" onclick="goBack()" value="&laquo; Anterior">
            <input type="button" onclick="selectAllOptions();" value="Siguiente &raquo;">
        </div>
    </form>
    
</body>

</html>