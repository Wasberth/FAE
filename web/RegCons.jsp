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
        String nivel = "";
        try{
        HttpSession sesion = request.getSession();
        
        
        if(sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null){
            String usuario = sesion.getAttribute("user").toString();
            nivel = sesion.getAttribute("nivel").toString();
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
            Tipo de usuario: <br>
        <%
            if (nivel == "1"){
        %>
            <input type="radio" id="n1" name="lvl" value="1">
            <label for="n1">Administrador</label><br>
        <%
            }
        %>        
            <input type="radio" id="n2" name="lvl" value="2">
            <label for="n2">Consejero</label><br>
            <input type="radio" id="n3" name="lvl" value="3">
            <label for="n3">Usuario</label><br>
            <input type="submit" name="action" value="Registrar">
        </form>
    </body>
</html>
