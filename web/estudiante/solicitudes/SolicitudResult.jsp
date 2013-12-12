<%-- 
    Document    : SolicitudResult
    Author      : CHANGE Gate
--%>

<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="success">
    <br /><br /><br /><br />
    <center>
        <strong><s:property escapeHtml="false" value="mensaje.replace(\"\n\", \" <br />\")" /></strong> 
    </center>
</div>