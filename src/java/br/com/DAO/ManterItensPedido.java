/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DAO;

import br.com.entidade.ItemPedido;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;

/**
 *
 * @author Joao
 */
public class ManterItensPedido extends DAO {
    
    public void inserirItensPedido(ItemPedido itp) throws Exception {
    try {
    abrirBanco();
    String query = "INSERT INTO itens_pedido(id,id_item,cod_pedido,cod_produto,qtde,tipo_bebida, qtde_bebida) "
            + "values(null,?,?,?,?,?,?)";
    pst=(PreparedStatement) con.prepareStatement(query);
    pst.setInt(1, itp.getId_item());
    pst.setInt(2, itp.getCod_pedido());
    pst.setInt(3, itp.getCod_produto());
    pst.setInt(4, itp.getQtde());
    pst.setString(5, itp.getBebida());
    pst.setInt(6, itp.getQtdeBebida());
    pst.execute();
    fecharBanco();
    } catch (Exception e) {
        System.out.println("Erro " + e.getMessage());
    }
    }
    
          public ItemPedido pesquisarPorPedido(int codigoPed) throws Exception {
    try {
            ItemPedido ip = new ItemPedido();
            abrirBanco();
            String query = "select * FROM itens_pedido where cod_pedido=?";
            pst = con.prepareStatement(query);
            pst.setInt(1, codigoPed);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                ip.setId_item(rs.getInt("id_item"));
                ip.setCod_produto(rs.getInt("cod_produto"));
                ip.setQtde(rs.getInt("qtde"));
                ip.setBebida(rs.getString("tipo_bebida"));
                ip.setQtdeBebida(rs.getInt("qtde_bebida"));
                return ip;
            }
            fecharBanco();
    } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
    }
    return null;
	}
          
              public ArrayList<ItemPedido> pesquisarTudo (int codigoPed) throws Exception {
       ArrayList<ItemPedido> listaitens = new ArrayList<ItemPedido>();
         try{
         abrirBanco();  
         String query = "select * FROM itens_pedido where cod_pedido=?";
         pst = con.prepareStatement(query);
         pst.setInt(1, codigoPed);
         ResultSet rs = pst.executeQuery();
         ItemPedido ip ;
         while (rs.next()){ 
           ip = new ItemPedido();
           ip.setId_item(rs.getInt("id_item"));
           ip.setCod_produto(rs.getInt("cod_produto"));
           ip.setQtde(rs.getInt("qtde"));
           ip.setBebida(rs.getString("tipo_bebida"));
           ip.setQtdeBebida(rs.getInt("qtde_bebida"));
           listaitens.add(ip); 
         } 
         fecharBanco();
       }catch (Exception e){
           System.out.println("Erro " + e.getMessage());
     } 
       return listaitens;
     }
}
    
