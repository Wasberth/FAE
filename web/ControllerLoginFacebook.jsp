<%-- 
    Document   : ControllerLoginFacebook
    Created on : 12/05/2020, 01:37:04 PM
    Author     : PORTO
--%>

<%@page import="controlador.Profile_Bean"%>
<%@page import="controlador.Profile_Modal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String access_token=(String)request.getParameter("access_token");
Profile_Modal obj_Profile_Modal=new Profile_Modal();
Profile_Bean obj_Profile_Bean= obj_Profile_Modal.call_me(access_token);
%>
Name : <%=obj_Profile_Bean.getUser_name() %><br>
Email : <%=obj_Profile_Bean.getEmail() %><br>
id : <%=obj_Profile_Bean.getId() %><br>
Profile Picture : <%=obj_Profile_Bean.getProfile_picture() %><br>
<img src="<%=obj_Profile_Bean.getProfile_picture() %>"></img>
</body>
</html>