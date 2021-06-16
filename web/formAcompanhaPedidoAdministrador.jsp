<%-- 
    Document   : formAcompanhaPedidoAdministrador
    Created on : 12/06/2021, 12:42:07
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
        <title>Acompanhamento de Pedidos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>
    <body>
    <%@include file="MenuAdministrador.jsp"%>
        <section>
            <div class="container">
                <div class="row justify-content-center">
                            <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Número do pedido:</th>
      <th scope="col">Data</th>
      <th scope="col">Valor</th>
      <th scope="col">Status</th>
      <th scope="col"></th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
            <% 
            String vcodigo="";
            String vvalor="";
            String vdata="";
            String vcep="";
            String vbairro="";
            String vrua="";
            String vnumero="";
            String vref="";
            String vstatus="";
            
            ManterPedido dao = new ManterPedido();
            Pedido p = new Pedido();
            
            ArrayList<Pedido> pedido = dao.pesquisarTudo();
            for (int i = 0; i < pedido.size(); i++) {
                p = pedido.get(i);
                vcodigo=String.valueOf(p.getCodigo());
                vvalor=String.valueOf(p.getValor());
                vdata=String.valueOf(p.getData());
                vcep=String.valueOf(p.getCepEntrega());
                vbairro=String.valueOf(p.getBairroEntrega());
                vrua=String.valueOf(p.getRuaEntrega());
                vnumero=String.valueOf(p.getNumeroEntrega());
                vref=String.valueOf(p.getpRefEntrega());
                vstatus=String.valueOf(p.getStatus());
            %>
            <form action="AlteraStatus" method="POST">
            <tr>
                <th scope="row"><input type="hidden" name="codigo" value="<%=vcodigo%>"><%=vcodigo%></th></input>
              <td><%=vdata%></td>
              <td><%=vvalor%></td>
              <td><select name="status" id="status">
                      <option value="P">Pendente</option>
                      <option value="F">Fazendo</option>
                      <option value="A">A caminho</option>
                      <option value="E">Entregue</option>
                  </select></td>
                  <td><button class="btn btn-primary" type="submit">Alterar</button></td>
              <td>
                   <a class="btn btn-danger" href="DeletaPedido?codigo=<%=vcodigo%>" onclick="return confirm('Confirma exclusão do pedido <%=vcodigo%>?')">Excluir</a>   
              </td>
              <td><a class="btn btn-info" href="buscaPedidoDetalhado?codigoPed=<%=vcodigo%>">Detalhes</a></td>
            </tr>
            </form>
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
