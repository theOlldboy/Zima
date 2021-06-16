/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.bean;

import br.com.DAO.ManterItensPedido;
import br.com.DAO.ManterPagamento;
import br.com.DAO.ManterPedido;
import br.com.DAO.ManterProduto;
import br.com.DAO.ManterUsuario;
import br.com.entidade.ItemPedido;
import br.com.entidade.Pagamento;
import br.com.entidade.Pedido;
import br.com.entidade.Produto;
import br.com.entidade.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mathe
 */
public class buscaPedidoDetalhado extends HttpServlet {

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
            int codigoPedido = Integer.valueOf(request.getParameter("codigoPed"));
            
            Usuario us = new Usuario();
//            ItemPedido ip = new ItemPedido();
            Pagamento pg = new Pagamento();
            Pedido ped = new Pedido();
//            Produto produto = new Produto();
            
            ManterPedido daoped = new ManterPedido();
      
            ped = daoped.pesquisarPedidoParaEntrega(codigoPedido);
            request.setAttribute("codigoCli", ped.getCod_cli());
            request.setAttribute("valor", ped.getValor());
            request.setAttribute("data", ped.getData());
            request.setAttribute("cep", ped.getCepEntrega());
            request.setAttribute("bairro", ped.getBairroEntrega());
            request.setAttribute("rua", ped.getRuaEntrega());
            request.setAttribute("numero", ped.getNumeroEntrega());
            request.setAttribute("pRef", ped.getpRefEntrega());
            request.setAttribute("status", ped.getStatus());
            request.setAttribute("local", ped.getLocal());
            
            int id = (int) ped.getCod_cli();
            ManterUsuario daous = new ManterUsuario();
            us = daous.pesquisarDadosPessoaisCliente(id);
            request.setAttribute("nome", us.getNome());
            
//            ManterItensPedido daoip = new ManterItensPedido();
//            ip = daoip.pesquisarPorPedido(codigoPedido);
//            request.setAttribute("id_item",ip.getId_item());
//            request.setAttribute("cod_produto",ip.getCod_produto());
//            request.setAttribute("qtde",ip.getQtde());
//            request.setAttribute("tipo_bebida",ip.getBebida());
//            request.setAttribute("qtde_bebida",ip.getQtdeBebida());
            
//            int codigo = ip.getCod_produto();
//            ManterProduto daoprod = new ManterProduto();
//            produto = daoprod.pesquisar(codigo);
//            request.setAttribute("titulo", produto.getTitulo());
            
            ManterPagamento daopg = new ManterPagamento();
            pg = daopg.pesquisarPagamento(codigoPedido);
            request.setAttribute("forma", pg.getForma());
            request.setAttribute("status", pg.getStatus());
            
            
            RequestDispatcher rd = request.getRequestDispatcher("listaPedidoDetalhado.jsp");
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
            Logger.getLogger(buscaPedidoDetalhado.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(buscaPedidoDetalhado.class.getName()).log(Level.SEVERE, null, ex);
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
