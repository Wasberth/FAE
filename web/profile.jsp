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
    <body>
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
                <div class="col-12 col-md-8">
                    <h2> Crear una publicación</h2>
                    <br>
                    <h4>
                        Nombre de Usuario
                    </h4>
                    <br>
                    <div class="row">
                        <div class="col-6">
                            <p>
                                Insertar nombre de usuario aquí<br>
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
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="userModalLabel">Cambiar nombre de usuario</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <!-- Aquí va el formulario y eso -->
                                            ...
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br><br>
                    <h4>
                        Nombre de Usuario
                    </h4>
                    <br>
                    <div class="row">
                        <div class="col-6">
                            <p>
                                Insertar "*" como caracteres tenga la contraseña<br>
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
                                            <!-- Aquí va el formulario y eso -->
                                            ...
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>
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
