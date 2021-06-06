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
public class servletBuscarDadosUsuarioLogado extends HttpServlet {

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
            int codigoDoUsuario = Integer.valueOf(request.getParameter("codigo"));
            
            Usuario us = new Usuario();
            Endereco end = new Endereco();
            Cartao card = new Cartao();
            
            ManterUsuario mus = new ManterUsuario();
            
            us = mus.pesquisarDadosPessoaisCliente(codigoDoUsuario);
            
            request.setAttribute("codigo", us.getCodigo());
            request.setAttribute("nome", us.getNome());
            request.setAttribute("email", us.getEmail());
            request.setAttribute("senha", us.getSenha());
            request.setAttribute("telefone", us.getTelefone());
            
            card = mus.pesquisarDadosCartaoCliente(codigoDoUsuario);
            
            request.setAttribute("cod_usuarioCartao", card.getId_clienteCartao());
            request.setAttribute("numeroCartao", card.getNumero());
            request.setAttribute("titular", card.getTitular());
            request.setAttribute("dataValidade", card.getDataValidade());
            request.setAttribute("cvv", card.getCvv());

            end = mus.pesquisarEnderecoCliente(codigoDoUsuario);
            
            request.setAttribute("cod_usuarioEndereco", end.getId_cliente());
            request.setAttribute("cep", end.getCep());
            request.setAttribute("cidade", end.getCidade());
            request.setAttribute("uf", end.getUf());
            request.setAttribute("bairro", end.getBairro());
            request.setAttribute("rua", end.getRua());
            request.setAttribute("numero", end.getNumero());
            request.setAttribute("complemento", end.getComplemento());
            request.setAttribute("pRef", end.getpRef());
            
            RequestDispatcher rd = request.getRequestDispatcher("formAlterarPerfilCliente.jsp");
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
            Logger.getLogger(servletBuscarDadosUsuarioLogado.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(servletBuscarDadosUsuarioLogado.class.getName()).log(Level.SEVERE, null, ex);
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
