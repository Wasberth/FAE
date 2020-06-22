<%-- 
    Document   : RegCons
    Created on : 10/06/2020, 01:16:33 AM
    Author     : tutus
--%>

<%@page import="controlador.registro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registro</title>
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/loginStyle.css">
        <link rel="stylesheet" href="css/colors.css">
        <link rel="stylesheet" href="css/mainPage.css">
    </head>
    <body class="color5">
        <%
            String nivel = "";
            try {
                HttpSession sesion = request.getSession();

                if (sesion.getAttribute("user") != null && sesion.getAttribute("nivel") != null) {
                    String usuario = sesion.getAttribute("user").toString();
                    nivel = sesion.getAttribute("nivel").toString();
                } else {
                    response.sendRedirect("errorPage.jsp");
                }

            } catch (Exception e) {
                response.sendRedirect("errorPage.jsp");
            }


        %>
        <nav class="navbar navbar-expand-lg navbar-light color1 fixed-top">
            <a class="navbar-brand" href="#"><img class="logo" src="img/FAE_logo.png"></a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="MainPage.jsp" style="color:whitesmoke;">Página principal</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:whitesmoke;">
                            Menú
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="publication.jsp">Escribir una publicación</a>
                            <a class="dropdown-item" href="profile.jsp">Mi perfil</a>
                            <%                                if (Integer.parseInt(session.getAttribute("nivel").toString()) < 3) {
                            %>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="PubsUsers.jsp">Consultar publicaciones</a>
                            <%
                                }
                                if (Integer.parseInt(session.getAttribute("nivel").toString()) < 2) {
                            %>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="ConsultarUsers.jsp">Consultar usuarios</a>
                            <a class="dropdown-item" href="RegCons.jsp">Registrar usuario</a>
                            <%
                                }
                            %>
                        </div>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <div class="dropdown">
                        <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Opciones del Perfil
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="profile.jsp">Mi perfil</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="log_out.jsp" name="cerrarSesion">Cerrar Sesion</a>
                        </div>
                    </div>
                </form>
            </div>
        </nav>
        <div class="container content">
            <form action="adminOps" method="post">
                <div class="form-group">
                    <div class="input-group">
                        <label class="sr-only" for="user">Usuario</label>
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fas fa-user"></i></div>
                        </div>
                        <input id="user" type="text" class="form-control" required name="tag" placeholder="Nombre de Usuario">
                    </div>
                    <div class="input-group">
                        <label class="sr-only" for="user_password">Usuario</label>
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fas fa-lock"></i></div>
                        </div>
                        <input id="user_password" type="password" class="form-control" required name="pass" placeholder="Contraseña">
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <label class="sr-only" for="user">Usuario</label>
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fas fa-arrow-alt-circle-right"></i></div>
                        </div>
                        <input id="nombre" type="text" class="form-control" required name="name" placeholder="Nombre">
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
                <div class="form-group">
                    <%
                        if (nivel == "1") {
                    %>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="lvl" id="n1" value="1">
                        <label class="form-check-label" for="exampleRadios1">
                            Administrador
                        </label>
                    </div>
                    <%
                        }
                    %>    
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="lvl" id="n2" value="2">
                        <label class="form-check-label" for="exampleRadios1">
                            Consejero
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="lvl" id="n3" value="3" checked>
                        <label class="form-check-label" for="exampleRadios1">
                            Usuario
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <input class="btn btn-primary" type="submit" value="Registrarse">
                </div>
            </form>
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
