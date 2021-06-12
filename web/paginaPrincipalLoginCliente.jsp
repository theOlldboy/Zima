<%-- 
    Document   : paginaPrincipalLoginCliente
    Created on : 31/05/2021, 22:24:18
    Author     : Joao
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.entidade.Produto"%>
<%@page import="br.com.DAO.ManterProduto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
        <style>
            body {
                
                background-color: #798b52;
            }
            
            .fonte {
                color: #dfb649;
                font-family: 'Nanum Brush Script', cursive;
                font-size: 2.5em;
            }
            
            .fonteValor {
                color: #dfb649;
                font-family: 'Nanum Brush Script', cursive;
                font-size: 1.8em;
                float:right;
            }
            
            .fonteTituloSanduiche {
                color: #dfb649;
                font-family: 'Nanum Brush Script', cursive;
                font-size: 1.8em;
                
            }
            
            .fonteBranco {
                color: #f5f4f3;
            }
            
            .jumbotromMeu {
                background-color:#798b52;
                size: 800px;
            }
            
            
            
            .curso {
                display: inline-block;
                background-color:#2d2c28;
                box-sizing:border-box;
                padding: 5px;
                border: 2px solid #dfb649;
                width: 265px;
                height: 480px;
                margin: 10px;
            }
            
            .curso:hover {
                 box-shadow:4px 4px 4px 4px #2d2c28;
                 transition: 1s;
            }

            .curso-info{
                position: relative;
                display: block;
                font-size: 1.2em;
            }
        
            .curso img {
                width: 100%;
            }
            
            .cardapio {
                margin-left: 80px;
            }
            
            .posicionamentoBebidas {
                margin-left: 90px;
            }
            
            li > a {
                text-decoration: none;
            }
            
            .quantidadeItem {
                width:45px;
                margin-top: 10px;
               
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
        </style>
        <title>Bem-Vindo à Zima </title>
    </head>
    <body>
        <%
            //Trecho de código responsável por bloquear o acesso de quem tente acessar a página sem estar logado
            //Faz a comparação do email da sessao com a string "null" e se der true envia o usuário para a index novamente
            String email = (String) String.valueOf(session.getAttribute("email"));
            
            if(email.equals("null")) {
                String redirectURL = "index.jsp";
                response.sendRedirect(redirectURL);
            }            

        %>
        <%@include file="MenuClienteLogado.jsp"%> 
           <div class="jumbotron jumbotron-fluid jumbotromMeu">
            <div class="container fundoJumbotron">
                <h1 class="fonte"> Cardápio </h1> <br/>
                    <h2 class="fonte"> Sanduíches </h2>
                <div class="cardapio">
                    <form action="FazerPedido">
                    
        <%
            String vcodigo="";
            String vtitulo="";
            String vdescricao="";
            String vpreco="";
            String vimg="";
            
            ManterProduto dao = new ManterProduto();
            Produto p = new Produto();
            
            String codigoUsuarioLogin = (String) String.valueOf(session.getAttribute("codigoUsuario"));
            
            ArrayList<Produto> produto = dao.pesquisarTudo();
            for (int i = 0; i < produto.size(); i++) {
                p = produto.get(i);
                vcodigo=String.valueOf(p.getCodigo());
                vtitulo=String.valueOf(p.getTitulo());
                vdescricao=String.valueOf(p.getDescricao());
                vpreco=String.valueOf(p.getPreco());
                vimg=String.valueOf(p.getImg());
        %>
                    <div class="curso">
                        <img src="<%=vimg%>" height="150"/>
                        <div class="curso-info fonteBranco">
                            <h4 class="fonteTituloSanduiche"><%=vtitulo%></h4>
                            <p><%=vdescricao%></p>
                            <label for="bebidas" class="fonteTituloSanduiche">Escolha sua bebida</label>
                            <select name="bebidaProd<%=i%>">
                              <option value="Coca">Coca-Cola</option>
                              <option value="Guarana">Guaraná</option>
                            </select> <br/>
                            <p class="fonteValor"> R$ <%=vpreco%> </p>
                            <input type="number" name="qtd<%=i%>" class="quantidadeItem"/>
                            <input type="hidden" name="codigoProduto<%=i%>" value="<%=vcodigo%>"/>
                            <input type="hidden" name="pVendProduto<%=i%>" value="<%=vpreco%>"/>
                            <input type="hidden" name="codUsuario" value="<%=codigoUsuarioLogin%>"/>
                        </div>
                    </div>
            <% }
            %>
                    </div> <br/> <br/>
                
                <h2 class="fonte"> Bebidas </h2> 
                <p class="fonteBranco posicionamentoBebidas"> Não se preocupe, todos os sanduíches incluem uma lata 350ml de Coca-Cola ou Guaraná Antártica :), à sua escolha. </p>
                <button type="submit" class="botaoFazerPedido">Próximo <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
</svg></button>
                </div>
                </form>
            </div>
        <%@include file="rodaPe.jsp"%>
    </body>
</html>
