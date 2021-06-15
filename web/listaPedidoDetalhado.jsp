<%-- 
    Document   : listaPedidoDetalhado
    Created on : 13/06/2021, 18:41:47
    Author     : Mathe
--%>

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
        <section>
            <div class="container">
                <div class="row justify-content-center">
                            <table class="table table-striped">
  <thead>
      <%
            //Declarando dados da Tabela Pedido
            String vcodigo="";
            String vcodigoCli="";
            String vvalor="";
            String vdata="";
            String vcep="";
            String vbairro="";
            String vrua="";
            String vnumero="";
            String vref="";
            String vstatus="";
            
            //Declarando dados da Tabela Cliente
            String vnome="";
            
            //Declarando dados da Tabela Itens Pedido
            String vitem="";
            String vqtd="";
            String vbebida="";
            String vqtdbebida="";
            //Declarando dados da Tabela Produto
            String vtitulo="";
            String vpreco="";
            //Declarando dados da Tabela Pagamento
            String vforma="";
            String vstatusPag="";
            
            ManterPedido dao = new ManterPedido();
            Pedido p = new Pedido();
            
            ArrayList<Pedido> pedido = dao.pesquisarTudo();
            for (int i = 0; i < pedido.size(); i++) {
                p = pedido.get(i);
                vcodigo=String.valueOf(p.getCodigo());
                vcodigoCli=String.valueOf(p.getCod_cli());
                vvalor=String.valueOf(p.getValor());
                vdata=String.valueOf(p.getData());
                vcep=String.valueOf(p.getCepEntrega());
                vbairro=String.valueOf(p.getBairroEntrega());
                vrua=String.valueOf(p.getRuaEntrega());
                vnumero=String.valueOf(p.getNumeroEntrega());
                vref=String.valueOf(p.getpRefEntrega());
                vstatus=String.valueOf(p.getStatus());
            %>
    <tr>
      <th scope="col">Número do pedido: <%=vcodigo%></th>
      <th scope="col">Data: <%=vdata%></th>
      <th scope="col">Valor: <%=vvalor%></th>
      <th scope="col">Status: <%=vstatus%></th>
    </tr>
  </thead>
            <tr>
                <td><h4>Endereço de entrega:</h4></td>
              <td>Cep: <%=vcep%></td>
              <td></td>
              <td>Bairro: <%=vbairro%></td>
              <td>Rua: <%=vrua%></td>
              <td>Número: <%=vnumero%></td>
              <td>Ponto de Referência: <%=vref%></td>
            </tr>
                           </div>
                </div>
                        <% }
                        %>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
