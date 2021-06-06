/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.bean;

import br.com.DAO.ManterUsuario;
import br.com.entidade.Cartao;
import br.com.entidade.Endereco;
import br.com.entidade.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joao
 */
public class servletAlterarDadosCadastrais extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           int codigoUsuario = Integer.valueOf(request.getParameter("codigoUsuario")); 
           String nome_cliente = request.getParameter("nomeClienteAlterado");
           String email = request.getParameter("emailClienteAlterado");
           String senha = request.getParameter("senhaAlterado");
           String telefone = request.getParameter("telefoneAlterado");
           
           //Capturando dados da seção "Dados do cartão"
           String numeroCartao = request.getParameter("numeroCartaoAlterado");
           String codigoVerificacao = request.getParameter("cvvAlterado");
           String titularCartao = request.getParameter("titularCartaoAlterado");
           String dataValidade = request.getParameter("validadeCartaoAlterado");
           
           //Capturando dados da seção "Endereço"
           String cep = request.getParameter("cepAlterado");
           String rua = request.getParameter("ruaAlterado");
           String bairro = request.getParameter("bairroAlterado");
           String cidade = request.getParameter("cidadeAlterado");
           String uf = request.getParameter("estadoAlterado");
           String numeroEndereco = request.getParameter("numeroEnderecoAlterado");
           String complemento = request.getParameter("complementoAlterado");
           String pontoReferencia = request.getParameter("pontoReferenciaAlterado");
           
           Usuario us = new Usuario();
           Cartao card = new Cartao();
           Endereco end = new Endereco();
           
           ManterUsuario mu = new ManterUsuario();
           
           //Alterando dados Pessoais
           us.setCodigo(codigoUsuario);
           us.setNome(nome_cliente);
           us.setEmail(email);
           us.setSenha(senha);
           us.setTelefone(telefone);
           mu.alterarDadosPessoais(us);
           
           //Alterando dados do cartão
           card.setId_clienteCartao(codigoUsuario);
           card.setCvv(codigoVerificacao);
           card.setTitular(titularCartao);
           card.setNumero(numeroCartao);
           card.setDataValidade(dataValidade);
           mu.alterarDadosCartao(card);
           
           //Alterando Endereco
           end.setId_cliente(codigoUsuario);
           end.setCep(cep);
           end.setBairro(bairro);
           end.setCidade(cidade);
           end.setComplemento(complemento);
           end.setNumero(numeroEndereco);
           end.setRua(rua);
           end.setUf(uf);
           end.setpRef(pontoReferencia);
           mu.alterarEndereco(end);
           
           RequestDispatcher rd = request.getRequestDispatcher("paginaPrincipalLoginCliente.jsp");
           rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(servletAlterarDadosCadastrais.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(servletAlterarDadosCadastrais.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
