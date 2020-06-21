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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
        HttpSession sesion = request.getSession();
        if(Integer.parseInt(sesion.getAttribute("nivel").toString()) < 3){
%>
    
        <h1>Estás en la página de consejeros (Todavia no tiene diseño)</h1>
        <br>
        <a href="ConsultarUsers.jsp">Consultar usuarios</a>
        <a href="PubsUsers.jsp">Listar publicaciones de usuarios</a>

        <section>
                <table class="table table-hover" >
                <thead>
                    <tr>
                        <th>Usuario ID</th>
                        <th>Username</th>
                        <th>Nombre</th>
                        <th>Apellido Paterno</th>
                        <th>Apellido Materno</th>
                        <th>Nivel</th>
                        <th>Modificar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <%
                            LinkedList<Usuario> lista = ConsultaBD.getConsejeros();
                            for (int i = 0; i < lista.size(); i++) {
                        %>
                    <tr>
                        <td><input id="id <%=lista.get(i).getUsr_id()%>" disabled type="text"  value="<%=lista.get(i).getUsr_id()%>"></td>
                        <td><input id="tag <%=lista.get(i).getUsr_id()%>" disabled type="text"   value="<%=lista.get(i).getUsr_tag()%>"></td>
                        <td><input id="nom <%=lista.get(i).getUsr_id()%>" disabled type="text"  value="<%=lista.get(i).getUsr_nom()%>"></td>
                        <td><input id="app <%=lista.get(i).getUsr_id()%>" disabled type="text"  value="<%=lista.get(i).getUsr_app()%>"></td>
                        <td><input id="apm <%=lista.get(i).getUsr_id()%>" disabled type="text"   value="<%=lista.get(i).getUsr_apm()%>"></td>
                        <td><input id="niv <%=lista.get(i).getUsr_id()%>" disabled type="number"   value="<%=lista.get(i).getUsr_niv()%>"></td>
                        <td>
                            <form id="form <%=lista.get(i).getUsr_id()%>" method="POST" action="saveUsrChanges.jsp">
                                <input id="input tag <%=lista.get(i).getUsr_id()%>" name="usr_tag" type="hidden">
                                <input id="input nom <%=lista.get(i).getUsr_id()%>" name="usr_nom" type="hidden">
                                <input id="input app <%=lista.get(i).getUsr_id()%>" name="usr_app" type="hidden">
                                <input id="input apm <%=lista.get(i).getUsr_id()%>" name="usr_apm" type="hidden">
                                <input id="input niv <%=lista.get(i).getUsr_id()%>" name="usr_niv" type="hidden">
                                <input id="<%=lista.get(i).getUsr_id()%>" value="<%=lista.get(i).getUsr_id()%>" name="usr_id" type="hidden">
                                <input id="input <%=lista.get(i).getUsr_id()%>" class="editar" type="button" value="Editar" onclick="(function () {
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
                                <input id="submit <%=lista.get(i).getUsr_id()%>" type="button" hidden name="action" value="Guardar cambios" onclick="(function () {
                                            document.getElementById('input tag <%=lista.get(i).getUsr_id()%>').value = document.getElementById('tag <%=lista.get(i).getUsr_id()%>').value;
                                            document.getElementById('input nom <%=lista.get(i).getUsr_id()%>').value = document.getElementById('nom <%=lista.get(i).getUsr_id()%>').value;
                                            document.getElementById('input app <%=lista.get(i).getUsr_id()%>').value = document.getElementById('app <%=lista.get(i).getUsr_id()%>').value;
                                            document.getElementById('input apm <%=lista.get(i).getUsr_id()%>').value = document.getElementById('apm <%=lista.get(i).getUsr_id()%>').value;
                                            document.getElementById('input niv <%=lista.get(i).getUsr_id()%>').value = document.getElementById('niv <%=lista.get(i).getUsr_id()%>').value;
                                            document.getElementById('form <%=lista.get(i).getUsr_id()%>').submit();
                                        })()">
                                <input id="cancel <%=lista.get(i).getUsr_id()%>" type="button" hidden value="Cancelar" onclick="(function () {
                                            location.reload();
                                        })()">
                            </form>
                        </td>
                        <td>
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
<%
        }else{
              response.sendRedirect("errorPage.jsp");
         }
%>
    </body>
</html>
