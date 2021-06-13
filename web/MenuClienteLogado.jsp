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
            body {
                
                margin:0;
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
                top: -48px;
            }
            
            .menu {
                position:relative;
                margin-left: 250px;
                margin-top:-60px;
            }
            
            li {
                display:inline-block;
                color: #798b52;
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
            
            .dadosLogados {
                float:right;
                color: #798b52;
                font-family: 'Nanum Brush Script', cursive;
                font-size: 24px;
            }
            
            
            
            .emailLogado {
                margin-right: 10px;
            }
        </style>
    <body>
        <%
            String emailLogado = (String) String.valueOf(session.getAttribute("email"));
            String codigoUsuario = (String) String.valueOf(session.getAttribute("codigoUsuario"));
            
        %>
        <header class="cabecalho">
            <div class="logo">
                <a href="paginaPrincipalLoginCliente.jsp">
                    <img src="LogoSemFundo.png" alt="Logo" width="250px" height="150px" />
                </a>
            </div>
            <nav class="menu">
                <ul>
                    <li>
                        <a href="BuscarDados?codigo=<%=Integer.valueOf(codigoUsuario)%>">Perfil</a>
                    </li>
                    <li>
                        <a href="paginaPrincipalLoginCliente.jsp">Cardápio</a>
                    </li>
                    <li>
                        <a href="listagemPedidos.jsp?codigoCli=<%=Integer.valueOf(codigoUsuario)%>">Meus Pedidos</a>
                    </li>
                    <div class="dadosLogados">
                        <li class="emailLogado">
                            <%=emailLogado%>
                        </li>
                        <li>
                            <a href="logout.jsp"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-door-open" viewBox="0 0 16 16">
                                            <path d="M8.5 10c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1z"/>
                                            <path d="M10.828.122A.5.5 0 0 1 11 .5V1h.5A1.5 1.5 0 0 1 13 2.5V15h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117zM11.5 2H11v13h1V2.5a.5.5 0 0 0-.5-.5zM4 1.934V15h6V1.077l-6 .857z"/>
                                        </svg> Sair </a>
                        </li>
                    </div>
                </ul>
            </nav>
        </header>
    </body>
</html>
