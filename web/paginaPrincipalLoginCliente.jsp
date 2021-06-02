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
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
        <style>
            body {
                margin: 0;
                background-color: #798b52;
            }
        </style>
        <title>Bem-Vindo à Zima </title>
    </head>
    <body>
        <%
            //Trecho de código responsável por bloquear o acesso de quem tente acessar a página sem estar logado
            //Faz a comparação do email da sessao com a string "null" e se der true envia o usuário para a index novamente
            String email = (String) String.valueOf(session.getAttribute("email"));
            
            if(email.equals("null")) {
                String redirectURL = "index.jsp";
                response.sendRedirect(redirectURL);
            }
            

        %>
        <%@include file="MenuClienteLogado.jsp"%> 
        
    </body>
</html>
