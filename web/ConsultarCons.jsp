<%-- 
    Document   : ConsultarCons
    Created on : 10/06/2020, 12:42:20 AM
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
        try{
        HttpSession sesion = request.getSession();
        
        
        if(sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null){
            String usuario = sesion.getAttribute("user").toString();
            String nivel = sesion.getAttribute("nivel").toString();
            out.append("<a href='log_out.jsp'?cerrar=true><h5>Cerrar Sesion "+usuario+"</h5></a>");    
        }else{
            response.sendRedirect("errorPage.jsp");
        }
        
        }catch(Exception e){
            response.sendRedirect("errorPage.jsp");
        }
        
        
        %>
        
        <section>
                <center>
                    <div>
                        <form action="Controler" method="POST">
                            <input type="submit" name="action" value="Ver Productos">
                            <input type="submit" name="action" value="Agregar Productos">
                        </form>
                        <hr>
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tag</th>
                                    <th>Nombre</th>
                                    <th>Apellido Paterno</th>
                                    <th>Apellido Materno</th>
                                    <th>Eliminar</th>
                                </tr>
                            </thead>
                            <tbody>
<%
        Connection con = Operaciones.getConnection();
        Statement st = con.createStatement();
        Statement st2 = con.createStatement();
        ResultSet rs,rs2;
        
        try{
            
            String q = "Select * from musuario where usr_id=2";
            String q2 = "Select * from dusuario where usr_id=2";
            rs = st.executeQuery(q);
            rs2 = st2.executeQuery(q2);
            int i = 1;
            String formu, iterator,identificador;
            while(rs.next() && rs2.next()){
                formu = "form"+i;
                iterator = "it"+i;
                identificador = "ident"+i;
%>                                
                                <tr>
                                    <td><%=rs.getInt(1) %></td>
                                    <td><%=rs.getString(2) %></td>
                                    <td><%=rs2.getString(2) %></td>
                                    <td><%=rs2.getFloat(3) %></td>
                                    <td><%=rs2.getInt(4) %></td>
                                    <td>
                                        <form action="adminOps" method="POST">
                                                <input type="hidden" name="<%=iterator%>" value="<%=i%>" >
                                                <input type="submit" name="action" value="Eliminar">
                                        </form>
                                    </td>
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
            System.out.println(e.getStackTrace());

        }

%>           
                            </tbody>
                        </table>
                    </div>
                </center>
            </section>
    </body>
</html>
