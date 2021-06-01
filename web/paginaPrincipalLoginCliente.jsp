<%-- 
    Document   : paginaPrincipalLoginCliente
    Created on : 31/05/2021, 22:24:18
    Author     : Joao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página Inicial</title>
    </head>
    <body>
        <%
            String email = (String) session.getAttribute("email");
        %>
        <h1> <%=email%> </h1>
    </body>
</html>
