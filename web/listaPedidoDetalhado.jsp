<%-- 
    Document   : listaPedidoDetalhado
    Created on : 13/06/2021, 18:41:47
    Author     : Mathe
--%>

<%@page import="br.com.entidade.Produto"%>
<%@page import="br.com.DAO.ManterProduto"%>
<%@page import="br.com.entidade.ItemPedido"%>
<%@page import="br.com.DAO.ManterItensPedido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.entidade.Pedido"%>
<%@page import="br.com.DAO.ManterPedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedido Detalhado</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="MenuAdministrador.jsp"%>        
        <section>
            <div class="container">
                <div class="row justify-content-center">
                            <table class="table table-striped">
  <thead>
      <%
            //Recebendo dados da Tabela Pedido
            String vcodigo=String.valueOf(request.getParameter("codigoPed"));
            String vcodigoCli=String.valueOf(request.getAttribute("codigoCli"));
            String vvalor=String.valueOf(request.getAttribute("valor"));
            String vdata=String.valueOf(request.getAttribute("data"));
            String vcep=String.valueOf(request.getAttribute("cep"));
            String vbairro=String.valueOf(request.getAttribute("bairro"));
            String vrua=String.valueOf(request.getAttribute("rua"));
            String vnumero=String.valueOf(request.getAttribute("numero"));
            String vref=String.valueOf(request.getAttribute("pRef"));
            String vstatus=String.valueOf(request.getAttribute("status"));
            String vlocal=String.valueOf(request.getAttribute("local"));
            
            //Recebendo dados da Tabela Cliente
            String vnome=String.valueOf(request.getAttribute("nome"));
            
            //Recebendo dados da Tabela Itens Pedido
//            String viditem=String.valueOf(request.getAttribute("id_item"));
//            String vqtd=String.valueOf(request.getAttribute("qtde"));
//            String vbebida=String.valueOf(request.getAttribute("tipo_bebida"));
//            String vqtdbebida=String.valueOf(request.getAttribute("qtde_bebida"));
            
            //Recebendo dados da Tabela Produto
//            String vtitulo=String.valueOf(request.getAttribute("titulo"));
            
            //Recebendo dados da Tabela Pagamento
            String vforma=String.valueOf(request.getAttribute("forma"));
            String vstatusPag=String.valueOf(request.getAttribute("status"));
           
            %>
    <tr>
      <th scope="col">Número do pedido: <%=vcodigo%></th>
      <th scope="col">Cliente: <%=vnome%></td>
      <th scope="col">Data: <%=vdata%></th>
      <td>Valor: <%=vvalor%></td>
      <td>Status: <%=vstatus%></td>
    </tr>
  </thead>
            <tr>
              <td><h4>Endereço de entrega:</h4></td>
              <td>Cep: <%=vcep%></td>
              <td>Bairro: <%=vbairro%></td>
              <td>Rua: <%=vrua%></td>
              <td>Número: <%=vnumero%></td>
              <td>Ponto de Referência: <%=vref%></td>
              <td>Localização: <%=vlocal%></td>
            </tr>
            <%
                int codigoPedido = Integer.valueOf(request.getParameter("codigoPed")) ;
                
                Produto prod = new Produto();
                ManterProduto daoprod = new ManterProduto();
                ItemPedido ip = new ItemPedido();
                ManterItensPedido daoip = new ManterItensPedido();
                ArrayList<ItemPedido> itens = daoip.pesquisarTudo(codigoPedido);
                for (int i = 0; i < itens.size(); i++) {
                    ip = itens.get(i);
                                int codigo = ip.getCod_produto();
                                prod = daoprod.pesquisar(codigo);
                                String vtitulo=String.valueOf(prod.getTitulo());
                    String vqtd=String.valueOf(ip.getQtde());
                    String vbebida=String.valueOf(ip.getBebida());
                    String vqtdbebida=String.valueOf(ip.getQtdeBebida());
                
            %>
            <tr>
                <td>Item: <%=vtitulo%></td>
                <td>QTD: <%=vqtd%></td>
                <td>Bebida: <%=vbebida%></td>
                <td>QTD Bebida: <%=vqtdbebida%></td>
            </tr>
            <%}%>
            <tr>
                <td>Forma de pagamento: <%=vforma%></td>
                <td>Status: <%=vstatus%></td>
            </tr>
                           </div>
                </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
