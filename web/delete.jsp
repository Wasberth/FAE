<%-- 
    Document   : delete
    Created on : 21/06/2020, 12:13:34 AM
    Author     : tutus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="content.pubOperacion"%>
<%@page import="content.Publicacion"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        Publicacion publicacion = new Publicacion();
        pubOperacion op = new pubOperacion();
        int id_pubd = Integer.parseInt(request.getParameter("publicacionDelete"));
        publicacion.setPub_id(id_pubd);

        if (op.eliminar(publicacion)) {
            request.getRequestDispatcher("PubsUsers.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("indexAdmin.jsp").forward(request, response);
        }
    %>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
