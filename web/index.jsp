<%-- 
    Document   : index
    Created on : 21/05/2021, 21:37:11
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

            .logoAbaixo {
                display: block;
                position: relative;
                left: 100px;
                top: -250;
            }

            .demonstracao {
                position: relative;
                width: 100%;
            }

            .imgProd {
                position: ralative;
                display: inline-block;
                margin:0;
                padding:0;
                opacity:75%;
            }

            .imgProd:hover {
                background-color:#f5f4f3;
                opacity:100%;
                transition:1s;
            }

            .titulo {
                width: 400px;
                margin-left: 80px;
                margin-top: 100px;
            }
            .paragrafo {
                font-size: 2.5em;
                color: #f5f4f3;
                font-family: 'Nanum Brush Script', cursive;
            }

            .login {
                align-items: center;
                box-sizing: content-box;
                position: relative;
                margin-left: 1100px;
                top: -230px;
                font-size: 1.8em;
                font-family: 'Nanum Brush Script', cursive;
            }

            .paragrafoLogin {
                color: #dfb649;
                font-size: 1.4em;
                margin-left: 90px;
            }


            .botaoLogin {
                width:247px;
                background-color:#dfb649;
                color: #2d2c28;
                font-family: 'Nanum Brush Script', cursive;
                border-radius: 20px;
                border: none;
                box-shadow: 3px  3px #2d2c28;
            }

            .botaoTexto {
                font-family: 'Nanum Brush Script', cursive;
                font-size: 20px;
            }

            .conteudoLogin input {
                border-radius: 15px;
                padding: 5px;
                border: none;
            }

            .textoLinksAlternativos {
                font-size: 22px;
                text-decoration: none;
                color: #dfb649;
                margin-left: 8px;
            }

            .textoLinksAlternativos:hover {
                text-decoration:underline;
            }
            
        </style>
        
        <script>
        function validarLogin(){
            if(document.formLogin.email.value==""){
                alert("Campo Usuário Não Informado");  
                return false;
            } 
            if(document.formLogin.senha.value==""){ 
                alert("Campo Senha Não Informado");
                return false;
            } 
            document.formLogin.submit();
        }
        </script>
    </head>
    <%@include file="MenuPrincipal.jsp"%> 
    <body>
        <div class="demonstracao">
            <span class="imgProd"> <img src="sanduiche1.jpg" height="200" width="395"></span><span class="imgProd"><img src="sanduiche2.jpg" height="200" width="395"> </span><span class="imgProd"><img src="sanduiche3.jpg" height="200" width="395"> </span><span class="imgProd"><img src="sanduiche4.jpg" height="200" width="398"> </span>
        </div>
        <div class="titulo"> <br/>
            <div class="logoAbaixo">
                <img src="LogoAbaixo.png" width="150px" height="60px">
            </div> <br/>
            <p class="paragrafo">
                "Venha conhecer o primeiro restaurante inspirado na culinária cubana de Brasília"
            </p>
        </div>
        <div class="login">
            <form name="formLogin" action="loginUsuario" method="POST">
                <div class="conteudoLogin">
                  <p class="paragrafoLogin"> Login </p> 
                  <input type="text" placeholder="Usuário" name="email" size="30"> <br/>
                  <input type="password" placeholder="Senha" name="senha" size="30"> <br/> 
                  <a href="formCadastroClientes.jsp" class="textoLinksAlternativos"> Não possui uma conta ? Crie já! </a>  <br/>
                  <a href="#" class="textoLinksAlternativos"> Esqueceu sua senha ? Clique Aqui </a> 
                  <input type="button" class="botaoLogin botaoTexto" onclick="validarLogin()" value="Entrar">
                </div>
            </form>
        </div> <br/>
        <%@include file="rodaPe.jsp"%> 
    </body>
</html>
