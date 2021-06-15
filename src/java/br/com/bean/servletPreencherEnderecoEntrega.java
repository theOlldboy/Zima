/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.bean;

import br.com.DAO.ManterPedido;
import br.com.DAO.ManterUsuario;
import br.com.entidade.Cartao;
import br.com.entidade.Endereco;
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
public class servletPreencherEnderecoEntrega extends HttpServlet {

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
           
           
           ManterPedido mp = new ManterPedido();
           Endereco end = new Endereco();
           int codPedido = mp.pesquisarPedido();
           int codigoDoUsuario = Integer.valueOf(request.getParameter("codUsuario"));
           ManterUsuario mus = new ManterUsuario();
           Cartao card = new Cartao();
           
           String cep = request.getParameter("cepEntrega");
           String rua = request.getParameter("ruaEntrega");
           String bairro = request.getParameter("bairroEntrega");
           String cidade = request.getParameter("cidadeEntrega");
           String uf = request.getParameter("estadoEntrega");
           String numeroEndereco = request.getParameter("numeroEnderecoEntrega");
           String complemento = request.getParameter("complementoEntrega");
           String pontoReferencia = request.getParameter("pontoReferenciaEntrega");
           String local = request.getParameter("local");
           
           end.setCep(cep);
           end.setRua(rua);
           end.setBairro(bairro);
           end.setNumero(numeroEndereco);
           end.setpRef(pontoReferencia);
           
           mp.preencherEnderecoEntregaPedido(end, codPedido, local);
           
           card = mus.pesquisarDadosCartaoCliente(codigoDoUsuario);
            
           request.setAttribute("cod_usuarioCartao", card.getId_clienteCartao());
           request.setAttribute("numeroCartaoPag", card.getNumero());
           request.setAttribute("titularPag", card.getTitular());
           request.setAttribute("dataValidadePag", card.getDataValidade());
           request.setAttribute("cvvPag", card.getCvv());
           
           RequestDispatcher rd = request.getRequestDispatcher("efetuarPagamento.jsp");
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
            Logger.getLogger(servletPreencherEnderecoEntrega.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(servletPreencherEnderecoEntrega.class.getName()).log(Level.SEVERE, null, ex);
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
