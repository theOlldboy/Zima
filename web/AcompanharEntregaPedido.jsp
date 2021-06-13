<%-- 
    Document   : AcompanharEntregaPedido
    Created on : 13/06/2021, 17:33:16
    Author     : Joao
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.ManterPedido"%>
<%@page import="br.com.entidade.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Acompanhar Entrega Pedido</title>
    </head>
    <style>
            body {
                margin: 0;
                background-color: #798b52;
            }
            
            .fundoJumbotron {
               background-color:#798b52;
;              margin-left: 210px;
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
            
            .fonteTabela {
                font-family: 'Nanum Brush Script', cursive;
                color: #dfb649;
                font-size: 1.8em;
            }
            
            .fonteTitulo {
                font-family: 'Nanum Brush Script', cursive;
                color: #dfb649;
                
                
            }
            
            .fonteRegistros {
                color:#2d2c28;
                text-decoration: none;
            }
            
            .registros {
                background-color:#f5f4f3;
                color: #2d2c28;
            }
            
            .headerTabela {
                background-color: #2d2c28;
                color: #dfb649;
            }
            
            .alinharCentro {
                text-align:center;
            }
            
            .registros:hover {
                background-color: #ffffff;
                color: #2d2c28;
                text-decoration: none;
            }
            
            .fonteStatus {
                font-family: 'Nanum Brush Script', cursive;
                color: #dfb649;
                font-size: 2.5em;
            }
            
            .mensagem {
                color:#f5f4f3;
            }
           
        </style>
        
        <script>
            function trocarStatus() {
                let status = document.getElementById("valorDoStatus").innerText;
                if(status === "E"){
                    document.getElementById("valorDoStatus").innerText = " Entregue";
                    document.getElementById("imagemStatus").src='check.png'
                    document.getElementById("mensagem").innerText = "Obrigado por comprar conosco! Aproveite :)"
                }
                
                if(status === "F"){
                    document.getElementById("valorDoStatus").innerText = " Em preparo";
                    document.getElementById("imagemStatus").src='emPreparo.png'
                    document.getElementById("mensagem").innerText = "Estão deixando tudo do jeitinho que você quer. Falta pouco!"
                }
                
                if(status === "P"){
                    document.getElementById("valorDoStatus").innerText = " Pendente";
                    document.getElementById("imagemStatus").src='pendenteIcone.png'
                    document.getElementById("mensagem").innerText = "Não houve nenhuma interação com o pedido ainda. Mas não se preocupe, iremos te avisar"
                }
                
                if(status === "A"){
                    document.getElementById("valorDoStatus").innerText = " À caminho";
                    document.getElementById("imagemStatus").src='AcaminhoIcone.png'
                    document.getElementById("mensagem").innerText = "Seu pedido já saiu para entrega. Fique atento !"
                }
            }
        </script>
        <body onload="trocarStatus()">
        <%
            int codigoDoPedido = Integer.valueOf(request.getParameter("codigoPed"));
            
            Pedido ped = new Pedido();
            ManterPedido mped = new ManterPedido();
            String numeroPedido="";
            String valorPedido="";
            String cepEntrega="";
            String bairroEntrega="";
            String ruaEntrega="";
            String numeroEntrega="";
            String pRef="";
            String status="";
            
            ped = mped.pesquisarPedidoParaEntrega(codigoDoPedido);
            numeroPedido = String.valueOf(ped.getCodigo());
            valorPedido = String.valueOf(ped.getValor());
            cepEntrega = String.valueOf(ped.getCepEntrega());
            bairroEntrega = String.valueOf(ped.getBairroEntrega());
            ruaEntrega = String.valueOf(ped.getRuaEntrega());
            numeroEntrega = String.valueOf(ped.getNumeroEntrega());
            pRef = String.valueOf(ped.getpRefEntrega());
            status = String.valueOf(ped.getStatus());
        %>
        <%@include file="MenuClienteLogado.jsp"%> 
        <div class="jumbotron jumbotron-fluid jumbotromMeu">
               <div class="container fundoJumbotron">
                <h1 class="fonteTitulo"> Pedido Nº: <%=numeroPedido%></h1>  <br/>
               <table class="table">
                   <tr class="fonteTabela headerTabela">
                       <th> Número do Pedido </th>
                       <th> Bairro</th>
                       <th> Rua </th>
                       <th> Número/Lote </th>
                       <th> Valor </th>
                       
                      
                   </tr>
                   <tr class=" registros fonteRegistros">
                        <td><%=numeroPedido%></td>
                        <td><%=bairroEntrega%></td>
                        <td><%=ruaEntrega%></td>
                        <td><%=numeroEntrega%></td>
                        <td><%="R$"+valorPedido%> </td>
                    </tr>
                    
                    </table> <br/> 
                    <div class="statusDoPedido">
                        <h2 class="fonteStatus"> O status do seu pedido é:<span id="valorDoStatus"><%=status%></span> </h2> <br/>
                        <img src="" width="300px" height="400px" id="imagemStatus" class="imgStatus">
                        <label id="mensagem" class="mensagem"> </label>
                    </div>
                </div>
            </div>
         <%@include file="rodaPe.jsp"%>
    </body>
    </body>
</html>
