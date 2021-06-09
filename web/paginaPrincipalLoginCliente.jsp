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
                
                background-color: #798b52;
            }
            
            .fonte {
                color: #dfb649;
                font-family: 'Nanum Brush Script', cursive;
                font-size: 2.5em;
            }
            
            .fonteValor {
                color: #dfb649;
                font-family: 'Nanum Brush Script', cursive;
                font-size: 1.8em;
                float:right;
            }
            
            .fonteTituloSanduiche {
                color: #dfb649;
                font-family: 'Nanum Brush Script', cursive;
                font-size: 1.8em;
                
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
                background-color:#2d2c28;
                box-sizing:border-box;
                padding: 5px;
                border: 2px solid #dfb649;
                width: 265px;
                height: 390px;
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
                    <form action="CarrinhoDeCompras">
                    <div class="curso">
                        <img src="sanduiche1.jpg" height="150"/>
                        <div class="curso-info fonteBranco">
                            <h4 class="fonteTituloSanduiche">Sanduíche Um</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed rutrum </p>
                            <p class="fonteValor"> R$ 14,99 </p>
                            <input type="number" name="Qtd1" />
                            <input type="hidden" name="codigo_produto" value="1">
                        </div>
                    </div>
                    
                    <div class="curso">
                        <img src="sanduiche2.jpg" height="150"/>
                        <div class="curso-info fonteBranco">
                            <h4 class="fonteTituloSanduiche">Sanduíche Dois</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed rutrum </p>
                            <p class="fonteValor"> R$ 15,99 </p>
                            <input type="number" name="Qtd2" />
                        </div>
                    </div>
                    
                    <div class="curso">
                        <img src="sanduiche3.jpg" height="150"/>
                        <div class="curso-info fonteBranco">
                            <h4 class="fonteTituloSanduiche">Sanduíche Três</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed rutrum </p>
                            <p class="fonteValor"> R$ 16,99 </p>
                            <input type="number" name="Qtd3" />
                        </div>
                    </div>
                    
                    <div class="curso">
                        <img src="sanduiche4.jpg" height="150"/>
                        <div class="curso-info fonteBranco">
                            <h4 class="fonteTituloSanduiche">Sanduíche Quatro</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed rutrum </p>
                            <p class="fonteValor"> R$ 17,99 </p>
                            <input type="number" name="Qtd4" />
                        </div>
                    </div>
                    
                    <div class="curso">
                        <img src="sanduiche5.jpg" height="150"/>
                        <div class="curso-info fonteBranco">
                            <h4 class="fonteTituloSanduiche">Sanduíche Cinco</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed rutrum </p>
                            <p class="fonteValor"> R$ 18,99 </p>
                            <input type="number" name="Qtd5" />
                        </div>
                    </div>
                    
                    <div class="curso">
                        <img src="sanduiche6.jpg" height="150"/>
                        <div class="curso-info fonteBranco">
                            <h4 class="fonteTituloSanduiche">Sanduíche Seis</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed rutrum </p>
                            <p class="fonteValor"> R$ 19,99 </p>
                            <input type="number" name="Qtd6" />
                        </div>
                    </div> <br/> <br/>
                    </form>
                </div>
                <h2 class="fonte"> Bebidas </h2> 
                <p class="fonteBranco posicionamentoBebidas"> Não se preocupe, todos os sanduíches incluem uma lata 350ml de Coca-Cola ou Guaraná Antártica :), à sua escolha. </p>
            </div>
        </div>
        <%@include file="rodaPe.jsp"%>
    </body>
</html>
