<%-- 
    Document   : loginUsers
    Created on : 5/05/2020, 07:20:51 PM
    Author     : PORTO
--%>

<%@page import="config.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@page import="controlador.Operaciones" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <meta name="google-signin-client_id" content="942131814486-cps2annngh5d9copn0t2ustj4k8fa4i5.apps.googleusercontent.com">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/loginStyle.css">
        <link rel="stylesheet" href="css/colors.css">
    </head>
    <body class="color5">
        <%
            Conexion con = new Conexion();
            HttpSession sesion = request.getSession();
        %>

        <header class="container-fluid col-xs-12 header color1">
            <div class="row">
                <div class="d-none d-sm-inline-block col-sm-4 img-container-1">
                    <img class="logo" src="img/FAE_logo.png">
                </div>
                <div class="d-inline-block d-sm-none col-xs-4 img-container-1">
                    <img class="logo-simple" src="img/FAE_simple.png">
                </div>
            </div>
        </header>
        <div class="container-fluid">
            <div class="row content">
                <div id="carouselExampleSlidesOnly" class="carousel slide col-md-8 d-none d-md-inline-block" data-ride="carousel">
                    <div class="carousel-inner rounded-lg">
                        <div class="carousel-item active rounded-lg">
                            <img src="https://picsum.photos/500/250" class="img-fluid d-block w-100 rounded-lg" alt="...">
                        </div>
                        <div class="carousel-item rounded-lg">
                            <img src="https://picsum.photos/500/250" class="img-fluid d-block w-100 rounded-lg" alt="...">
                        </div>
                        <div class="carousel-item rounded-lg">
                            <img src="https://picsum.photos/500/250" class="img-fluid d-block w-100 rounded-lg" alt="...">
                        </div>
                    </div>
                </div>
                <aside class="login-content col-12 col-md-4">
                    <form action="index.jsp" method="post">
                        <h2 class="title">Bienvenido</h2>
                        <br>
                        <div class="form-group">
                            <div class="input-group">
                                <label class="sr-only" for="user">Usuario</label>
                                <div class="input-group-prepend">
                                    <div class="input-group-text"><i class="fas fa-user"></i></div>
                                </div>
                                <input type="text" class="form-control" required name="user" placeholder="Usuario">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <label class="sr-only" for="user">Contraseña</label>
                                <div class="input-group-prepend">
                                    <div class="input-group-text"><i class="fas fa-lock"></i></div>
                                </div>
                                <input type="password" class="form-control" required name="password" placeholder="Contraseña">
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-primary" value="Iniciar Sesión" name="btninicar">
                            <a href="registrar.jsp" class="btn btn-secondary">Registarse</a>
                        </div>
          

                        </form> 

                        <%
                            Operaciones op = new Operaciones();
                            if (request.getParameter("btninicar") != null) {
                                String nomUser = request.getParameter("user");
                                String password = request.getParameter("password");

                                switch (op.loguear(nomUser, password)) {
                                    case 1:
                                        sesion.setAttribute("user", nomUser);
                                        sesion.setAttribute("nivel", "1");
                                        sesion.setAttribute("usr_id", op.getId());
                                        response.sendRedirect("indexAdmin.jsp");
                                        break;

                                    case 2:
                                        sesion.setAttribute("user", nomUser);
                                        sesion.setAttribute("nivel", "2");
                                        sesion.setAttribute("usr_id", op.getId());
                                        response.sendRedirect("indexCons.jsp");
                                        break;

                                    case 3:
                                        sesion.setAttribute("user", nomUser);
                                        sesion.setAttribute("nivel", "3");
                                        sesion.setAttribute("usr_id", op.getId());
                                        response.sendRedirect("MainPage.jsp");
                                        break;

                                    default:
                        %>
                        <script>
                            alert("Tu usuarios no existe");
                        </script>
                        <%
                                        break;
                                } //cierra switch
                            }
                             
                        %>
                    </aside>
                </div>
            </div>
            <footer class="container-fluid footer color1">
                <p>
                    Donec eu tincidunt tortor. Integer consectetur sollicitudin arcu eu dignissim. Morbi ex turpis, fermentum id felis sit amet, euismod dictum.
                </p>
            </footer>
            <script src="https://kit.fontawesome.com/a81368914c.js"></script>
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        </body>
    </html>