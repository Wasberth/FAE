<%-- 
    Document   : profile
    Created on : 8/05/2020, 12:54:07 PM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Mi perfil</title>
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/publication.css">
        <link rel="stylesheet" href="css/colors.css">
    </head>
    <body class="color5">
        <%
            String nom_user = "";
            String nivel = "";
            String id = "0";
            try {
                HttpSession sesion = request.getSession();
                id = sesion.getAttribute("usr_id").toString();
                nom_user = sesion.getAttribute("user").toString();
                nivel = sesion.getAttribute("nivel").toString();
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
        <div class="container-fluid content">
            <div class="row content">
                <div class="col-12 col-md-8">
                    <h2> Mi perfil</h2>
                    <br>
                    <h4>
                        Nombre de Usuario
                    </h4>
                    <br>
                    <div class="row">
                        <div class="col-6">
                            <p>
                                <%=nom_user%><br>
                                <small class="text-muted">Recuerda seguir los lineamientos respecto al nombre de usuario</small>
                            </p>
                        </div>
                        <div class="col-6">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#userModal">
                                Cambiar nombre de usuario
                            </button>

                            <div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <form action="userOps" method="POST">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="userModalLabel">Cambiar nombre de usuario</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <input type="hidden" name="id" value="<%=id%>">
                                                <div class="form-group">
                                                    <label for="exampleInputPassword1">Nuevo nombre</label>
                                                    <input type="text" class="form-control" name="newName" placeholder="Nuevo nombre">
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <input class="btn btn-primary" type="submit" name="action" value="Cambiar nombre">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br><br>
                    <h4>
                        Contraseña
                    </h4>
                    <br>
                    <div class="row">
                        <div class="col-6">
                            <p>
                                *******<br>
                                <small class="text-muted">No compartas tu contraseña con nadie</small>
                            </p>
                        </div>
                        <div class="col-6">
                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#passModal">
                                Cambiar contraseña
                            </button>

                            <div class="modal fade" id="passModal" tabindex="-1" role="dialog" aria-labelledby="passModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <form action="userOps" method="POST">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="passModalLabel">
                                                    Cambiar contraseña
                                                    <br>
                                                    <small class="text-warning">No compartas tu contraseña con nadie</small>
                                                </h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <input type="hidden" name="idp" value="<%=id%>">
                                                <input type="text" name="currPass" placeholder="Actual contraseña">
                                                <input type="text" name="newPass" placeholder="Nueva contraseña">
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                <input type="submit" class="btn btn-primary" name="action" value="Cambiar password">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <aside class="login-content col-12 col-md-4 color3">
                    <h2>Reglas</h2>
                    <p>Nullam euismod justo nibh, nec rhoncus mi semper porta. Vivamus lacinia erat sit amet justo porta vulputate. Aenean eget erat faucibus, blandit orci non, porttitor eros. Integer semper leo ut felis cursus, in sodales lectus bibendum. Aliquam erat volutpat. Curabitur nec urna quis lorem laoreet elementum eu in sem. Pellentesque suscipit tincidunt ultricies.</p>
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
