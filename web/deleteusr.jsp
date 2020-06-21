<%-- 
    Document   : deleteusr
    Created on : 21/06/2020, 04:03:17 PM
    Author     : david
--%>

<%@page import="content.usrOperacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        if (new usrOperacion().eliminar(Integer.parseInt(request.getParameter("publicacionDelete")))) {
            request.getRequestDispatcher("ConsultarUsers.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("indexAdmin.jsp").forward(request, response);
        }
    %>
</html>
