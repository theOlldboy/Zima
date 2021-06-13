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
                color: #f5f4f3;
                font-size: 1.8em;
            }
            
            .fonteRegistros {
                color:#f5f4f3;
            }
            
            .registros {
                background-color:#f5f4f3;
                color: #2d2c28;
            }
            
            .headerTabela {
                background-color: #2d2c28;
                color: #dfb649;
            }
            
          
            
            .registros:hover {
                background-color: #ffffff;
                color: #2d2c28;
            }
        </style>
    </head>
    <body>
        <%@include file="MenuClienteLogado.jsp"%> 
        <div class="jumbotron jumbotron-fluid jumbotromMeu">
               <div class="container fundoJumbotron">
        <table class="table">
            <tr class="fonteTabela headerTabela">
                <th> Número do Pedido </th>
                <th> Bairro</th>
                <th> Rua </th>
                <th> Número/Lote </th>
                <th> Valor </th>
                <th> Status </th>
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
                        <td><%=status%></td>
                    </tr>
                    <%}%>
                    </table> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> 
                </div>
            </div>
         <%@include file="rodaPe.jsp"%>
    </body>
</html>
