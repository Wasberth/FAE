<%-- 
    Document   : PubsUsers
    Created on : 11/06/2020, 01:20:12 AM
    Author     : tutus
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="controlador.Operaciones"%>
<%@page import="java.sql.Connection"%>
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
        if(sesion.getAttribute("nivel")=="2"){
%>
    
        <h1>Estás en la página de consejeros (Todavia no tiene diseño)</h1>
        <br>
        <a href="ConsultarUsers.jsp">Consultar usuarios</a>
        <a href="PubsUsers.jsp">Listar publicaciones de usuarios</a>

        <section>
                <center>
                    <div>
                        <hr>
                        <table>
                            <thead>
                                <tr>
                                    <th>ID publicacion</th>
                                    <th>Titulo</th>
                                    <th>Cuerpo</th>
                                    <th>Fecha y hora de publicacion</th>
                                    <th>Numero de votos</th>
                                </tr>
                            </thead>
                            <tbody>
<%
        Connection con = Operaciones.getConnection();
        Statement st = con.createStatement();
        Statement st2 = con.createStatement();
        ResultSet rs,rs2;
        int[] id = new int[0];
        
        try{
            
            String q = "Select * from mpublicacion";
            String q2 = "Select * from dpublicacion";
            rs = st.executeQuery(q);
            rs2 = st2.executeQuery(q2);
            int i = 0;
            while(rs.next() && rs2.next()){
                id[i]=rs.getInt(1);
%>                                
                                <tr>
                                    <td><%=rs.getInt(1) %></td>
                                    <td><%=rs.getString(2) %></td>
                                    <td><%=rs2.getString(3) %></td>
                                    <td><%=rs2.getDate(4)%> &nbsp; &nbsp; <%=rs2.getTime(4)%></td>
                                    <td><%=rs2.getInt(5) %></td>
                                </tr>
<%
            i++;
            }

            rs.close();
            st.close();
            con.close();

        }catch(Exception e){

            System.out.println("Error, Fallo de conexion con la BD");
            System.out.println(e.getMessage());
            e.printStackTrace();
        }

%>           
                            </tbody>
                        </table>
                        <p>Eliminar publicacion por id</p>
                        <form action="consOps" method="POST">
                            <select name="idpub">
<%
                        for (int i = 0; i < id.length; i++) {
                            int idopt = id[i];
%>
                            <option value="<%=idopt%>"> <%=idopt%> </option>
<%
                        }
%>
                            </select>
                            <input type="submit" name="action" value="Eliminar publicacion">
                        </form>
                    </div>
                </center>
            </section>
<%
        }else{
              response.sendRedirect("errorPage.jsp");
         }
%>
    </body>
</html>

