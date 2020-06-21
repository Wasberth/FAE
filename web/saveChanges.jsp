<%-- 
    Document   : saveChanges
    Created on : 21/06/2020, 12:13:14 AM
    Author     : tutus
--%>

<%@page import="content.pubOperacion"%>
<%@page import="content.Publicacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        Publicacion publicacion = new Publicacion();
        pubOperacion op = new pubOperacion();
        int pub_id = Integer.parseInt(request.getParameter("pub_id").toString());
        String titulo = request.getParameter("titulo_pub");
        String texto = request.getParameter("texto_pub");

        publicacion.setPub_id(pub_id);
        publicacion.setTitulo(titulo);
        publicacion.setTexto(texto);

        if (op.modificar(publicacion)) {
            request.getRequestDispatcher("PubsUsers.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("indexAdmin.jsp").forward(request, response);
        }
    %>
</html>
