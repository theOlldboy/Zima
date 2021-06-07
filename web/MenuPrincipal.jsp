<%-- 
    Document   : MenuPrincipal
    Created on : 29/05/2021, 12:53:53
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
                background-color: #798b52;
            }

            .cabecalho {
                background-color: #2d2c28;
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
                top: -32px;
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
            
            
            
            a {
                display:inline-block;
                text-decoration: none;
                font-size: 24px;
                color:#798b52;
                margin:0;
                padding:0;
            }
            li>a:hover {
                color:#f5f4f3;
                text-decoration: none;
            }
        </style>
    <body>
        <header class="cabecalho">
            <div class="logo">
                <a href="index.jsp">
                    <img src="LogoSemFundo.png" alt="Logo" width="250px" height="150px" />
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
                </ul>
            </nav>
        </header>
    </body>
</html>
