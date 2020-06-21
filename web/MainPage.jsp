<%-- 
    Document   : MainPage
    Created on : 7/05/2020, 11:21:11 PM
    Author     : david
--%>



<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
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
        <script>
            function filtrar(filtro) {
                document.getElementById("filtro").value = filtro;
                document.getElementById("Filtrar").submit();
            }
        </script>
    </head>
    <body class="color5">
        <%
            Operaciones op = new Operaciones();
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
                    <li>
                        <a class="nav-link" href="publication.jsp">Escribir una publicacion</a>

                    </li>
                    <li>
                        <a class="nav-link" href="profile.jsp">Mi perfil</a>

                    </li>
                    <li>
                        <a class="nav-link" href="log_out.jsp" name="cerrarSesion">Cerrar Sesion</a>

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
                    <h4 style="color:white;">Publicaciones destacadas</h4>
                    <br>
                    <%=op.getPublicacionesPopulares()%>
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

                    <article class="container borderSimple d-none d-sm-inline-block">
                        <form id="Filtrar" method="post" action="MainPage.jsp">
                            <input id="filtro" type="hidden" name="filter">
                            <div class="row">
                                <div class="col-sm-2 color2 btn-group btn-g">
                                    <button class="btn" onclick="return filtrar('votos')">
                                        <i class="fas fa-pencil-alt"></i>
                                        <h5>Populares</h5>
                                    </button>
                                </div>
                                <div class="col-sm-2 color2 btn-group btn-g">
                                    <button class="btn" onclick="return filtrar('fecha')">
                                        <i class="fas fa-pencil-alt"></i>
                                        <h5>Nuevos</h5>
                                    </button>
                                </div>
                                <div class="col-sm-2 color2 btn-group btn-g">
                                    <button class="btn" onclick="return filtrar('noticias')">
                                        <i class="fas fa-pencil-alt"></i>
                                        <h5>Noticias</h5>
                                    </button>
                                </div>
                                <div class="dropdown show">
                                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true">
                                        Dropdown link
                                    </a>

                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                        <%
                                            String DRIVER = "com.mysql.jdbc.Driver";
                                            Class.forName(DRIVER).newInstance();
                                            Connection con = null;
                                            Statement st4 = null;
                                            ResultSet rs4 = null;
                                            con = Operaciones.getConnection();
                                            st4 = con.createStatement();

                                            String q4 = "SELECT * FROM CEtiquetas;";
                                            rs4 = st4.executeQuery(q4);
                                            while (rs4.next()) {
                                                System.out.println("alo");
                                        %> 
                                        <a class="dropdown-item" onclick="return filtrar('<%=rs4.getString("eti_nom")%>')"><%=rs4.getString("eti_nom")%></a>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </article>
                    <!--Este artículo es obligatorio-->

                    <!--Primeros 2-5 artículos deben de ser generados por ESTE jsp-->

                    <%
                        Statement st = null;
                        ResultSet rs = null;
                        Statement st2 = null;
                        ResultSet rs2 = null;
                        Statement st3 = null;
                        ResultSet rs3 = null;
                        int id = 4;
                        int pub_id = 0;
                        int votos = 0;
                        String q = "", q2 = "", qinf = "", qinf2 = "";
                        try {
                            con = Operaciones.getConnection();
                            st = con.createStatement();
                            st2 = con.createStatement();
                            if (request.getParameter("filter") != null) {
                                switch (request.getParameter("filter").toString()) {
                                    case "votos":
                                        q = "SELECT MPublicacion.* "
                                                + "FROM MPublicacion, DPublicacion "
                                                + "WHERE DPublicacion.pub_id = MPublicacion.pub_id AND DPublicacion.typ_id != 3 "
                                                + "ORDER BY DPublicacion.pub_vot DESC "
                                                + "LIMIT 4;";
                                        q2 = "SELECT * FROM "
                                                + "DPublicacion WHERE typ_id != 3 "
                                                + "ORDER BY pub_vot DESC "
                                                + "LIMIT 4;";
                                        qinf = "SELECT @row_number:=@row_number+1 AS row_number, MPublicacion.* "
                                                + "FROM MPublicacion, DPublicacion "
                                                + "WHERE DPublicacion.pub_id = MPublicacion.pub_id AND DPublicacion.typ_id != 3 AND row_number = ? "
                                                + "ORDER BY DPublicacion.pub_vot DESC "
                                                + "LIMIT 4;";
                                        qinf2 = "SELECT @row_number:=@row_number+1 AS row_number, * FROM "
                                                + "DPublicacion WHERE typ_id != 3 AND row_number= ? "
                                                + "ORDER BY pub_vot DESC "
                                                + "LIMIT 4;";
                                        break;
                                    case "fecha":
                                        q = "SELECT MPublicacion.* "
                                                + "FROM MPublicacion, DPublicacion "
                                                + "WHERE DPublicacion.pub_id = MPublicacion.pub_id AND DPublicacion.typ_id != 3 "
                                                + "ORDER BY DPublicacion.pub_dat DESC "
                                                + "LIMIT 4;";
                                        q2 = "SELECT * "
                                                + "FROM DPublicacion "
                                                + "WHERE typ_id != 3 "
                                                + "ORDER BY pub_dat DESC "
                                                + "LIMIT 4;";
                                        qinf = "SELECT @row_number:=@row_number+1 AS row_number, MPublicacion.* "
                                                + "FROM MPublicacion, DPublicacion "
                                                + "WHERE DPublicacion.pub_id = MPublicacion.pub_id AND DPublicacion.typ_id != 3 AND row_num = ? "
                                                + "ORDER BY DPublicacion.pub_dat DESC "
                                                + "LIMIT 4;";
                                        qinf2 = "SELECT @row_number:=@row_number+1 AS row_number, * "
                                                + "FROM DPublicacion "
                                                + "WHERE typ_id != 3 AND row_num = ? "
                                                + "ORDER BY pub_dat DESC "
                                                + "LIMIT 4;";
                                        break;
                                    case "noticias":
                                        q = "SELECT MPublicacion.* "
                                                + "FROM MPublicacion, DPublicacion "
                                                + "WHERE DPublicacion.pub_id = MPublicacion.pub_id AND DPublicacion.typ_id = 2 "
                                                + "LIMIT 4;";
                                        q2 = "SELECT * "
                                                + "FROM DPublicacion "
                                                + "WHERE typ_id = 2 "
                                                + "LIMIT 4;";
                                        qinf = "SELECT @row_number:=@row_number+1 AS row_number, MPublicacion.* "
                                                + "FROM MPublicacion, DPublicacion "
                                                + "WHERE DPublicacion.pub_id = MPublicacion.pub_id AND DPublicacion.typ_id = 2 AND row_num = ? "
                                                + "LIMIT 4;";
                                        qinf2 = "SELECT @row_number:=@row_number+1 AS row_number, * "
                                                + "FROM DPublicacion "
                                                + "WHERE typ_id = 2 AND row_num = ? "
                                                + "LIMIT 4;";
                                        break;
                                    default:
                                        q = "SELECT MPublicacion.* FROM MPublicacion, DPublicacion, EPublicacionEtiqueta, CEtiquetas "
                                                + "WHERE DPublicacion.pub_id = MPublicacion.pub_id AND "
                                                + "MPublicacion.pub_id = EPublicacionEtiqueta.pub_id AND "
                                                + "CEtiquetas.eti_id = CEtiquetas.eti_id AND "
                                                + "DPublicacion.typ_id != 3 AND "
                                                + "CEtiquetas.eti_nom = '" + request.getParameter("filter").toString() + "' "
                                                + "ORDER BY DPublicacion.typ_id DESC LIMIT 4;";
                                        q2 = "SELECT DPublicacion.* FROM DPublicacion, EPublicacionEtiqueta, CEtiquetas "
                                                + "WHERE DPublicacion.pub_id = EPublicacionEtiqueta.pub_id AND "
                                                + "CEtiquetas.eti_id = CEtiquetas.eti_id AND "
                                                + "DPublicacion.typ_id != 3 AND "
                                                + "CEtiquetas.eti_nom = '" + request.getParameter("filter").toString() + "' "
                                                + "ORDER BY DPublicacion.typ_id DESC LIMIT 4;";
                                        qinf = "SELECT @row_number:=@row_number+1 AS row_number, MPublicacion.* FROM MPublicacion, DPublicacion, EPublicacionEtiqueta, CEtiquetas "
                                                + "WHERE DPublicacion.pub_id = MPublicacion.pub_id AND "
                                                + "MPublicacion.pub_id = EPublicacionEtiqueta.pub_id AND "
                                                + "CEtiquetas.eti_id = CEtiquetas.eti_id AND "
                                                + "DPublicacion.typ_id != 3 AND "
                                                + "CEtiquetas.eti_nom = '" + request.getParameter("filter").toString() + "' AND "
                                                + "row_num = ? "
                                                + "ORDER BY DPublicacion.typ_id DESC LIMIT 4;";
                                        qinf2 = "SELECT @row_number:=@row_number+1 AS row_number, DPublicacion.* FROM DPublicacion, EPublicacionEtiqueta, CEtiquetas "
                                                + "WHERE DPublicacion.pub_id = EPublicacionEtiqueta.pub_id AND "
                                                + "CEtiquetas.eti_id = CEtiquetas.eti_id AND "
                                                + "DPublicacion.typ_id != 3 AND "
                                                + "CEtiquetas.eti_nom = '" + request.getParameter("filter").toString() + "' AND "
                                                + "row_num = ? "
                                                + "ORDER BY DPublicacion.typ_id DESC LIMIT 4;";
                                }
                            } else {
                                q = "SELECT MPublicacion.* "
                                        + "FROM MPublicacion, DPublicacion "
                                        + "WHERE DPublicacion.pub_id = MPublicacion.pub_id AND DPublicacion.typ_id != 3 "
                                        + "LIMIT 4;";
                                q2 = "SELECT * "
                                        + "FROM DPublicacion "
                                        + "WHERE typ_id != 3 "
                                        + "LIMIT 4;";
                                qinf = "SELECT @row_number:=@row_number+1 AS row_number, MPublicacion.* "
                                        + "FROM MPublicacion, DPublicacion "
                                        + "WHERE DPublicacion.pub_id = MPublicacion.pub_id AND DPublicacion.typ_id != 3 AND row_num = ? "
                                        + "LIMIT 4;";
                                qinf2 = "SELECT @row_number:=@row_number+1 AS row_number, * "
                                        + "FROM DPublicacion "
                                        + "WHERE typ_id != 3 AND row_num = ? "
                                        + "LIMIT 4;";
                            }
                            rs = st.executeQuery(q);
                            rs2 = st2.executeQuery(q2);
                            while (rs.next() && rs2.next()) {
                                String tit = rs.getString("pub_tit");
                                String txt = rs2.getString("pub_txt");
                                pub_id = rs.getInt("pub_id");
                                String q3 = "SELECT CEtiquetas.eti_nom AS `nombre` FROM CEtiquetas, EPublicacionetiqueta WHERE CEtiquetas.eti_id = EPublicacionetiqueta.eti_id AND EPublicacionetiqueta.pub_id = " + pub_id + ";";
                                st3 = con.createStatement();
                                rs3 = st3.executeQuery(q3);
                                String etiqueta_nom = "";
                                if (rs3.next()) {
                                    etiqueta_nom = rs3.getString("nombre");
                                }
                                String nom_usuario = op.getNombreUser(pub_id);
                                votos = rs2.getInt("pub_vot");
                                if (rs2.getInt("typ_id") != 3) {


                    %>
                    <article class="container borderSimple">
                        <header class="row color2">
                            <div class="col-l2">
                                <h5 class="text-center"><%=tit%> de <%=nom_usuario%></h5>
                                <%
                                    if (!etiqueta_nom.equals("")) {
                                %>
                                <br>
                                <h6 class="small"><%=etiqueta_nom%></h6>
                                <%
                                    }
                                %>
                            </div>
                            <div class="btn-request" data-toggle="modal" data-target="#userModal">
                                <button type="button" class="btn btn-request" onclick="return setId(<%=pub_id%>)">Reportar</button>
                            </div>
                            <%
                                if (Integer.parseInt(session.getAttribute("usr_id").toString()) < 3) {
                            %>
                            <div  class="btn-request" data-toggle="modal" data-target="#eliminarModal">
                                <button type="button" class="btn btn-request" onclick="return setId(<%=pub_id%>)">Eliminar</button>
                            </div>
                            <%
                            } else {
                                if (Integer.parseInt(session.getAttribute("usr_id").toString()) == rs.getInt("usr_id")) {
                            %>
                            <div  class="btn-request" data-toggle="modal" data-target="#eliminarModal">
                                <button type="button" class="btn btn-request" onclick="return setId(<%=pub_id%>)">Eliminar</button>
                            </div>
                            <%
                                    }
                                }
                            %>
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
                                        <button type="button" class="btn btn-primary" onclick="return eliminar()">Reportar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="eliminarModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="userModalLabel">¿Seguro que quieres eliminar?</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-4">
                                                <div class="list-group" id="list-tab" role="tablist">
                                                    <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">¿Podre ver de nuevo la publicacion?</a>
                                                    <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">¿Puedo eliminar una publicacion que no me pertenece?</a>
                                                </div>
                                            </div>
                                            <div class="col-8">
                                                <div class="tab-content" id="nav-tabContent">
                                                    <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list"><p>Velit aute mollit ipsum ad dolor consectetur nulla officia culpa adipisicing exercitation fugiat tempor. Voluptate deserunt sit sunt nisi aliqua fugiat proident ea ut. Mollit voluptate reprehenderit occaecat nisi ad non minim tempor sunt voluptate consectetur exercitation id ut nulla. Ea et fugiat aliquip nostrud sunt incididunt consectetur culpa aliquip eiusmod dolor. Anim ad Lorem aliqua in cupidatat nisi enim eu nostrud do aliquip veniam minim.</p></div>
                                                    <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list"><p>Cupidatat quis ad sint excepteur laborum in esse qui. Et excepteur consectetur ex nisi eu do cillum ad laborum. Mollit et eu officia dolore sunt Lorem culpa qui commodo velit ex amet id ex. Officia anim incididunt laboris deserunt anim aute dolor incididunt veniam aute dolore do exercitation. Dolor nisi culpa ex ad irure in elit eu dolore. Ad laboris ipsum reprehenderit irure non commodo enim culpa commodo veniam incididunt veniam ad.</p></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Mejor no quiero eliminar</button>
                                        <button type="button" class="btn btn-primary" onclick="return eliminarPub()">Si, quiero eliminarla.</button>
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
                                        <i><%=votos%></i>
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
                                    <i><%=votos%></i>
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
                        con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    %>
                    <p>Murió <%=e%></p>
                    <%
                        } finally {
                            try {
                                con.close();
                            } catch (SQLException ex) {
                                Logger.getLogger(Operaciones.class.getName()).log(Level.SEVERE, null, ex);
                            }
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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script type="text/javascript">
                                        $(document).ready(function () {
                                            $(window).scroll(function () {
                                                if ($(window).scrollTop() == $(document).height() - $(window).height()) {
                                                    $.get("InfinitContentServlet", {counted:<%=id%>, q: `<%=qinf%>`, q2: `<%=qinf2%>`}, function (data) {
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
        <script src="js/funciones.js" type="text/javascript"></script>
    </body>
</html>
