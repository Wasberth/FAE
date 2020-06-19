<%-- 
    Document   : MainPage
    Created on : 7/05/2020, 11:21:11 PM
    Author     : david
--%>



<%@page import="controlador.Operaciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <title>FAE</title>
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/colors.css">
        <link rel="stylesheet" href="css/mainPage.css">
    </head>
    <body class="color5">
        <%
            String nom_user = "";
            try {
                HttpSession sesion = request.getSession();
                sesion.getAttribute("nomUser");
                sesion.getAttribute("usr_id");
                nom_user = sesion.getAttribute("user").toString();
            } catch (Exception e) {
                response.sendRedirect("errorPage.jsp");
            }


        %>
        <nav class="navbar navbar-expand-lg navbar-light color1 fixed-top">
            <a class="navbar-brand" href="#"><img class="logo" src="img/FAE_logo.png"></a>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Menú
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Escribir una publicacion</a>
                            <a class="dropdown-item" href="#">Mi perfil</a>
                            <a class="dropdown-item" href="log_out.jsp" name="cerrarSesion">Cerrar Sesion</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Destacados</a>
                        </div>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <button class="btn color3 mr-sm-2" type="button">Mi perfil</button>
                </form>
            </div>
        </nav>
        <div id="content-box" class="container-fluid content">
            <div class="row">
                <aside class="col-3 px-1 position-fixed offset-8 d-none d-sm-inline-block color3" id="sticky-sidebar">
                    <br>
                    <h4>Noticia destacada 1</h4><br>
                    <h4>Noticia destacada 2</h4><br>
                    <h4>Noticia destacada 3</h4><br>
                </aside>
            </div>
            <div class="row">
                <aside class="col-3 px-1 position-fixed offset-8 d-none d-sm-inline-block color3 aside2" id="sticky-sidebar">
                    <br>
                    <p>Información de la pag</p>
                    <p>Términos de uso blablabla</p>
                </aside>
            </div>
            <div class="row">
                <div id="content-wrapper" class="col-10 col-sm-7 offset-1">

                    <!--Este artículo es obligatorio-->
                    <article class="container borderSimple d-none d-sm-inline-block">
                        <a href="publication.jsp">
                            <div class="row">
                                <div class="col-sm-2 color2 btn-group btn-g">
                                    <button class="btn">
                                        <i class="fas fa-pencil-alt"></i>
                                    </button>
                                </div>
                                <div class="col-sm-10 color4 form-control">
                                    Escribir una publicacion
                                </div>
                            </div>
                        </a>
                    </article>
                    <!--Este artículo es obligatorio-->

                    <!--Primeros 2-5 artículos deben de ser generados por ESTE jsp-->

                    <%                        Operaciones op = new Operaciones();
                        String DRIVER = "com.mysql.jdbc.Driver";
                        Class.forName(DRIVER).newInstance();
                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;
                        Statement st2 = null;
                        ResultSet rs2 = null;
                        Statement st3 = null;
                        ResultSet rs3 = null;
                        int id = 4;
                        int pub_id = 0;
                        try {
                            String url = "jdbc:mysql://localhost:3306/db_faev1?user=root&password=root";
                            con = Operaciones.getConnection();
                            st = con.createStatement();
                            st2 = con.createStatement();
                            String q = "SELECT * FROM MPublicacion LIMIT 8";
                            String q2 = "SELECT * FROM DPublicacion LIMIT 8";
                            rs = st.executeQuery(q);
                            rs2 = st2.executeQuery(q2);
                            while (rs.next() && rs2.next()) {
                                String tit = rs.getString("pub_tit");
                                String txt = rs2.getString("pub_txt");
                                pub_id = rs.getInt("pub_id");
                                String nom_usuario = op.getNombreUser(pub_id);

                                if (rs2.getInt("typ_id") != 3) {


                    %>
                    <article class="container borderSimple">
                        <header class="row color2">
                            <div class="col-l2">
                                <!Aqui no va el nom_user por que ese es de la sesion
                                    Tiene que ir el nombre del usuario desde la bd>
                                <h5 class="text-center"><%=tit%> de <%=nom_usuario%></h5>
                            </div>
                            <div class="btn-request" data-toggle="modal" data-target="#userModal">
                                <button type="button" class="btn btn-request">Reportar</button>
                            </div>
                        </header>
                        <div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="userModalLabel">¿Por qué denunciar?</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-4">
                                                <div class="list-group" id="list-tab" role="tablist">
                                                    <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">Contenido sensible</a>
                                                    <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">Violencia</a>
                                                    <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">Noticias falsas</a>
                                                    <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">Spam</a>
                                                    <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">Terrorismo</a>
                                                    <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">Otro</a>
                                                </div>
                                            </div>
                                            <div class="col-8">
                                                <div class="tab-content" id="nav-tabContent">
                                                    <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list"><p>Velit aute mollit ipsum ad dolor consectetur nulla officia culpa adipisicing exercitation fugiat tempor. Voluptate deserunt sit sunt nisi aliqua fugiat proident ea ut. Mollit voluptate reprehenderit occaecat nisi ad non minim tempor sunt voluptate consectetur exercitation id ut nulla. Ea et fugiat aliquip nostrud sunt incididunt consectetur culpa aliquip eiusmod dolor. Anim ad Lorem aliqua in cupidatat nisi enim eu nostrud do aliquip veniam minim.</p></div>
                                                    <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list"><p>Cupidatat quis ad sint excepteur laborum in esse qui. Et excepteur consectetur ex nisi eu do cillum ad laborum. Mollit et eu officia dolore sunt Lorem culpa qui commodo velit ex amet id ex. Officia anim incididunt laboris deserunt anim aute dolor incididunt veniam aute dolore do exercitation. Dolor nisi culpa ex ad irure in elit eu dolore. Ad laboris ipsum reprehenderit irure non commodo enim culpa commodo veniam incididunt veniam ad.</p></div>
                                                    <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list"><p>Ut ut do pariatur aliquip aliqua aliquip exercitation do nostrud commodo reprehenderit aute ipsum voluptate. Irure Lorem et laboris nostrud amet cupidatat cupidatat anim do ut velit mollit consequat enim tempor. Consectetur est minim nostrud nostrud consectetur irure labore voluptate irure. Ipsum id Lorem sit sint voluptate est pariatur eu ad cupidatat et deserunt culpa sit eiusmod deserunt. Consectetur et fugiat anim do eiusmod aliquip nulla laborum elit adipisicing pariatur cillum.</p></div>
                                                    <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list"><p>Irure enim occaecat labore sit qui aliquip reprehenderit amet velit. Deserunt ullamco ex elit nostrud ut dolore nisi officia magna sit occaecat laboris sunt dolor. Nisi eu minim cillum occaecat aute est cupidatat aliqua labore aute occaecat ea aliquip sunt amet. Aute mollit dolor ut exercitation irure commodo non amet consectetur quis amet culpa. Quis ullamco nisi amet qui aute irure eu. Magna labore dolor quis ex labore id nostrud deserunt dolor eiusmod eu pariatur culpa mollit in irure.</p></div>
                                                    <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list"><p>Velit aute mollit ipsum ad dolor consectetur nulla officia culpa adipisicing exercitation fugiat tempor. Voluptate deserunt sit sunt nisi aliqua fugiat proident ea ut. Mollit voluptate reprehenderit occaecat nisi ad non minim tempor sunt voluptate consectetur exercitation id ut nulla. Ea et fugiat aliquip nostrud sunt incididunt consectetur culpa aliquip eiusmod dolor. Anim ad Lorem aliqua in cupidatat nisi enim eu nostrud do aliquip veniam minim.</p></div>
                                                    <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list"><p>Irure enim occaecat labore sit qui aliquip reprehenderit amet velit. Deserunt ullamco ex elit nostrud ut dolore nisi officia magna sit occaecat laboris sunt dolor. Nisi eu minim cillum occaecat aute est cupidatat aliqua labore aute occaecat ea aliquip sunt amet. Aute mollit dolor ut exercitation irure commodo non amet consectetur quis amet culpa. Quis ullamco nisi amet qui aute irure eu. Magna labore dolor quis ex labore id nostrud deserunt dolor eiusmod eu pariatur culpa mollit in irure.</p></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary" onclick="return eliminar(<%=pub_id%>)">Reportar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-2 color2 d-none d-sm-inline-block">
                                <div class="btn-group-vertical btn-g">
                                    <button class="btn btn-success" name="upvote" onclick="votes(<%=pub_id%>,<%=session.getAttribute("usr_id")%>, '+1')">
                                        <i class="fas fa-arrow-alt-circle-up"></i>
                                    </button>
                                    <button class="btn disabled">
                                        <i>5</i>
                                    </button>
                                    <button class="btn btn-danger" name="downvote" onclick="votes(<%=pub_id%>,<%=session.getAttribute("usr_id")%>, '-1')">
                                        <i class="fas fa-arrow-alt-circle-down"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-12 col-sm-10 color4">
                                <p>
                                    <%=txt%>
                                </p>
                            </div>
                        </div>
                        <div class="row d-block d-sm-none color2">
                            <div class="btn-group btn-g color-12">
                                <button class="btn btn-success">
                                    <i class="fas fa-arrow-alt-circle-up"></i>
                                </button>
                                <button class="btn disabled">
                                    <i>5</i>
                                </button>
                                <button class="btn btn-danger">
                                    <i class="fas fa-arrow-alt-circle-down"></i>
                                </button>
                            </div>
                        </div>
                    </article>
                    <%
                            }
                        }

                    } catch (SQLException e) {
                        e.printStackTrace();
                    %>
                    <p>Murió <%=e%></p>
                    <%
                        }
                    %>
                    <!--Primeros 2-5 artículos deben de ser generados por ESTE jsp-->
                </div>
            </div>
        </div>
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script type="text/javascript">
                                        $(document).ready(function () {
                                            $(window).scroll(function () {
                                                if ($(window).scrollTop() == $(document).height() - $(window).height()) {
                                                    $.get("InfinitContentServlet", {counted:<%=id%>}, function (data) {
                                                        $("#content-wrapper").append(data);
                                                    });
            <%id += 10;%>
                                                }
                                            });
                                        });
                                        function votes(pub_id, usr_id, upvote) {
                                            $.post("Voto", {pub_id: pub_id, usr_id: usr_id, vote: upvote});
                                        }
        </script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/funciones.js" type="text/javascript"></script>
    </body>
</html>
