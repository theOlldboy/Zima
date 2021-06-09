/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DAO;

import br.com.entidade.Pedido;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


/**
 *
 * @author Mathe
 */
public class ManterPedido extends DAO{
    public void inserir(Pedido p) throws Exception {
    try {
    abrirBanco();
    String query = "INSERT INTO pedido(codigo,cod_produto,valor,local) "
            + "values(null,?,?,?)";
    pst=(PreparedStatement) con.prepareStatement(query);
    pst.setInt(1, p.getCodigoItems());
    pst.setDouble(2, p.getValor());
    pst.setString(3, p.getLocalizacao());
    pst.execute();
    fecharBanco();
    } catch (Exception e) {
        System.out.println("Erro " + e.getMessage());
    }
    }
    //Metodo listar
    
    public ArrayList<Pedido> pesquisarTudo () throws Exception {
       ArrayList<Pedido> listausuarios = new ArrayList<Pedido>();
         try{
         abrirBanco();  
         String query = "select codigo,cod_produto,valor,local FROM pedido";
         pst = con.prepareStatement(query);
         ResultSet rs = pst.executeQuery();
         Pedido p ;
         while (rs.next()){ 
           p = new Pedido();
           p.setCodigo(rs.getInt("codigo"));
           p.setCodigoItems(rs.getInt("cod_produto"));
           p.setValor(rs.getDouble("valor"));
           p.setLocalizacao(rs.getString("local"));
           listausuarios.add(p); 
         } 
         fecharBanco();
       }catch (Exception e){
           System.out.println("Erro " + e.getMessage());
     } 
       return listausuarios;
     }
    
      public void deletar(Pedido p) throws Exception{
         abrirBanco();
         String query = "delete FROM pedido where codigo=?";
         pst=(PreparedStatement) con.prepareStatement(query);
         pst.setInt(1, p.getCodigo());
         pst.execute();
        fecharBanco();   
     }
      
      // metodo de pesquisar por id
      public Pedido pesquisar(int codigo) throws Exception {
    try {
            Pedido p = new Pedido();
            //System.out.println(" Chegou no pesquisar registo" + id);
            abrirBanco();
            String query = "select * FROM pedido where codigo=?";
            pst = con.prepareStatement(query);
            pst.setInt(1, codigo);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                p.setCodigo(rs.getInt("codigo"));
                p.setCodigoItems(rs.getInt("cod_produto"));
                p.setValor(rs.getDouble("valor"));
                p.setLocalizacao(rs.getString("local"));
                return p;
            }
            fecharBanco();
    } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
    }
    return null;
	}   
      
      public void alterar(Pedido p) throws Exception {
       try {
    abrirBanco();
    String query = "UPDATE pedido SET cod_produto=?,valor=?,local=? WHERE codigo=?";
    pst = con.prepareStatement(query);
    pst.setInt(1, p.getCodigoItems());
    pst.setDouble(2, p.getValor());
    pst.setString(3, p.getLocalizacao());
    pst.setInt(4, p.getCodigo());
    pst.executeUpdate();
    fecharBanco();
			
    } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
    }
	}
}
