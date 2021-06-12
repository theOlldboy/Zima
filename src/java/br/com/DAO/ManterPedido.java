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
import java.util.Calendar;


/**
 *
 * @author Mathe
 */
public class ManterPedido extends DAO{
    public void inserir(Pedido p) throws Exception {
    try {
    abrirBanco();
    String query = "INSERT INTO pedido(codigo,valor,data,cep_entrega,bairro_entrega,rua_entrega,numero_entrega,pRef_entrega,status) "
            + "values(null,?,?,?,?,?,?,?,?)";
    pst=(PreparedStatement) con.prepareStatement(query);
    pst.setDouble(1, p.getValor());
    pst.setDate(2, new java.sql.Date(Calendar.getInstance().getTimeInMillis()));
    pst.setString(3, p.getCepEntrega());
    pst.setString(4, p.getBairroEntrega());
    pst.setString(5, p.getRuaEntrega());
    pst.setString(6, p.getNumeroEntrega());
    pst.setString(7, p.getpRefEntrega());
    pst.setString(8, p.getStatus());
    pst.execute();
    fecharBanco();
    } catch (Exception e) {
        System.out.println("Erro " + e.getMessage());
    }
    }
    
    public int pesquisarPedido() throws Exception {
    try {
            int ultimoCodigoInserido;
            //System.out.println(" Chegou no pesquisar registo" + id);
            abrirBanco();
            String query = "SELECT LAST_INSERT_ID(codigo) as ultimoInserido from pedido order by LAST_INSERT_ID(codigo) desc limit 1";
            pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                ultimoCodigoInserido = rs.getInt("ultimoInserido");
                return ultimoCodigoInserido;
            }
            fecharBanco();
    } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
    }
    return 0;
	}   
    
    
    public void GeraPedido(Pedido p) throws Exception{
        try {
            abrirBanco();
            String query = "INSERT INTO pedido (codigo) values (null)";
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
    pst.setInt(4, p.getCodigo());
    pst.executeUpdate();
    fecharBanco();
			
    } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
    }
	}
}
