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
;
            }
            
            .jumbotromMeu {
                background-color:#798b52;
                size: 450px;
            }
            
            .fonte {
                font-family: 'Nanum Brush Script', cursive;
                color: #dfb649;
            }
            
            input {
                border-radius: 15px;
                padding:2px;
            }
            
        </style>
        
        <script>
            //Meus códigos
           
           
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
    <body>
        <div class="logo">
            <img src="Logo.png" width="250px" height="100px">
        </div> <br/>
        <div class="jumbotron jumbotron-fluid jumbotromMeu">
            <div class="container fundoJumbotron">
                <form action="" method="POST">
                    <h1 class="fonte"> Cadastro </h1> <br/>
                    <div id="DadosPessoais" class="divSecaoFormulario fonte">
                        <h2 class="titulo"> Dados Pessoais </h2>
                        <p> Nome </p>
                        <input type="text" placeholder="Nome" size="100" maxlength="60"> <br/>
                        <p> CPF </p>
                        <input type="text" placeholder="CPF" maxlength="11"> <br/>
                        <p> Telefone </p>
                        <input type="text" placeholder="Telefone"> <br/>
                        <p> E-mail </p>
                        <input type="text" placeholder="E-mail" maxlength="60" size="100"> <br/>
                    </div>
                    <div id="DadosFinanceiros" class="divSecaoFormulario fonte">
                        <h2 class="titulo"> Dados Financeiros </h2>
                        <p> Número do Cartão </p>
                        <input type="text" placeholder="Número do cartão"> <br/>
                        <p> Código de verificação </p>
                        <input type="text" placeholder="Código de verificação"> <br/>
                        <p>  Titular do cartão </p>
                        <input type="text" placeholder="Titular do cartão"> <br/>
                        <p> Data de validade </p>
                        <input type="text" placeholder="Data de validade"> <br/>
                    </div>
                        <h2 class="fonte" onclick="esconderDivEndereco()"> Endereço </h2>
                    <div id="endereco" class="divSecaoFormulario fonte" >
                            <p> CEP </p>
                            <input type="text" placeholder="CEP" id="cep" onblur="pesquisacep(this.value)"> <br/>
                            <p> Rua </p>
                            <input type="text" placeholder="Rua" id="rua"> <br/>
                            <p> Bairro </p>
                            <input type="text" placeholder="Bairro" id="bairro"> <br/>
                            <p> Cidade </p>
                            <input type="text" placeholder="Cidade" id="cidade"> <br/>
                            <p> UF </p>
                            <input type="text" placeholder="Estado" id="uf"> <br/>
                            <p> Número </p>
                            <input type="text" placeholder="Número"> <br/>
                            <p> Complemento </p>
                            <input type="text" placeholder="Complemento"> <br/>
                    </div>
                    <button type="submit"> Cadastrar <button>
                </form>
            </div>
        </div>
    </body>
</html>
