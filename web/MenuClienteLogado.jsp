<%-- 
    Document   : MenuClienteLogado
    Created on : 01/06/2021, 22:51:35
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
            .cabecalho {
                background-color: #798b52;
                padding:5px;
                border-bottom: 3px solid #f5f4f3;
                position:relative;
                margin:0;
            }

            .logo {
                position:relative;
                height: 80px;
                width: 200px;
                margin-left:0px;
            }
            
            .menu {
                position:relative;
                margin-left: 250px;
                margin-top:-60px;
            }
            
            li {
                display:inline-block;
                color: #f5f4f3;
                padding: 10px;
                font-family: 'Nanum Brush Script', cursive;
            }
            
            li:hover {
                background-color:#dfb649;
            }
            
            a {
                display:inline-block;
                text-decoration: none;
                font-size: 24px;
                color:#f5f4f3;
            }
            li>a:hover {
                color:#2d2c28;
            }
        </style>
    <body>
        <%
            String emailLogado = (String) String.valueOf(session.getAttribute("email"));
        %>
        <header class="cabecalho">
            <div class="logo">
                <a href="index.jsp">
                    <img src="Logo.png" alt="Logo" width="200px" height="80px" />
                </a>
            </div>
            <nav class="menu">
                <ul>
                    <li>
                        <a href="index.jsp">Início</a>
                    </li>
                    <li>
                        <a href="#cursos"> Destaques </a>
                    </li>
                    <li>
                        <a href="#sobre">Sobre</a>
                    </li>
                    <li>
                        <a href="#contato">Contato</a>
                    </li>
                    <li>
                        <%=emailLogado%>
                    </li>
                </ul>
            </nav>
        </header>
    </body>
</html>
