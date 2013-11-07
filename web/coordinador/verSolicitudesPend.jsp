<%-- 
    Document   : verSolicitudesPend
    Created on : 16/10/2013, 04:30:31 AM
    Author     : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*;" %>

<html>

    <head>
       
        <script type="text/javascript">
        
        function edita(val,val2) {
            document.fom.action = "updateSol.action?carnet=" + val+"&nombre="+val2;
            document.fom.submit();
        }
        </script>
    </head>

                    <div id="login-form"><br><br><br>
                        
                        <center>
                            <h4>Solicitudes Pendientes</h4><br />
                         <table class="bordt" border="1">
                        <form name="fom" method="post">
                           <tr>
                           
                           </tr>
                            <%
                            List l = (List) request.getAttribute("disp3");
                            if (l != null && l.size()!=0) {
                            %>
                            
                           <td class="bord"><center><b>Nombre del estudiante</b></center></td>
                           <td class="bord"><center><b>Carnet</b></center></td>
                           <td class="bord"><center><b>Accion</b></center></td>
                            
                            <%
                                Iterator it = l.iterator();

                                while (it.hasNext()) {
                                    clases.Solicitud b = (clases.Solicitud) it.next();
                                    String nombre = b.getEstudiante().getNombre();
                                    String carnet = b.getEstudiante().getUsbid();
                                    
                            %>
                            <tr> 
                            <center><td class="bord"><%= nombre%></td></center>
                            <center><td class="bord"><%= carnet%></td></center>
                            <td class="bord"><center><a href="javascript:edita('<%= carnet%>','<%= nombre%>')">Gestionar</a></center></td>
                            </tr> 
                            <%
                            }
                            }
                            else{
                            %>
                            
                            <center><b>No posee solicitudes pendientes.</td></b></center>
                            
                            <%
                            }
                            %>  
                        </form>
                        </table>    
                        </center>
                        
                        
                        
                   </div>
              