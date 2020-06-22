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
        <title>Registro</title>
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/loginStyle.css">
        <link rel="stylesheet" href="css/colors.css">
    </head>
    <body class="color5">
        <header class="container-fluid col-xs-12 header color1">
            <div class="row">
                <div class="d-none d-sm-inline-block col-sm-4 img-container-1">
                    <img class="img img-fluid logo" src="img/FAE_logo.png">
                </div>
                <div class="d-inline-block d-sm-none col-xs-4 img-container-1">
                    <img class="img img-fluid logo-simple" src="img/FAE_simple.png">
                </div>
            </div>
        </header>
        <div class="container content">
            <form method="post">
                <div class="form-group">
                    <div class="input-group">
                        <label class="sr-only" for="user">Usuario</label>
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fas fa-user"></i></div>
                        </div>
                        <input id="user" type="text" class="form-control" required name="user_name" placeholder="Nombre de Usuario">
                    </div>
                    <div class="input-group">
                        <label class="sr-only" for="user_password">Usuario</label>
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fas fa-lock"></i></div>
                        </div>
                        <input id="user_password" type="password" class="form-control" required name="user_password" placeholder="Contraseña">
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <label class="sr-only" for="user">Usuario</label>
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fas fa-arrow-alt-circle-right"></i></div>
                        </div>
                        <input id="nombre" type="text" class="form-control" required name="nombre" placeholder="Nombre">
                    </div>
                    <div class="input-group">
                        <label class="sr-only" for="user">Usuario</label>
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fas fa-arrow-alt-circle-right"></i></div>
                        </div>
                        <input id="apmat" type="text" class="form-control" required name="appat" placeholder="Apellido Paterno">
                    </div>
                    <div class="input-group">
                        <label class="sr-only" for="user">Usuario</label>
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fas fa-arrow-alt-circle-right"></i></div>
                        </div>
                        <input id="appat" type="text" class="form-control" required name="apmat" placeholder="Apellido Materno">
                    </div>
                </div>
                <input class="btn btn-primary" type="submit" value="Registrarse">
            </form>
        </div>

        <footer class="container-fluid footer color1">
            <p>
                Donec eu tincidunt tortor. Integer consectetur sollicitudin arcu eu dignissim. Morbi ex turpis, fermentum id felis sit amet, euismod dictum.
            </p>
        </footer>
        <%
            registro op = new registro();
            String user_tag = request.getParameter("user_name");
            String user_password = request.getParameter("user_password");
            String user_nombre = request.getParameter("nombre");
            String user_appat = request.getParameter("appat");
            String user_apmat = request.getParameter("apmat");

            if (op.registro(user_tag, user_password, user_nombre, user_appat, user_apmat) == true) {
        %>      <script>alert("Registro exitoso");</script><%
                response.sendRedirect("index.jsp");
            } else {
                System.out.println("error");

            }

        %>
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
