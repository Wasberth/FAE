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
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<img class="wave" src="img/wave.png">
	<div class="container">
		<div class="img">
			<img src="img/bg.svg">
		</div>
		<div class="login-content">
                    <form action="index.jsp" method="post">
				<img src="img/avatar.svg">
				<h2 class="title">Bienvenido</h2>
           		<div class="input-div one">
           		   <div class="i">
           		   		<i class="fas fa-user"></i>
           		   </div>
           		   <div class="div">
           		   		<h5>Usuario</h5>
                                        <input type="text" class="input" required name="user">
           		   </div>
           		</div>
           		<div class="input-div pass">
           		   <div class="i"> 
           		    	<i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
           		    	<h5>Password</h5>
           		    	<input type="password" class="input" required name="password"> 
            	   </div>
            	</div>
            	<a href="registrar.jsp">Eres nuevo? Registrate c:</a>
            	<input type="submit" class="btn" value="Login" name="btninicar">
            </form> 
                    
                     <%
                       Operaciones op = new Operaciones();
                       if(request.getParameter("btninicar")!=null){
                           String nomUser = request.getParameter("user");
                           String password = request.getParameter("password");
                           HttpSession sesion = request.getSession();
                           
                           switch(op.loguear(nomUser, password)){
                               case 1:
                                   sesion.setAttribute("user", nomUser);
                                   sesion.setAttribute("nivel", "1");
                                   response.sendRedirect("indexAdmin.jsp");
                               break;
                               
                               case 2:
                                   sesion.setAttribute("user", nomUser);
                                   sesion.setAttribute("nivel", "2");
                                   response.sendRedirect("indexUser.jsp");
                                break;
                                
                               case 3:
                                   sesion.setAttribute("user", nomUser);
                                   sesion.setAttribute("nivel", "3");
                                   response.sendRedirect("indexUser.jsp");
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
                       if(request.getParameter("cerrar")!=null){
                           session.invalidate();
                       }
                    %>
        </div>
    </div>
</body>
</html>