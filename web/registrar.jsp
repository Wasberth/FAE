<%-- 
    Document   : registrar
    Created on : 5/05/2020, 10:41:50 PM
    Author     : tutus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de usuario</title>
    </head>
    <body>
        <form method="post" action="registro">
            <table>
                <tr>
                    <td>Nombre</td> 
                    <td><input type="text" id="user_name" placeholder="Nombre de usuario"></td> 
                </tr>
                <tr>
                    <td>Contraseña</td> 
                    <td><input type="password" id="user_password" placeholder="Contraseña"></td> 
                </tr>
                <tr>
                    <td>Nombre</td> 
                    <td><input type="text" id="nombre" placeholder="Nombre"></td> 
                </tr>
                <tr>
                    <td>Apellido Paterno</td> 
                    <td><input type="text" id="appat" placeholder="Apellido Paterno"></td> 
                </tr>
                <tr>
                    <td>Apellido Materno</td> 
                    <td><input type="text" id="apmat" placeholder="Apellido Materno"></td> 
                </tr>
                <tr>
                    <td><input type="reset" value="Borrar"></td> 
                    <td><input type="submit" value="Registrarse"></td> 
                </tr>
            </table>
        </form>
    </body>
</html>
