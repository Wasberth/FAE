<%-- 
    Document   : log-ouot
    Created on : 19/05/2020, 05:34:45 PM
    Author     : PORTO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cerrando sesion...</title>
    </head>
    <body>
<%
        
        HttpSession sesion = request.getSession();
        String usuario;
        String nivel;
        
        if(sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null){
            usuario = sesion.getAttribute("user").toString();
            nivel = sesion.getAttribute("nivel").toString();
                                        response.sendRedirect("index.jsp");
                                        System.out.println("llegue al log "+usuario);
        }else{
            out.append("<script>location.replace['index.jsp'];</script>");
        }
        out.append("Espera estamos cerrando tu sesión");
        
        %>    </body>
</html>
