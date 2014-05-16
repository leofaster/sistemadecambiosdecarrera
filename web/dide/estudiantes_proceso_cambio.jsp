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

            function ver(val) {
                document.fom.action = "verDatosEstudiante.action?carnet=" + val;
                document.fom.submit();
            }
        </script>
    </head>


            <h4>Solicitudes Pendientes</h4><br />
    <div class="tablaFormal">
                <table >
                    <form name="fom" method="post">


                        <%
                            List l = (List) request.getAttribute("listaSolicitudes");
                            if (l != null && l.size() != 0) {
                        %>
                        <tr>
                            <td class="bord"><center><b>Nombre del estudiante</b></center></td>
                            <td class="bord"><center><b>Carnet</b></center></td>
                            <td class="bord"><center><b>Accion</b></center></td>
                        </tr>
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
                        <td class="bord"><center><a href="javascript:ver('<%= carnet%>')">Ver</a></center></td>
                        </tr> 
                        <%
                            }
                        } else {
                        %>

                        <center><b>No posee solicitudes pendientes.</td></b></center>

                        <%                        }
                        %>  
                    </form>
                </table>    
            </div>
                    
            
