<%-- 
    Document   : formCadastroClientes
    Created on : 24/05/2021, 21:47:44
    Author     : Joao
--%>
<!--
    João Otávio - 24/05 - Desenvolvimento da página de cadastro do usuário
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>
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
                width:700px;
                background-color:#dfb649;
                color: #2d2c28;
                font-family: 'Nanum Brush Script', cursive;
                border-radius: 20px;
                border: none;
                box-shadow: 3px  3px #2d2c28;
            }
        </style>
        
        <script>
            //Códigos StackOvwerflow
            

            
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
                document.getElementById('cep').value = cep.substring(0,5)
                +"-"
                +cep.substring(5);

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

        function alertarEmailExistente() {
            if(document.getElementById("emailVerificado").value.equals(existe)) {
                alert("E-mail já cadastrado na base de dados. Por favor, informe um e-mail diferente")
            }
        }
        
    </script>
    </head>
    <%@include file="MenuPrincipal.jsp"%> <br/>
    <body>
        <div class="jumbotron jumbotron-fluid jumbotromMeu">
            <div class="container fundoJumbotron">
                <form action="CadastroClientesZima" method="POST">
                    <h1 class="fonte"> Cadastro  </h1> <br/>
                    <h2 class="fonte"> Dados Pessoais <button type="button" class="btn btn-outline-secondary botaoEsconder" onclick="esconderMostrarDadosPessoais()">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
</svg> 
              </button></h2>
                    <div id="DadosPessoais" class="divSecaoFormulario fonteInputs ">
                        
                        <label> Nome: </label>
                        <input type="text" placeholder="Nome" size="30" maxlength="60" name="nomeCliente"> 
                        <label> CPF: </label>
                        <input type="text" placeholder="CPF" id="CPF" maxlength="14" size="44px" name="cpf" onblur="mascaraCpf()"> <br/>
                        <label> E-mail: </label>
                        <input type="text" placeholder="E-mail" maxlength="60" size="28px" name="emailCliente"> 
                        <label> Senha: </label>
                        <input type="password" placeholder="Senha" maxlength="30" size="42px" name="senha"> <br/>
                        <label> Telefone: </label>
                        <input type="text" placeholder="Telefone" size="27px" id="telefone" name="telefone"> 
                    </div>
                    <br/>
                    <h2 class="fonte"> Dados do Cartão <button type="button" class="btn btn-outline-secondary botaoEsconder" onclick="esconderMostrarDadosFinanceiros()">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
</svg></h2>
                    <div id="DadosFinanceiros" class="divSecaoFormulario fonteInputs comecarInvisivel">
                        <label>  Titular do cartão: </label>
                        <input type="text" placeholder="Titular do cartão" size="70" name="titularCartao"> <br/>
                        <label> Número do Cartão: </label>
                        <input type="text" placeholder="Número do cartão" size="36px" id="numeroCartao" name="numeroCartao"> 
                        <label> Código de verificação: </label> 
                        <input type="text" placeholder="CVV" size="10px" name="cvv"> <br/>
                        <label for="validadeCartao"> Data de validade: </label>
                        <input type="date" placeholder="Data de validade" id ="validadeCartao" name="validadeCartao"> 
                    </div>
                    <br/>
                    <h2 class="fonte"> Endereço <button type="button" class="btn btn-outline-secondary botaoEsconder" onclick="esconderMostrarEndereco()">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
</svg></h2>
                    <div id="endereco" class="divSecaoFormulario fonteInputs comecarInvisivel" >
                            <label> CEP: </label>
                            <input type="text" placeholder="CEP" id="cep" onblur="pesquisacep(this.value)" name="cep">
                            <label> Rua: </label>
                            <input type="text" placeholder="Rua" id="rua" size="53px" name="rua"> <br/> 
                            <label> Bairro: </label>
                            <input type="text" placeholder="Bairro" id="bairro" size="28px" name="bairro" maxlength="30"> 
                            <label> Cidade: </label>
                            <input type="text" placeholder="Cidade" id="cidade" size="41px" name="cidade"> <br/>
                            <label> UF: </label>
                            <input type="text" placeholder="Estado" id="uf" size="11px" name="estado">
                            
                            <label class="posicaoFormularioNumero"> Número: </label>
                            <input type="text" placeholder="Número" size="45px" name="numeroEndereco"> <br/>
                            <label> Complemento: </label>
                            <input type="text" placeholder="Complemento" size="74px" name="complemento"> <br/> 
                            <label> Ponto de Referência: </label>
                            <input type="text" placeholder="Ponto de Referência" size="67px" name="pontoReferencia"> <br/> <br/>
                            <button type="submit" class="botaoEnviar"> Cadastrar </button>
                    </div>
                    <br/>
                </form>
            </div>
        </div>
        <%@include file="rodaPe.jsp"%>
    </body>
</html>
