/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.entidade;

/**
 *
 * @author Joao
 */
public class ItemPedido {
    private int id_item;
    private int cod_pedido;
    private int cod_produto;
    private int qtde;
    private String bebida;
    private int qtdeBebida;

    public String getBebida() {
        return bebida;
    }

    public void setBebida(String bebida) {
        this.bebida = bebida;
    }

    public int getQtdeBebida() {
        return qtdeBebida;
    }

    public void setQtdeBebida(int qtdeBebida) {
        this.qtdeBebida = qtdeBebida;
    }

    public int getId_item() {
        return id_item;
    }

    public void setId_item(int id_item) {
        this.id_item = id_item;
    }

    public int getCod_pedido() {
        return cod_pedido;
    }

    public void setCod_pedido(int cod_pedido) {
        this.cod_pedido = cod_pedido;
    }

    public int getCod_produto() {
        return cod_produto;
    }

    public void setCod_produto(int cod_produto) {
        this.cod_produto = cod_produto;
    }

    public int getQtde() {
        return qtde;
    }

    public void setQtde(int qtde) {
        this.qtde = qtde;
    }
    
    public ItemPedido gerarItemPedido(int codProd, int qtdProd, int idItem, int codPedido) {
        ItemPedido itp = new ItemPedido();
        itp.setCod_produto(codProd);
        itp.setQtde(qtdProd);
        itp.setId_item(idItem); 
        itp.setCod_pedido(codPedido);
        
        return itp;
    }
    
}
