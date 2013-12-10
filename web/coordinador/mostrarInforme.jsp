<%-- 
    Document   : mostrarInforme
    Created on : 18/10/2013, 03:19:38 AM
    Author     : CHANGE Gate
--%>

<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>
<head>
<script type="text/javascript">
        
        function edita(val,val2) {
            document.fom.action = "updateSol.action?carnet=" + val+"&nombre="+val2;
            document.fom.submit();
        }
</script>  
</head>
                    <center>
                        <h3><center><b>Informe académico</b></center></h3>
                    <br/>
                    <table border="1">
                        <tr>
                            <td><center><b>Materia</b></center></td>
                        <td><center><b>Código</b></center></td>
                        <td><center><b>Nota</b></center></td>
                        </tr>

                        <%

                            List l = (List) request.getAttribute("disp5");
                            if (l != null && l.size() != 0) {
                        %>

                        <%
                            Iterator it = l.iterator();

                            while (it.hasNext()) {
                                clases.AsignaturaConNota b = (clases.AsignaturaConNota) it.next();
                                String nombre = b.getAsignatura().getNombre();
                                String codigo = b.getAsignatura().getCodigoS();
                                String nota = b.getNota() + "";

                        %>
                        <tr>
                            <td><center><%= nombre%></center></td>
                        <td><center><%= codigo%></center></td>
                        <td><center><%= nota%></center></td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </table>

                    
                      
                        
                    </center>

                    <%
                            Map session2 = com.opensymphony.xwork2.ActionContext.getContext().getSession();
                            String carnet = session2.get("carnet_aux").toString();
                            String nombre = session2.get("nombre_aux").toString();
                    %>
                    <br/>
                    <center>
                        <form name="fom">
                        <center><a href="javascript:edita('<%= carnet%>','<%= nombre%>')">Volver</a></center>
                        </form>
                    </center>
                    
   

