<%-- 
    Document   : preencherEndereco
    Created on : 12/06/2021, 15:41:44
    Author     : Joao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Endereço de Entrega</title>
        <style>
            body {
                margin: 0;
                background-color: #798b52;
            }
            
            .botaoLocalizacao {
               background-color: #dfb649;
               color:#2d2c28;
               padding:4px;
               border: none;
               width: 40px;
            }
            
            .botaoLocalizacao:hover {
                background-color: #2d2c28;
                color:#dfb649;
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
            
            .posicaoFormularioNumero {
                margin-left:120px;
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
        <script>
            //Função que captura coordenadas

            function getLocation() {
              if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(setPosition);
                document.getElementById('cep').value="";
                document.getElementById('rua').value="";
                document.getElementById('bairro').value="";
                document.getElementById('cidade').value="";
                document.getElementById('uf').value="";
                document.getElementById('complemento').value="";
                document.getElementById('pRef').value="";
                document.getElementById('numeroEndereco').value="";
                
                
              } else {
                alert("Geolocation is not supported by this browser.");
              }
            }

            function setPosition(position) {
                var latlon = position.coords.latitude + "," + position.coords.longitude;
                document.getElementById('local').value=(latlon);                
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
    <body>
        <%
            String codigoUsuarioLogin = (String) String.valueOf(session.getAttribute("codigoUsuario"));
            
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
        <%@include file="MenuClienteLogado.jsp"%> 
            <div class="jumbotron jumbotron-fluid jumbotromMeu">
                <div class="container fundoJumbotron">
                    <h1 class="fonte"> Endereço de Entrega </h1> <br/>
                    
                    <div id="endereco" class="divSecaoFormulario fonteInputs comecarInvisivel" >
                        <form action="EnderecoEntrega" method="POST"> 
                            <h1> Quer usar o endereço já cadastrado ? </h1> <br/>
                            <label> CEP: </label>
                            <input type="text" placeholder="CEP" id="cep" onblur="pesquisacep(this.value)" name="cepEntrega" value="<%=cep%>">
                            <label> Rua: </label>
                            <input type="text" placeholder="Rua" id="rua" size="53px" name="ruaEntrega" value="<%=rua%>"> <br/> 
                            <label> Bairro: </label>
                            <input type="text" placeholder="Bairro" id="bairro" size="28px" name="bairroEntrega" maxlength="30" value="<%=bairro%>"> 
                            <label> Cidade: </label>
                            <input type="text" placeholder="Cidade" id="cidade" size="41px" name="cidadeEntrega" value="<%=cidade%>"> <br/>
                            <label> UF: </label>
                            <input type="text" placeholder="Estado" id="uf" size="11px" name="estadoEntrega" value="<%=uf%>">
                            <label class="posicaoFormularioNumero"> Número: </label>
                            <input type="text" placeholder="Número" size="45px" name="numeroEnderecoEntrega" id="numeroEndereco" value="<%=numero%>"> <br/>
                            <label> Complemento: </label>
                            <input type="text" placeholder="Complemento" size="74px" name="complementoEntrega" id="complemento" value="<%=complemento%>"> <br/> 
                            <label> Ponto de Referência: </label>
                            <input type="text" placeholder="Ponto de Referência" size="67px" name="pontoReferenciaEntrega" id="pRef" value="<%=pRef%>"> <br/> <br/>
                            <input type="hidden" name="codUsuario" value="<%=codigoUsuarioLogin%>">
                            

                            <h1> Ou prefere fornecer sua localização ? <button type="button" class="btn btn-outline-secondary botaoLocalizacao" onclick="getLocation()"> <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-pin-angle-fill" viewBox="0 0 16 16">
  <path d="M9.828.722a.5.5 0 0 1 .354.146l4.95 4.95a.5.5 0 0 1 0 .707c-.48.48-1.072.588-1.503.588-.177 0-.335-.018-.46-.039l-3.134 3.134a5.927 5.927 0 0 1 .16 1.013c.046.702-.032 1.687-.72 2.375a.5.5 0 0 1-.707 0l-2.829-2.828-3.182 3.182c-.195.195-1.219.902-1.414.707-.195-.195.512-1.22.707-1.414l3.182-3.182-2.828-2.829a.5.5 0 0 1 0-.707c.688-.688 1.673-.767 2.375-.72a5.922 5.922 0 0 1 1.013.16l3.134-3.133a2.772 2.772 0 0 1-.04-.461c0-.43.108-1.022.589-1.503a.5.5 0 0 1 .353-.146z"/>
</svg> </button></h1> <br/>
                            
                           
                            
  
  <input type="text" name="local" id="local"size="30px"/> <br/> <br/>
  <button type="submit" class="botaoFazerPedido">Próximo <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
</svg></button>
                       </form> 
                    </div>
                </div>
            </div> <br/> <br/> <br/> <br/> <br/> <br/><br/> <br/> 
        <%@include file="rodaPe.jsp"%>
    </body>
</html>
