<%-- 
    Document   : loginUsers
    Created on : 5/05/2020, 07:20:51 PM
    Author     : PORTO
--%>

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
        <%HttpSession sesion = request.getSession();%>
        <script>

            /*function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
             console.log('statusChangeCallback');
             console.log(response);                   // The current login status of the person.
             if (response.status === 'connected') {
             testAPI();
             var nombre = response.name;
             console.log(response.name);
             window.location.replace("http://localhost:8083/FAEv1.0/MainPage.jsp"); //CAMBIAR EL PUERTO 
             
             } else {                                 // Not logged into your webpage or we are unable to tell.
             document.getElementById('status').innerHTML = 'Please log ' +
             'into this webpage.';
             }
             }
             
             
             function checkLoginState() {               // Called when a person is finished with the Login Button.
             FB.getLoginStatus(function(response) {   // See the onlogin handler
             statusChangeCallback(response);
             });
             }
             
             
             window.fbAsyncInit = function() {
             FB.init({
             appId      : '694562511355243',
             cookie     : true,                     // Enable cookies to allow the server to access the session.
             xfbml      : true,                     // Parse social plugins on this webpage.
             version    : '{api-version}'           // Use this Graph API version for this call.
             });
             
             
             FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.
             statusChangeCallback(response);        // Returns the login status.
             });
             };
             
             
             (function(d, s, id) {                      // Load the SDK asynchronously
             var js, fjs = d.getElementsByTagName(s)[0];
             if (d.getElementById(id)) return;
             js = d.createElement(s); js.id = id;
             js.src = "https://connect.facebook.net/en_US/sdk.js";
             fjs.parentNode.insertBefore(js, fjs);
             }(document, 'script', 'facebook-jssdk'));
             
             
             function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
             console.log('Welcome!  Fetching your information.... ');
             FB.api('/me', function(response) {
             console.log('Successful login for: ' + response.name);
             document.getElementById('status').innerHTML =
             'Thanks for logging in, ' + response.name + '!';
             
             });
             }*/

        </script> <%--Codigo login Fb no funciona--%>


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
                        <div id="fb-root"></div>
                        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/es_ES/sdk.js#xfbml=1&version=v7.0&appId=694562511355243&autoLogAppEvents=1"></script>

                        <div class="fb-login-button" data-size="large" data-button-type="login_with" data-layout="rounded" data-auto-logout-link="false" data-use-continue-as="true" data-width=""></div>

                        <div id="status">

                        </div>
                        <br>
                        <div class="g-signin2" data-onsuccess="onSignIn"></div>
                        <script><!--OBTENER PARAMETROS DE GOOGLE LOGIN-->
                                function onSignIn(googleUser) {
                                    var profile = googleUser.getBasicProfile();
                                    console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
                                    console.log('Name: ' + profile.getName());
                                    console.log('Image URL: ' + profile.getImageUrl());
                                    console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
                                    var nombre = profile.getName();
                                    var img_user = profile.getImageUrl();
                                    var email_user = profile.getEmail();
                                    //FALTA HACER OBJETO SESION DONDE LE PASEN LOS PARAMETROS DE NOMBRE, IMG, EMAIL
                                    window.location.replace("http://localhost:8083/FAEv1.0/MainPage.jsp"); //CAMBIAR EL PUERTO 
                                }
                            </script>
                            
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
                                        response.sendRedirect("indexAdmin.jsp");
                                        break;

                                    case 2:
                                        sesion.setAttribute("user", nomUser);
                                        sesion.setAttribute("nivel", "2");
                                        response.sendRedirect("MainPage.jsp");
                                        break;

                                    case 3:
                                        sesion.setAttribute("user", nomUser);
                                        sesion.setAttribute("nivel", "3");
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
                            }//cierra if
                            if (request.getParameter("cerrar") != null) {
                                session.invalidate();
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