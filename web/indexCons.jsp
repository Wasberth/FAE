<%-- 
    Document   : indexCons
    Created on : 11/06/2020, 01:01:46 AM
    Author     : tutus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
        HttpSession sesion = request.getSession();
        sesion.getAttribute("nivel");
        if(sesion.getAttribute("nivel").toString()=="2"){
%>
        <h1>Estás en la página de consejeros (Todavia no tiene diseño)</h1>
        <br>
        <a href="ConsultarUsers.jsp">Consultar usuarios</a>
        <a href="PubsUsers.jsp">Consultar publicaciones</a>
        <a href="publication.jsp">Escribir noticia</a>
        <a href="RegCons.jsp">Registrar usuario</a>
        
<%
        }else{
              response.sendRedirect("errorPage.jsp");
         }
%>
    </body>
</html>
