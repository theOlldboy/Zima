<%-- 
    Document   : formCadastroAdministrador
    Created on : 07/06/2021, 16:39:57
    Author     : Mathe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Administradores</title>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color:#798b52;
            }
            
            
            .logo {
                display: block;
                position: relative;
                margin-left: 650px;
            }
            
            .fundoJumbotron {
               background-color:#798b52;
;              margin-left: 350px;
            }
        
            .jumbotromMeu {
                background-color:#798b52;
                size: 450px;
            }
            
            .fonte {
                font-family: 'Nanum Brush Script', cursive;
                color: #dfb649;
            }
            
            input {
                border-radius: 15px;
                border: none;
                padding:2px;
                display: inline-block;
            }
            
            .botaoEnviar{
                width:535px;
                background-color:#dfb649;
                color: #2d2c28;
                border-radius: 20px;
                border: none;
                box-shadow: 3px  3px #2d2c28;
            }
        </style>
        <script>
            //inserir aqui código do verifica senha
        </script>
    </head>
    <body>
        <%@include file="MenuAdministrador.jsp"%>
        <div class="jumbotron jumbotron-fluid jumbotromMeu">
            <div class="container fundoJumbotron">
                <form action="CadastroAdm" method="POST">
                    <h1> Cadastro Administrativo </h1> <br/>
                    <h2> Dados Pessoais </h2> 
                    <div id="DadosPessoais" class="divSecaoFormulario">
                        <label> Nome: </label>
                        <input type="text" placeholder="Nome" size="30" maxlength="60" name="nomeAdm"> 
                        <label> CPF: </label>
                        <input type="text" placeholder="CPF" maxlength="11" size="44px" name="cpf"> <br/>
                        <label> E-mail: </label>
                        <input type="text" placeholder="E-mail" maxlength="60" size="28px" name="emailAdm"> 
                        <label> Senha: </label>
                        <input type="password" placeholder="Senha" maxlength="30" size="42px" name="senha"> <br/>
                        <label> Telefone: </label>
                        <input type="text" placeholder="Telefone" size="27px" name="telefone">
                        </br>
                        <button type="submit" class="botaoEnviar"> Cadastrar </button>
                    </div>
                </form>
    </body>
</html>
