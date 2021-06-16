<%-- 
    Document   : formAlteraProduto
    Created on : 11/06/2021, 22:09:09
    Author     : Mathe
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.entidade.Produto"%>
<%@page import="br.com.DAO.ManterProduto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Produtos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="MenuAdministrador.jsp"%>
            <% 
            String vcodigo="";
            String vtitulo="";
            String vdescricao="";
            String vpreco="";
            String vimg="";
            
            ManterProduto dao = new ManterProduto();
            Produto p = new Produto();
            
            ArrayList<Produto> produto = dao.pesquisarTudo();
            for (int i = 0; i < produto.size(); i++) {
                p = produto.get(i);
                vcodigo=String.valueOf(p.getCodigo());
                vtitulo=String.valueOf(p.getTitulo());
                vdescricao=String.valueOf(p.getDescricao());
                vpreco=String.valueOf(p.getPreco());
                vimg=String.valueOf(p.getImg());
            %>
            <div class="container">
                <div class="row justify-content-center">
                        <form action="AlteraProduto" method="POST">
                            <tr>
                            <input type="hidden" name="codigo" value="<%=vcodigo%>">
                            <td class="form-group">
                                <label for= nome>Titulo:</label>
                                <input type="text" class="form-control" name="titulo" value="<%=vtitulo%>">
                            </td>
                            </tr>
                            <div class="form-group">
                                <label for= nome>Descrição:</label>
                                <input type="text" class="form-control" name="descricao" value="<%=vdescricao%>">
                            </div>
                            <div class="form-group">
                                <label for= nome>Preço:</label>
                                <input type="text" class="form-control" name="preco" value="<%=vpreco%>">
                            </div>
                            <div class="form-group">
                                <label for= nome>Imagem de Referência:</label>
                                <input type="text" class="form-control" name="img" value="<%=vimg%>">
                            </div>
                            <button type="submit" class="btn btn-block btn-primary">Alterar</button>
                            <a class="btn btn-block btn-danger" href="DeletaProduto?codigo=<%=vcodigo%>" onclick="return confirm('Confirma exclusão do registro <%=vtitulo%>?')">Excluir</a>
                            </div>
                        </form>
                </div>
                        <% }
                        %>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>