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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
        <style>
            body {
                margin: 0;
                background-color: #798b52;
            }
            
            .fonte {
                color: #dfb649;
                font-family: 'Nanum Brush Script', cursive;
                font-size: 2.5em;
            }
            
            .fonteBranco {
                color: #f5f4f3;
            }
            
            .jumbotromMeu {
                background-color:#798b52;
                size: 900px;
            }
            
            
            
            .curso {
                display: inline-block;
                box-sizing:border-box;
                padding: 5px;
                border: 1px solid #dfb649;
                width: 265px;
                height: 300px;
                margin: 10px;
            }
            
            .curso:hover {
                 box-shadow:4px 4px 4px 4px #2d2c28;
                 transition: 1s;
            }

            .curso-info{
                position: relative;
                display: block;
                font-size: 1.2em;
            }
        
            .curso img {
                width: 100%;
            }
            
            .cardapio {
                margin-left: 80px;
            }
            
            .posicionamentoBebidas {
                margin-left: 90px;
            }
            
            li > a {
                text-decoration: none;
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
        
        <div class="jumbotron jumbotron-fluid jumbotromMeu">
            <div class="container fundoJumbotron">
                <h1 class="fonte"> Cardápio </h1> <br/>
                    <h2 class="fonte"> Sanduíches </h2>
                <div class="cardapio">
                    <div class="curso">
                        <img src="sanduiche1.jpg" height="150"/>
                        <div class="curso-info fonteBranco">
                            <h4 class="">Sanduíche Um</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed rutrum </p>
                        </div>
                    </div>
                    
                    <div class="curso">
                        <img src="sanduiche2.jpg" height="150"/>
                        <div class="curso-info fonteBranco">
                            <h4>Sanduíche Dois</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed rutrum </p>
                        </div>
                    </div>
                    
                    <div class="curso">
                        <img src="sanduiche3.jpg" height="150"/>
                        <div class="curso-info fonteBranco">
                            <h4>Sanduíche Três</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed rutrum </p>
                        </div>
                    </div>
                    
                    <div class="curso">
                        <img src="sanduiche4.jpg" height="150"/>
                        <div class="curso-info fonteBranco">
                            <h4>Sanduíche Quatro</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed rutrum </p>
                        </div>
                    </div>
                    
                    <div class="curso">
                        <img src="sanduiche5.jpg" height="150"/>
                        <div class="curso-info fonteBranco">
                            <h4>Sanduíche Cinco</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed rutrum </p>
                        </div>
                    </div>
                    
                    <div class="curso">
                        <img src="sanduiche6.jpg" height="150"/>
                        <div class="curso-info fonteBranco">
                            <h4>Sanduíche Seis</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed rutrum </p>
                        </div>
                    </div> <br/> <br/>
               
                </div>
                <h2 class="fonte"> Bebidas </h2> 
                <p class="fonteBranco posicionamentoBebidas"> Não se preocupe, todos os sanduíches incluem uma lata 350ml de Coca-Cola ou Guaraná Antártica :), à sua escolha. </p>
            </div>
        </div>
    </body>
</html>
