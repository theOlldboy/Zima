<%-- 
    Document   : formCadastroProdutos
    Created on : 08/06/2021, 14:55:49
    Author     : Mathe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Produtos</title>
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
            
        </script>
    </head>
    <body>
        <%@include file="MenuAdministrador.jsp"%>
            <div class="container fundoJumbotron">
                <form action="CadastrarProduto" method="POST">
                    <h1> Cadastro de Produto </h1> <br/>
                    <div id="DadosPessoais" class="divSecaoFormulario">
                        <label> Título: </label>
                        <input type="text" placeholder="Título" size="30" maxlength="60" name="titulo">
                        <label> Descrição: </label>
                        <input type="text" placeholder="Descrição" maxlength="500" name="descricao">
                        <label> Preço: </label>
                        <input type="text" placeholder="Preço" maxlength="60" size="28px" name="preco">
                        <button type="submit" class="botaoEnviar"> Cadastrar </button>
                        <button type="reset" class="botaoEnviar"> Limpar </button>
                    </div>
                </form>
    </body>
</html>
