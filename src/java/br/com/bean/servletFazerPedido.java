/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.bean;

import br.com.DAO.ManterItensPedido;
import br.com.DAO.ManterPedido;
import br.com.DAO.ManterProduto;
import br.com.DAO.ManterUsuario;
import br.com.entidade.Endereco;
import br.com.entidade.ItemPedido;
import br.com.entidade.Pedido;
import br.com.entidade.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joao
 */
public class servletFazerPedido extends HttpServlet {

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
            
            int codigoDoUsuario = Integer.valueOf(request.getParameter("codUsuario"));
            int codProd;
            int qtdProd=0;
            int idItem=0; 
            double valorPedido=0.0;
            double pVend;
            ManterProduto dao = new ManterProduto();
            Produto p = new Produto();
            Pedido ped = new Pedido();
            Endereco end = new Endereco();
            ManterUsuario mus = new ManterUsuario();
            ManterPedido mp = new ManterPedido();
            ManterItensPedido mitp = new ManterItensPedido();
            
            end = mus.pesquisarEnderecoCliente(codigoDoUsuario);
           
            ArrayList<Produto> produto = dao.pesquisarTudo();
            for (int i=0; i < produto.size(); i++) {
                qtdProd = Integer.valueOf(request.getParameter("qtd"+i));
                p = produto.get(i);
                codProd=Integer.valueOf(request.getParameter("codigoProduto"+i));
                pVend = Double.valueOf(request.getParameter("pVendProduto"+i));
                valorPedido = valorPedido + (qtdProd * pVend);
                
                if(qtdProd != 0) {
                  idItem = idItem + 1; 
                  ItemPedido itp = new ItemPedido();
                  itp.setCod_produto(codProd);
                  itp.setQtde(qtdProd);
                  itp.setId_item(idItem); 
                  itp.setCod_pedido(mp.pesquisarPedido());
                  mitp.inserirItensPedido(itp);
                }
            }
            //Criando um pedido
                ped.setValor(valorPedido);
                ped.setCepEntrega(end.getCep());
                ped.setBairroEntrega(end.getBairro());
                ped.setRuaEntrega(end.getRua());
                ped.setNumeroEntrega(end.getNumero());
                ped.setpRefEntrega(end.getpRef());
                ped.setStatus();
                mp.inserir(ped);
                
                
                
            
        
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
            Logger.getLogger(servletFazerPedido.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(servletFazerPedido.class.getName()).log(Level.SEVERE, null, ex);
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
