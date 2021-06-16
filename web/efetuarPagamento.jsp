<%-- 
    Document   : efetuarPagamento
    Created on : 12/06/2021, 16:46:06
    Author     : Joao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Efetuar Pagamento</title>
        <style>
            body {
                margin: 0;
                background-color: #798b52;
            }
            
            .fundoJumbotron {
               background-color:#798b52;
;              margin-left: 350px;
            }
            
            .botaoOutroCartao {
                width:247px;
                background-color:#dfb649;
                color: #2d2c28;
                font-family: 'Nanum Brush Script', cursive;
                border-radius: 20px;
                border: none;
                box-shadow: 3px  3px #2d2c28;
            }
            .jumbotromMeu {
                background-color:#798b52;
                size: 450px;
            }
            
            .fonteInputs {
                font-family: 'Nanum Brush Script', cursive;
                color: #dfb649;
                font-size: 1.3em;
            }
            
            .fonte {
                font-family: 'Nanum Brush Script', cursive;
                color: #dfb649;
            }
            
            input {
                border-radius: 25px;
                border: none;
                padding:2px;
                display: inline-block;
            }
            
            .posicaoFormularioNumero {
                margin-left:120px;
            }
            
            .botaoFazerPedido {
                float: right;
                border: none;
                color: #dfb649;
                font-family: 'Nanum Brush Script', cursive;
                font-size: 2.0em;
                background-color: #798b52;
            }
            
            .botaoFazerPedido:hover {
                text-decoration: underline;
            }
            
            .imgPix {
                
            }
        </style>
        <script>
            function limparCamposCartao() {
                let titular = document.getElementById("titular");
                let numero = document.getElementById("numero");
                let cvv = document.getElementById("cvv");
                let data = document.getElementById("validadeCartao");
                
                titular.value="";
                numero.value="";
                cvv.value="";
                data.value="";
            }
            
        </script>
    </head>
    <body>
        <%
            String codigoUsuarioLogin = (String) String.valueOf(session.getAttribute("codigoUsuario"));
            
            String codUsuarioCartao = String.valueOf(request.getAttribute("cod_usuarioCartao"));
            String numeroCartao = String.valueOf(request.getAttribute("numeroCartaoPag"));
            String titular = String.valueOf(request.getAttribute("titularPag"));
            String dataValidade = String.valueOf(request.getAttribute("dataValidadePag"));
            String cvv = String.valueOf(request.getAttribute("cvvPag"));
            

        %>
        <%@include file="MenuClienteLogado.jsp"%> 
            <div class="jumbotron jumbotron-fluid jumbotromMeu">
                <div class="container fundoJumbotron">
                 <form action="EfetuarPagamento" method="POST">
                    <h1 class="fonte"> Formas de Pagamento </h1> 
                    <h2 class="fonte"> Cartão de Crédito </h2> <input type="radio" id="CartaoCredito" name="formaPagamento"
          value="CartaoCredito" checked> </br>
                    
                        
                        <div id="DadosFinanceiros" class="divSecaoFormulario fonteInputs comecarInvisivel">
                        
                        <label>  Titular do cartão: </label>
                        <input type="text" id="titular" placeholder="Titular do cartão" size="70" name="titularCartaoAlterado" value="<%=titular%>"> <br/>
                        <label> Número do Cartão: </label>
                        <input type="text" id="numero" placeholder="Número do cartão" size="36px" name="numeroCartaoAlterado" value="<%=numeroCartao%>"> 
                        <label> Código de verificação: </label> 
                        <input type="text" id="cvv" placeholder="CVV" size="10px" name="cvvAlterado" value="<%=cvv%>"> <br/>
                        <label for="validadeCartao"> Data de validade: </label>
                        <input type="date" placeholder="Data de validade" id ="validadeCartao" name="validadeCartaoAlterado" value="<%=dataValidade%>"> <br/> <br/>
                        <button class="botaoOutroCartao"onclick="limparCamposCartao(); return false;"> Usar Outro Cartão </button>
                        
                    <h2 class="fonte"> Pix </h2> <input type="radio" id="pix" name="formaPagamento" value="Pix"> </br>    
                        <div class="imgPix"> 
                            <img src="qrcode.png" width="300" height="300px"> 
                        </div>
                        
                    </div> <br/> <br/>
                        <button type="submit" class="botaoFazerPedido"> Finalizar Pedido <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
  </svg></button>
                    </form>
                    
                </div> 
            </div> <br/> <br/> <br/> <br/> <br/> <br/><br/> <br/> 
        <%@include file="rodaPe.jsp"%>
    </body>
</html>
