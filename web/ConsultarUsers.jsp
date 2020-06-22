<%-- 
    Document   : ConsultarUsers
    Created on : 11/06/2020, 01:07:00 AM
    Author     : tutus
--%>


<%@page import="content.Usuario"%>
<%@page import="java.util.LinkedList"%>
<%@page import="content.ConsultaBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/ali.css">
        <link href="css/estilos.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar usuarios</title>
        <link rel="stylesheet" href="css/colors.css">
        <link rel="stylesheet" href="css/mainPage.css">
        <link rel="stylesheet" href="css/hiddenDisabledInputs.css">
    </head>
    <body class="color5">
        <%
            HttpSession sesion = request.getSession();
            if (Integer.parseInt(sesion.getAttribute("nivel").toString()) < 3) {
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
                            <%
                                if (Integer.parseInt(session.getAttribute("nivel").toString()) < 3) {
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

        <div id="content-box" class="container-fluid content">
            <div class="row">
                <div class="col-12">       
                    <table class="table-sm table-hover table-responsive table-striped">
                        <thead class="color2">
                            <tr>
                                <th style="color:whitesmoke;">Usuario ID</th>
                                <th style="color:whitesmoke;">Username</th>
                                <th style="color:whitesmoke;">Nombre</th>
                                <th style="color:whitesmoke;">Apellido Paterno</th>
                                <th style="color:whitesmoke;">Apellido Materno</th>
                                <th style="color:whitesmoke;">Nivel</th>
                                <th style="color:whitesmoke;">Modificar</th>
                                <th style="color:whitesmoke;">Eliminar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <%
                                    LinkedList<Usuario> lista = ConsultaBD.getConsejeros();
                                    for (int i = 0; i < lista.size(); i++) {
                                        String classcolor = i%2==0? "color4" : "color3";
                                %>
                            <tr>
                                <td class="<%=classcolor%>" style="width: 10%"><input style="width: 100%" id="id <%=lista.get(i).getUsr_id()%>" disabled type="text"  value="<%=lista.get(i).getUsr_id()%>"></td>
                                <td class="<%=classcolor%>" style="width: 10%"><input style="width: 100%" id="tag <%=lista.get(i).getUsr_id()%>" disabled type="text"   value="<%=lista.get(i).getUsr_tag()%>"></td>
                                <td class="<%=classcolor%>" style="width: 10%"><input style="width: 100%" id="nom <%=lista.get(i).getUsr_id()%>" disabled type="text"  value="<%=lista.get(i).getUsr_nom()%>"></td>
                                <td class="<%=classcolor%>" style="width: 10%"><input style="width: 100%" id="app <%=lista.get(i).getUsr_id()%>" disabled type="text"  value="<%=lista.get(i).getUsr_app()%>"></td>
                                <td class="<%=classcolor%>" style="width: 10%"><input style="width: 100%" id="apm <%=lista.get(i).getUsr_id()%>" disabled type="text"   value="<%=lista.get(i).getUsr_apm()%>"></td>
                                <td class="<%=classcolor%>" style="width: 10%"><input style="width: 100%" id="niv <%=lista.get(i).getUsr_id()%>" disabled type="number"   value="<%=lista.get(i).getUsr_niv()%>"></td>
                                <td class="<%=classcolor%>" style="width: 30%">
                                    <form id="form <%=lista.get(i).getUsr_id()%>" method="POST" action="saveUsrChanges.jsp">
                                        <input id="input tag <%=lista.get(i).getUsr_id()%>" name="usr_tag" type="hidden">
                                        <input id="input nom <%=lista.get(i).getUsr_id()%>" name="usr_nom" type="hidden">
                                        <input id="input app <%=lista.get(i).getUsr_id()%>" name="usr_app" type="hidden">
                                        <input id="input apm <%=lista.get(i).getUsr_id()%>" name="usr_apm" type="hidden">
                                        <input id="input niv <%=lista.get(i).getUsr_id()%>" name="usr_niv" type="hidden">
                                        <input id="<%=lista.get(i).getUsr_id()%>" value="<%=lista.get(i).getUsr_id()%>" name="usr_id" type="hidden">
                                        <input style="width: 100%" id="input <%=lista.get(i).getUsr_id()%>" class="editar" type="button" value="Editar" onclick="(function () {
                                            var botones = document.getElementsByClassName('editar');
                                            for (var i = 0; i < botones.length; i++) {
                                                botones[i].hidden = true;
                                            }
                                            document.getElementById('tag <%=lista.get(i).getUsr_id()%>').disabled = false;
                                            document.getElementById('nom <%=lista.get(i).getUsr_id()%>').disabled = false;
                                            document.getElementById('app <%=lista.get(i).getUsr_id()%>').disabled = false;
                                            document.getElementById('apm <%=lista.get(i).getUsr_id()%>').disabled = false;
                                            document.getElementById('niv <%=lista.get(i).getUsr_id()%>').disabled = false;
                                            document.getElementById('submit <%=lista.get(i).getUsr_id()%>').hidden = false;
                                            document.getElementById('cancel <%=lista.get(i).getUsr_id()%>').hidden = false;
                                            document.getElementById('input <%=lista.get(i).getUsr_id()%>').hidden = true;

                                        })()">
                                        <input style="width: 70%" id="submit <%=lista.get(i).getUsr_id()%>" type="button" hidden name="action" value="Guardar cambios" onclick="(function () {
                                            document.getElementById('input tag <%=lista.get(i).getUsr_id()%>').value = document.getElementById('tag <%=lista.get(i).getUsr_id()%>').value;
                                            document.getElementById('input nom <%=lista.get(i).getUsr_id()%>').value = document.getElementById('nom <%=lista.get(i).getUsr_id()%>').value;
                                            document.getElementById('input app <%=lista.get(i).getUsr_id()%>').value = document.getElementById('app <%=lista.get(i).getUsr_id()%>').value;
                                            document.getElementById('input apm <%=lista.get(i).getUsr_id()%>').value = document.getElementById('apm <%=lista.get(i).getUsr_id()%>').value;
                                            document.getElementById('input niv <%=lista.get(i).getUsr_id()%>').value = document.getElementById('niv <%=lista.get(i).getUsr_id()%>').value;
                                            document.getElementById('form <%=lista.get(i).getUsr_id()%>').submit();
                                        })()">
                                        <input style="width: 25%" id="cancel <%=lista.get(i).getUsr_id()%>" type="button" hidden value="Cancelar" onclick="(function () {
                                            location.reload();
                                        })()">
                                    </form>
                                </td>
                                <td class="<%=classcolor%>" style="width: 20%">
                                    <form action="deleteusr.jsp" method="POST">
                                        <input id="delete <%=lista.get(i).getUsr_id()%>" name="UserDelete" type="hidden" value="<%=lista.get(i).getUsr_id()%>">
                                        <input type="submit" name="action" value="Eliminar">
                                    </form>
                                </td>
                            </tr>
                            <%
                                }

                            %>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <%    } else {
                response.sendRedirect("errorPage.jsp");
            }
        %>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/funciones.js" type="text/javascript"></script>
    </body>
</html>
