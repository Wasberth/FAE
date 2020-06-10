<%-- 
    Document   : RegCons
    Created on : 10/06/2020, 01:16:33 AM
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
        try{
        HttpSession sesion = request.getSession();
        
        
        if(sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null){
            String usuario = sesion.getAttribute("user").toString();
            String nivel = sesion.getAttribute("nivel").toString();
            out.append("<a href='log_out.jsp'?cerrar=true><h5>Cerrar Sesion "+usuario+"</h5></a>");    
        }else{
            response.sendRedirect("errorPage.jsp");
        }
        
        }catch(Exception e){
            response.sendRedirect("errorPage.jsp");
        }
        
        
        %>
        <form action="adminOps" method="POST">
            Nombre de usuario:<input type="text" name="tag" placeholder="Nombre de usuario" >
            Contraseña:<input type="password" name="pass" placeholder="Password" >
            Nombre:<input type="text" name="name" placeholder="Nombre" >
            Apellido Paterno:<input type="text" name="appat" placeholder="Apellido paterno" >
            Apellido Materno:<input type="text" name="apmat" placeholder="Apellido materno" >
            <input type="submit" name="action" value="Registrar">
        </form>
    </body>
</html>
