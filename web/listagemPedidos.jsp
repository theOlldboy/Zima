<%-- 
    Document   : listagemPedidos
    Created on : 13/06/2021, 11:52:33
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
        <title> Pedidos Realziados </title>
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
        </style>
        <script>
            
        </script>
    </head>
    <body onload="trocarStatus()">
        
        <%@include file="MenuClienteLogado.jsp"%> 
        <div class="jumbotron jumbotron-fluid jumbotromMeu">
               <div class="container fundoJumbotron">
                <h1 class="fonteTitulo"> Meus Pedidos </h1>  <br/>
               <table class="table">
                   <tr class="fonteTabela headerTabela">
                       <th> Número do Pedido </th>
                       <th> Bairro</th>
                       <th> Rua </th>
                       <th> Número/Lote </th>
                       <th> Valor </th>
                       <th> Status </th>
                       <th> Opções </th>
                   </tr>
        <%
            int codigoDoUsuario = Integer.valueOf(request.getParameter("codigoCli"));
            
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
            
            
            
            ArrayList<Pedido> listaPed = new ArrayList<Pedido>();
            listaPed = mped.pesquisarPedidosPorCliente(codigoDoUsuario);
            
            for (int i = 0; i < listaPed.size(); i++) {
                ped = listaPed.get(i);
                numeroPedido=String.valueOf(ped.getCodigo());
                valorPedido=String.valueOf(ped.getValor());
                cepEntrega=String.valueOf(ped.getCepEntrega());
                bairroEntrega=String.valueOf(ped.getBairroEntrega());
                ruaEntrega=String.valueOf(ped.getRuaEntrega());
                numeroEntrega=String.valueOf(ped.getNumeroEntrega());
                pRef = String.valueOf(ped.getpRefEntrega());
                status = String.valueOf(ped.getStatus());
        %>
        
            
                    <tr class=" registros fonteRegistros">
                        <td><%=numeroPedido%></td>
                        <td><%=bairroEntrega%></td>
                        <td><%=ruaEntrega%></td>
                        <td><%=numeroEntrega%></td>
                        <td><%="R$"+valorPedido%> </td>
                        <td id="valorDoStatus"><%=status%></td>
                        <td><a href="AcompanharEntregaPedido.jsp?codigoPed=<%=numeroPedido%>" class="fonteRegistros"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-truck" viewBox="0 0 16 16">
  <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-3.998-.085A1.5 1.5 0 0 1 0 10.5v-7zm1.294 7.456A1.999 1.999 0 0 1 4.732 11h5.536a2.01 2.01 0 0 1 .732-.732V3.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .294.456zM12 10a2 2 0 0 1 1.732 1h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12v4zm-9 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
</svg> Entrega </a></td>
                    </tr>
                    <%}%>
                    </table> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> 
                </div>
            </div>
         <%@include file="rodaPe.jsp"%>
    </body>
</html>
