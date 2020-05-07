<%-- 
    Document   : registrar
    Created on : 5/05/2020, 10:41:50 PM
    Author     : tutus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controlador.registro" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de usuario</title>
    </head>
    <body>
        <form method="post">
            <table>
                <tr>
                    <td>Nombre de usuario</td> 
                    <td><input type="text" name="user_name" placeholder="Nombre de usuario"></td> 
                </tr>
                <tr>
                    <td>Contraseña</td> 
                    <td><input type="password" name="user_password" placeholder="Contraseña"></td> 
                </tr>
                <tr>
                    <td>Nombre</td> 
                    <td><input type="text" name="nombre" placeholder="Nombre"></td> 
                </tr>
                <tr>
                    <td>Apellido Paterno</td> 
                    <td><input type="text" name="appat" placeholder="Apellido Paterno"></td> 
                </tr>
                <tr>
                    <td>Apellido Materno</td> 
                    <td><input type="text" name="apmat" placeholder="Apellido Materno"></td> 
                </tr>
                <tr>
                    <td><input type="reset" value="Borrar"></td> 
                    <td><input type="submit" value="Registrarse"></td> 
                </tr>
            </table>
        </form>
        
        <%
            registro op = new registro();
            String user_tag = request.getParameter("user_name");
            String user_password = request.getParameter("user_password");
            String user_nombre = request.getParameter("nombre");
            String user_appat = request.getParameter("appat");
            String user_apmat = request.getParameter("apmat");
            
            if(op.registro(user_tag, user_password, user_nombre, user_appat, user_apmat)==true){
        %>      <script>alert("Registro exitoso");</script><%
                response.sendRedirect("index.jsp");
            }else{
                System.out.println("error");
                
            }
            
            %>
    </body>
</html>
