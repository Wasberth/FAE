<%-- 
    Document   : saveUsrChanges
    Created on : 21/06/2020, 03:37:19 PM
    Author     : david
--%>

<%@page import="content.usrOperacion"%>
<%@page import="content.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        Usuario usr = new Usuario(Integer.parseInt(request.getParameter("usr_id").toString()), 
                Integer.parseInt(request.getParameter("usr_niv").toString()), 
                request.getParameter("usr_tag"),
                request.getParameter("usr_nom"),
                request.getParameter("usr_app"),
                request.getParameter("usr_apm"));
        if (new usrOperacion().modificar(usr)) {
            request.getRequestDispatcher("ConsultarUsers.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("indexAdmin.jsp").forward(request, response);
        }
    %>
</html>
