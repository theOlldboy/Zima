/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.bean;

import br.com.entidade.Cartao;
import br.com.entidade.Endereco;
import br.com.entidade.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joao
 */
public class servletCadastrarClientes extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           //Capturando dados da seção "Dados Pessoais"
           String nome_cliente = request.getParameter("nomeCliente");
           String cpf = request.getParameter("cpf");
           String email = request.getParameter("emailCliente");
           String senha = request.getParameter("senha");
           
           //Capturando dados da seção "Dados do cartão"
           String numeroCartao = request.getParameter("numeroCartao");
           String codigoVerificacao = request.getParameter("cvv");
           String titularCartao = request.getParameter("titularCartao");
           String dataValidade = request.getParameter("validadeCartao");
           
           //Capturando dados da seção "Endereço"
           String cep = request.getParameter("cep");
           String rua = request.getParameter("rua");
           String bairro = request.getParameter("bairro");
           String cidade = request.getParameter("cidade");
           String uf = request.getParameter("estado");
           String numeroEndereco = request.getParameter("numeroEndereco");
           String complemento = request.getParameter("complemento");
           String pontoReferencia = request.getParameter("pontoReferencia");
           
           Usuario cliente = new Usuario();
           Cartao cartaoCliente = new Cartao();
           Endereco enderecoCliente = new Endereco();
           
           cliente.criarUsuarioCliente(); // Esse método define, no banco, se o tipo do usuário 
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
        processRequest(request, response);
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
        processRequest(request, response);
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
