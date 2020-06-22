<%-- 
    Document   : publication
    Created on : 8/05/2020, 01:23:24 AM
    Author     : david
--%>


<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="controlador.Operaciones"%>
<%@page import="config.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Publicacion</title>
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/publication.css">
        <link rel="stylesheet" href="css/colors.css">
    </head>
    <body class="color5">
        <%

            HttpSession sesion = request.getSession();

            //response.sendRedirect("errorPage.jsp");

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
        <div class="container-fluid content">
            <div class="row content">
                <div class="col-12 col-md-8">
                    <h2> Crear una publicación</h2>
                    <br>
                    <form id="publicacion" action="Post" method="post">
                        <div class="form-group">
                            <select class="form-control" id="exampleFormControlSelect1" form="publicacion" name="categoria" placeholder="Elije una categoría">
                                <option value="null" selected disabled>-- Elige una etiqueta --</option>
                                <%                                    String DRIVER = "com.mysql.jdbc.Driver";
                                    Class.forName(DRIVER).newInstance();
                                    Connection con = null;
                                    Statement st = null;
                                    ResultSet rs = null;
                                    try {
                                        con = new Operaciones().getConnection();
                                        st = con.createStatement();
                                        String q = "SELECT * FROM cetiquetas";
                                        rs = st.executeQuery(q);
                                        while (rs.next()) {
                                            String tag = rs.getString("eti_nom");
                                            int id = Integer.parseInt(rs.getString("eti_id"));
                                %>
                                <option value="<%=id%>"><%=tag%></option>
                                <%
                                        }
                                        con.close();
                                    } catch (Exception e) {
                                        System.out.println(e);
                                    } finally {
                                        try {
                                            con.close();
                                        } catch (SQLException ex) {
                                            Logger.getLogger(Operaciones.class.getName()).log(Level.SEVERE, null, ex);
                                        }
                                    }
                                %>
                            </select>
                        </div>
                        <%
                            Operaciones op = new Operaciones();
                            String titulo = "", texto = "";
                            if (op.hasBorrador(Integer.parseInt(sesion.getAttribute("usr_id").toString()))) {
                                titulo = op.getTitleBorrador();
                                texto = op.getTextBorrador();
                            }
                        %>
                        <div class="form-group">
                            <div class="input-group">
                                <label class="sr-only" for="user">Título</label>
                                <div class="input-group-prepend">
                                    <div class="input-group-text"><i class="fas fa-quote-left"></i></div>
                                </div>
                                <input type="text" class="form-control" required name="titulo" placeholder="Título" value="<%=titulo%>">
                                <div class="input-group-prepend">
                                    <div class="input-group-text"><i class="fas fa-quote-right"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <label class="sr-only" for="user">Contraseña</label>
                                <div class="input-group-prepend">
                                    <div class="input-group-text"><i class="fas fa-paragraph"></i></div>
                                </div>
                                <textarea form="publicacion" class="form-control" placeholder="Tu publicación" name="cuerpo"><%=texto%></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-primary" value="Publicar" name="btnpost">
                            <%
                                if (Integer.parseInt(sesion.getAttribute("nivel").toString()) < 3) {
                            %>
                            <input type="submit" class="btn btn-danger" value="Noticia" name="btnpost">
                            <%
                                }
                            %>
                            <input type="submit" class="btn btn-secondary" value="Guardar como borrador" name="btnpost">
                        </div>
                    </form>
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