<%-- 
    Document   : publication
    Created on : 8/05/2020, 01:23:24 AM
    Author     : david
--%>


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
                    <form id="publicacion" action="publication.jsp" method="post">
                        <div class="form-group">
                            <select class="form-control" id="exampleFormControlSelect1" form="publicacion" name="categoria" placeholder="Elije una categoría">
                                <option>Profesores</option>
                                <option>Directivos</option>
                                <option>Personal</option>
                                <option>Policias</option>
                                <option>Mobiliario</option>
                                <option>Canchas</option>
                                <option>Cafetería</option>
                                <option>Papeleria</option>
                                <option>Baños</option>
                            </select>

                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <label class="sr-only" for="user">Título</label>
                                <div class="input-group-prepend">
                                    <div class="input-group-text"><i class="fas fa-quote-left"></i></div>
                                </div>
                                <input type="text" class="form-control" required name="titulo" placeholder="Título">
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
                                <textarea form="publicacion" class="form-control" placeholder="Tu publicación" name="cuerpo"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-primary" value="Publicar" name="btnpublicar">
                        </div>
                    </form>
                </div>
                <div class="clearfix"></div>
                <%
                        String DRIVER = "com.mysql.jdbc.Driver";
                        Class.forName(DRIVER).newInstance();
                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;
                        Statement st2 = null;
                        ResultSet rs2 = null;
                        int id=4;
                        try {
                            String url = "jdbc:mysql://localhost:3306/db_faev1?user=root&password=n0m3l0";
                            con = DriverManager.getConnection(url);
                            String category = request.getParameter("categoria");
                            String titulo = request.getParameter("titulo");
                            String cuerpo = request.getParameter("cuerpo");
                            st = con.createStatement();
                            st2 = con.createStatement();
                            String q = "INSERT INTO MPublicacion values(titulo,cuerpo)";//agregar a la tabla la categoria
                            String q2 = "INSERT INTO DPublicacion values()";
                            rs = st.executeQuery(q);
                            rs2 = st2.executeQuery(q2);
                            while (rs.next() && rs2.next()) {
                                String tit = rs.getString("pub_tit");
                                String txt = rs.getString("pub_txt");
                            }
                        } catch(Exception e){
                                    
                        }
                    %>
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