/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DAO;

import br.com.entidade.ItemPedido;
import java.sql.PreparedStatement;
import java.util.Calendar;

/**
 *
 * @author Joao
 */
public class ManterItensPedido extends DAO {
    
    public void inserirItensPedido(ItemPedido itp) throws Exception {
    try {
    abrirBanco();
    String query = "INSERT INTO itens_pedido(id,id_item,cod_pedido,cod_produto,qtde) "
            + "values(null,?,?,?,?)";
    pst=(PreparedStatement) con.prepareStatement(query);
    pst.setInt(1, itp.getId_item());
    pst.setInt(2, itp.getCod_pedido());
    pst.setInt(3, itp.getCod_produto());
    pst.setInt(4, itp.getQtde());
    pst.execute();
    fecharBanco();
    } catch (Exception e) {
        System.out.println("Erro " + e.getMessage());
    }
    }  
}
    
