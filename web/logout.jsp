<%-- 
    Document   : logout
    Created on : 03/06/2021, 10:14:53
    Author     : Joao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
         session.removeAttribute("email");
         response.sendRedirect("index.jsp");
        %>
    </body>
</html>
