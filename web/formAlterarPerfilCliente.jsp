<%-- 
    Document   : formAlterarPerfilCliente
    Created on : 03/06/2021, 12:54:09
    Author     : Joao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil</title>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>
        <script>
            $(document).ready(function () { 
                var $seuCampoCpf = $("#CPF");
                //var $seuCampotelefone = $("#telefone");
                
                $seuCampoCpf.mask('000.000.000-00', {reverse: true});
                //$seuCampotelefone.mask('(00)0000-0000', {reverse:true});
            });
        </script>
        
        <style>
            body {
                background-color:#798b52;
                margin:0;
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
            
            .botaoEsconder {
               background-color: #798b52;
               color:#dfb649;
               padding:4px;
               border: none;
            }
            
            .botaoEsconder:hover {
                background-color: #2d2c28;
                color:#dfb649;
            }
            
            .comecarInvisivel {
                display: none;
            }
            
            .posicaoFormularioNumero {
                margin-left:120px;
            }
            
            .posicaoFormularioInputUF {
                margin-left:50px;
            }
            
            .botaoEnviar{
                width:710px;
                background-color:#dfb649;
                color: #2d2c28;
                font-family: 'Nanum Brush Script', cursive;
                border-radius: 20px;
                border: none;
                box-shadow: 3px  3px #2d2c28;
            }
        </style>
        
        <script>
            //Códigos baseados na w3schools
            
           function esconderMostrarDadosPessoais() {
                var displayAtualDadosPessoais = document.getElementById("DadosPessoais");//Declara uma variável que armazena o elemento com o ID em parênteses
                if (displayAtualDadosPessoais.style.display === "none") { // Compara o valor do display do elemento da variável com "none" e seta para "block" caso retorne true
                  displayAtualDadosPessoais.style.display = "block";
                } else {
                  displayAtualDadosPessoais.style.display = "none"; // Se não, seta o valor do display para none
                }
            }
            
            function esconderMostrarEndereco() {
                var displayAtual = document.getElementById("endereco");
                if (displayAtual.style.display === "block") {
                  displayAtual.style.display = "none";
                } else {
                  displayAtual.style.display = "block";
                }
            }
            
            function esconderMostrarDadosFinanceiros() {
                var displayAtualFinanceiro = document.getElementById("DadosFinanceiros");
                if (displayAtualFinanceiro.style.display === "block") {
                  displayAtualFinanceiro.style.display = "none";
                } else {
                  displayAtualFinanceiro.style.display = "block";
                }
            }
           
            //Códigos feitos pela ViaCEP
            function limpa_formulário_cep() {
            //Limpa valores do formulário de cep.
            document.getElementById('rua').value=("");
            document.getElementById('bairro').value=("");
            document.getElementById('cidade').value=("");
            document.getElementById('uf').value=("");
            }

            function meu_callback(conteudo) {
                if (!("erro" in conteudo)) {
                //Atualiza os campos com os valores.
                document.getElementById('rua').value=(conteudo.logradouro);
                document.getElementById('bairro').value=(conteudo.bairro);
                document.getElementById('cidade').value=(conteudo.localidade);
                document.getElementById('uf').value=(conteudo.uf);
                } //end if.
                else {
                //CEP não Encontrado.
                limpa_formulário_cep();
                alert("CEP não encontrado.");
                }
            }
        
    function pesquisacep(valor) {

        //Nova variável "cep" somente com dígitos.
        var cep = valor.replace(/\D/g, '');

        //Verifica se campo cep possui valor informado.
        if (cep != "") {

            //Expressão regular para validar o CEP.
            var validacep = /^[0-9]{8}$/;

            //Valida o formato do CEP.
            if(validacep.test(cep)) {

                //Preenche os campos com "..." enquanto consulta webservice.
                document.getElementById('rua').value="...";
                document.getElementById('bairro').value="...";
                document.getElementById('cidade').value="...";
                document.getElementById('uf').value="...";

                //Cria um elemento javascript.
                var script = document.createElement('script');

                //Sincroniza com o callback.
                script.src = 'https://viacep.com.br/ws/'+ cep + '/json/?callback=meu_callback';

                //Insere script no documento e carrega o conteúdo.
                document.body.appendChild(script);

            } //end if.
            else {
                //cep é inválido.
                limpa_formulário_cep();
                alert("Formato de CEP inválido.");
            }
        } //end if.
        else {
            //cep sem valor, limpa formulário.
            limpa_formulário_cep();
        }
    };

        </script>
    </head>
    <%@include file="MenuClienteLogado.jsp"%> <br/>
    <body>
        <%
            //Recebendo Dados Pessoais
            String codigo = String.valueOf(request.getAttribute("codigo"));
            String nome = String.valueOf(request.getAttribute("nome"));
            String email = String.valueOf(request.getAttribute("email"));
            String senha = String.valueOf(request.getAttribute("senha"));
            String telefone = String.valueOf(request.getAttribute("telefone"));
            
            //Recebendo dados do cartão
            String codUsuarioCartao = String.valueOf(request.getAttribute("cod_usuarioCartao"));
            String numeroCartao = String.valueOf(request.getAttribute("numeroCartao"));
            String titular = String.valueOf(request.getAttribute("titular"));
            String dataValidade = String.valueOf(request.getAttribute("dataValidade"));
            String cvv = String.valueOf(request.getAttribute("cvv"));
            
            //Recebendo dados do Endereco
            
            String codUsuarioEndereco = String.valueOf(request.getAttribute("codUsuarioEndereco"));
            String cep = String.valueOf(request.getAttribute("cep"));
            String cidade = String.valueOf(request.getAttribute("cidade"));
            String uf = String.valueOf(request.getAttribute("uf"));
            String bairro = String.valueOf(request.getAttribute("bairro"));
            String rua = String.valueOf(request.getAttribute("rua"));
            String numero = String.valueOf(request.getAttribute("numero"));
            String complemento = String.valueOf(request.getAttribute("complemento"));
            String pRef = String.valueOf(request.getAttribute("pRef"));
            
           
        %>
        <div class="jumbotron jumbotron-fluid jumbotromMeu">
            <div class="container fundoJumbotron">
                <form action="AlterarDadosCadastrais" method="POST">
                    <h1 class="fonte"> Alterar Dados Cadastrais  </h1> <br/>
                    <h2 class="fonte"> Dados Pessoais <button type="button" class="btn btn-outline-secondary botaoEsconder" onclick="esconderMostrarDadosPessoais()">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
</svg> 
              </button></h2>
                    <div id="DadosPessoais" class="divSecaoFormulario fonteInputs ">
                        <input type="hidden" name="codigoUsuario" value="<%=codigo%>">
                        <label> Nome: </label>
                        <input type="text" placeholder="Nome" size="30" maxlength="60" name="nomeClienteAlterado" value="<%=nome%>"> 
                        <label> E-mail: </label>
                        <input type="text" placeholder="E-mail" maxlength="60" size="41px" name="emailClienteAlterado" value="<%=email%>"> <br/>
                        <label> Senha: </label>
                        <input type="password" placeholder="Senha" maxlength="30" size="29px" name="senhaAlterado" value="<%=senha%>"> 
                        <label> Telefone: </label>
                        <input type="text" placeholder="Telefone" size="40px" name="telefoneAlterado" value="<%=telefone%>"> 
                    </div>
                    <br/>
                    <h2 class="fonte"> Dados do Cartão <button type="button" class="btn btn-outline-secondary botaoEsconder" onclick="esconderMostrarDadosFinanceiros()">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
</svg></h2>
                    <div id="DadosFinanceiros" class="divSecaoFormulario fonteInputs comecarInvisivel">
                        
                        <label>  Titular do cartão: </label>
                        <input type="text" placeholder="Titular do cartão" size="70" name="titularCartaoAlterado" value="<%=titular%>"> <br/>
                        <label> Número do Cartão: </label>
                        <input type="text" placeholder="Número do cartão" size="36px" name="numeroCartaoAlterado" value="<%=numeroCartao%>"> 
                        <label> Código de verificação: </label> 
                        <input type="text" placeholder="CVV" size="10px" name="cvvAlterado" value="<%=cvv%>"> <br/>
                        <label for="validadeCartao"> Data de validade: </label>
                        <input type="date" placeholder="Data de validade" id ="validadeCartao" name="validadeCartaoAlterado" value="<%=dataValidade%>"> 
                    </div>
                    <br/>
                    <h2 class="fonte"> Endereço <button type="button" class="btn btn-outline-secondary botaoEsconder" onclick="esconderMostrarEndereco()">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
</svg></h2>
                    <div id="endereco" class="divSecaoFormulario fonteInputs comecarInvisivel" >
                            
                            <label> CEP: </label>
                            <input type="text" placeholder="CEP" id="cep" onblur="pesquisacep(this.value)" name="cepAlterado" value="<%=cep%>">
                            <label> Rua: </label>
                            <input type="text" placeholder="Rua" id="rua" size="53px" name="ruaAlterado" value="<%=rua%>"> <br/> 
                            <label> Bairro: </label>
                            <input type="text" placeholder="Bairro" id="bairro" size="28px" name="bairroAlterado" maxlength="30" value="<%=bairro%>"> 
                            <label> Cidade: </label>
                            <input type="text" placeholder="Cidade" id="cidade" size="41px" name="cidadeAlterado" value="<%=cidade%>"> <br/>
                            <label> UF: </label>
                            <input type="text" placeholder="Estado" id="uf" size="11px" name="estadoAlterado" value="<%=uf%>">
                            <label class="posicaoFormularioNumero"> Número: </label>
                            <input type="text" placeholder="Número" size="45px" name="numeroEnderecoAlterado" value="<%=numero%>"> <br/>
                            <label> Complemento: </label>
                            <input type="text" placeholder="Complemento" size="74px" name="complementoAlterado" value="<%=complemento%>"> <br/> 
                            <label> Ponto de Referência: </label>
                            <input type="text" placeholder="Ponto de Referência" size="67px" name="pontoReferenciaAlterado" value="<%=pRef%>"> <br/> <br/>
                            <button type="submit" class="botaoEnviar"> Alterar </button>
                    </div>
                    <br/>
                </form>
            </div>
        </div>
        <%@include file="rodaPe.jsp"%>
    </body>
</html>
