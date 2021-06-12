/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DAO;

import br.com.entidade.Produto;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Mathe
 */
public class ManterProduto extends DAO {
    public void inserir(Produto p) throws Exception {
    try {
    abrirBanco();
    String query = "INSERT INTO produto(codigo,titulo,descricao,preco) "
            + "values(null,?,?,?)";
    pst=(PreparedStatement) con.prepareStatement(query);
    pst.setString(1, p.getTitulo());
    pst.setString(2, p.getDescricao());
    pst.setDouble(3, p.getPreco());
    pst.execute();
    fecharBanco();
    } catch (Exception e) {
        System.out.println("Erro " + e.getMessage());
    }
    }
    //Metodo listar
    
    public ArrayList<Produto> pesquisarTudo () throws Exception {
       ArrayList<Produto> listausuarios = new ArrayList<Produto>();
         try{
         abrirBanco();  
         String query = "select * FROM produto";
         pst = con.prepareStatement(query);
         ResultSet rs = pst.executeQuery();
         Produto p ;
         while (rs.next()){ 
           p = new Produto();
           p.setCodigo(rs.getInt("codigo"));
           p.setTitulo(rs.getString("titulo"));
           p.setDescricao(rs.getString("descricao"));
           p.setPreco(rs.getDouble("preco"));
           p.setImg(rs.getString("img"));
           listausuarios.add(p); 
         } 
         fecharBanco();
       }catch (Exception e){
           System.out.println("Erro " + e.getMessage());
     } 
       return listausuarios;
     }
    
      public void deletar(Produto p) throws Exception{
         abrirBanco();
         String query = "delete FROM produto where codigo=?";
         pst=(PreparedStatement) con.prepareStatement(query);
         pst.setInt(1, p.getCodigo());
         pst.execute();
        fecharBanco();   
     }
      
      // metodo de pesquisar por id
      public Produto pesquisar(int codigo) throws Exception {
    try {
            Produto p = new Produto();
            //System.out.println(" Chegou no pesquisar registo" + id);
            abrirBanco();
            String query = "select * FROM produto where codigo=?";
            pst = con.prepareStatement(query);
            pst.setInt(1, codigo);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                p.setCodigo(rs.getInt("codigo"));
                p.setTitulo(rs.getString("titulo"));
                p.setDescricao(rs.getString("descricao"));
                p.setPreco(rs.getDouble("preco"));
                return p;
            }
            fecharBanco();
    } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
    }
    return null;
	}   
      
      public void alterar(Produto p) throws Exception {
       try {
    abrirBanco();
    String query = "UPDATE produto SET titulo=?,descricao=?,preco=?,img=? WHERE codigo=?";
    pst = con.prepareStatement(query);
    pst.setString(1, p.getTitulo());
    pst.setString(2, p.getDescricao());
    pst.setDouble(3, p.getPreco());
    pst.setString(4, p.getImg());
    pst.setInt(5, p.getCodigo());
    pst.executeUpdate();
    fecharBanco();
			
    } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
    }
	}

}
